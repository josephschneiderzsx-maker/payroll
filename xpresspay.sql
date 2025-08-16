/* ===========================================================
   0) Sécurité d’exécution
   =========================================================== */
SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0;
SET FOREIGN_KEY_CHECKS=0;

/* ===========================================================
   1) Base & utilisateur
   =========================================================== */
CREATE DATABASE IF NOT EXISTS xpresspay
  CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- (Optionnel) remettre au propre l’utilisateur local
DROP USER IF EXISTS 'xpresspay'@'localhost';

CREATE USER 'xpresspay'@'localhost' IDENTIFIED BY '1Txpr55@PAY';

-- Droits : lecture sur ingress, pleins droits sur xpresspay
GRANT SELECT ON ingress.* TO 'xpresspay'@'localhost';
GRANT ALL PRIVILEGES ON xpresspay.* TO 'xpresspay'@'localhost';
FLUSH PRIVILEGES;

USE xpresspay;

/* ===========================================================
   2) VUES temps réel vers Ingress (noms normalisés)
   =========================================================== */

-- 2.1 Départements (depuis user_group.gName)
CREATE OR REPLACE VIEW departments AS
SELECT
  ug.id         AS dept_id,
  ug.gName      AS dept_name,
  ug.parentId   AS parent_id,
  ug.depth,
  ug.path,
  ug.color_code
FROM ingress.user_group ug;

-- 2.2 Employés (poste = designation, département = gName)
CREATE OR REPLACE VIEW employees AS
SELECT
  u.Auto_No                         AS auto_no,
  u.userid                          AS userid,
  u.ic,
  u.Username                        AS username,
  u.Name                            AS first_name,
  u.lastname                        AS last_name,
  CONCAT(COALESCE(u.Name,''),' ',COALESCE(u.lastname,'')) AS full_name,
  u.Address,
  u.Phone,
  u.Email,
  ug.gName                          AS department,   -- ← department normalisé
  u.User_Group                      AS department_id,
  u.designation                     AS designation,  -- ← position/poste
  u.Gender,
  u.DOB,
  u.IssueDate,
  u.expirydate,
  u.pictureflag,
  u.Remark,
  u.SuspendedDate,
  u.CreateDate                      AS hire_date,
  u.LastUpdate                      AS last_update,
  u.pay_rate,
  u.pay_type,
  u.nationality,
  u.maritalstatus,
  u.religion,
  u.race,
  u.ename,
  u.econtact,
  u.erelation
FROM ingress.user u
LEFT JOIN ingress.user_group ug
  ON ug.id = u.User_Group;

-- 2.3 Présences (brut Ingress : heures, OT, short)
CREATE OR REPLACE VIEW attendance AS
SELECT
  a.idattendance_sheet,
  a.userid,
  a.date,
  a.daytype,
  a.leavetype,
  a.sche1,
  a.shiftNo,
  a.att_in         AS time_in,
  a.att_break      AS break_start,
  a.att_resume     AS break_end,
  a.att_out        AS time_out,
  a.att_ot,
  a.att_done,
  a.workhour,
  a.othour         AS overtime_hours,
  a.shorthour      AS short_hours,
  a.hasmisspunch,
  a.createdate,
  a.lastupdate,
  a.SumWork,
  a.SumOT,
  a.SumShort,
  a.TotWork,
  a.TotOT
FROM ingress.attendance a;

-- 2.4 Horaires prévus (planning)
-- Si vos colonnes diffèrent, on expose tout pour ne rien perdre.
CREATE OR REPLACE VIEW schedules AS
SELECT * FROM ingress.schedule;

CREATE OR REPLACE VIEW schedule_details AS
SELECT * FROM ingress.schedule_detail;

-- 2.5 Jours fériés (brut Ingress)
CREATE OR REPLACE VIEW holidays AS
SELECT
  h.idholiday_date,
  h.holidayname,
  h.holidayid,
  h.startmonth,
  h.startday,
  h.endmonth,
  h.endday,
  h.year,
  h.TZIndex,
  h.createdate,
  h.lastupdate
FROM ingress.holiday_date h;

-- 2.6 Types de congés
-- Si la table n’existe pas côté Ingress, commentez cette vue.
CREATE OR REPLACE VIEW leave_types AS
SELECT * FROM ingress.leavetype;

-- 2.7 Utilisateurs système (appli Ingress)
CREATE OR REPLACE VIEW system_users AS
SELECT
  su.id            AS sys_user_id,
  su.username,
  su.password,           -- hash tel quel
  su.RolesID       AS role_id,
  su.activeFlag    AS is_active,
  su.email,
  su.createdDate,
  su.passwordUpdateOn
FROM ingress.system_user su;

-- 2.8 Informations entreprise (systemsetting_company)
CREATE OR REPLACE VIEW company_info AS
SELECT
  sc.id            AS company_id,
  sc.CompanyName   AS company_name,
  sc.Email         AS email,
  sc.Address1      AS address_line1,
  sc.Address2      AS address_line2,
  sc.City          AS city,
  sc.State         AS state,
  sc.Country       AS country,
  sc.Zip           AS zip,
  sc.phone,
  sc.fax,
  sc.timezone,
  sc.report_logo   AS logo,
  sc.watermark,
  sc.ShowWatermarkFlag,
  sc.FirstStartup,
  sc.DateStart
FROM ingress.systemsetting_company sc;

/* ===========================================================
   3) Tables LOCALES (propriété XpressPay)
      → ici vous gérez vos propres règles : périodes, taxes, OT, etc.
   =========================================================== */

-- 3.1 Périodes de paie
DROP TABLE IF EXISTS payroll_periods;
CREATE TABLE payroll_periods (
  id               INT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
  period_name      VARCHAR(100) NOT NULL,      -- ex: "Août 2025 - Quinz 1"
  date_start       DATE NOT NULL,
  date_end         DATE NOT NULL,
  frequency        ENUM('weekly','biweekly','monthly','custom') NOT NULL DEFAULT 'biweekly',
  is_open          TINYINT(1) NOT NULL DEFAULT 1,
  locked_at        DATETIME NULL,
  created_at       TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
  UNIQUE KEY uq_period_range (date_start, date_end)
) ENGINE=InnoDB;

-- 3.2 Paramétrage global (taux par défaut)
DROP TABLE IF EXISTS payroll_settings;
CREATE TABLE payroll_settings (
  id                  TINYINT UNSIGNED PRIMARY KEY,
  default_ot_multiplier DECIMAL(5,2) NOT NULL DEFAULT 1.50, -- ex: 1.5x
  default_meal_code     INT NULL,         -- si vous utilisez workcode côté Ingress (auditdata)
  default_meal_rate     DECIMAL(10,2) NOT NULL DEFAULT 0.00,
  currency              VARCHAR(10) NOT NULL DEFAULT 'HTG',
  locale                VARCHAR(10) NOT NULL DEFAULT 'fr-HT',
  rounding_rule         ENUM('none','half_up_0.5','ceil_0.25') DEFAULT 'none',
  updated_at            TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB;
INSERT INTO payroll_settings (id) VALUES (1) ON DUPLICATE KEY UPDATE id=VALUES(id);

-- 3.3 Règles OT (multiplicateurs spécifiques, ex: jours fériés)
DROP TABLE IF EXISTS ot_rules;
CREATE TABLE ot_rules (
  id             INT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
  rule_name      VARCHAR(100) NOT NULL,            -- ex: "Férié national"
  condition_type ENUM('weekday','holiday','leave_type','manual') NOT NULL,
  condition_value VARCHAR(100) NULL,               -- ex: 'sat','sun', idholiday_date, leave_id
  multiplier     DECIMAL(5,2) NOT NULL DEFAULT 1.50,
  active         TINYINT(1) NOT NULL DEFAULT 1,
  created_at     TIMESTAMP DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB;

-- 3.4 Catalogue de taxes & déductions (taux gérés par le manager)
DROP TABLE IF EXISTS deduction_types;
CREATE TABLE deduction_types (
  id             INT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
  code           VARCHAR(30) NOT NULL,         -- ex: 'ONA', 'TAX_LOCAL', 'MEAL'
  label          VARCHAR(120) NOT NULL,
  method         ENUM('percent_of_gross','percent_of_net','fixed_amount') NOT NULL,
  rate           DECIMAL(10,4) NOT NULL DEFAULT 0.0000,   -- ex: 0.0600 = 6%
  applies_to     ENUM('all','selected_employees') NOT NULL DEFAULT 'all',
  is_mandatory   TINYINT(1) NOT NULL DEFAULT 0,
  active         TINYINT(1) NOT NULL DEFAULT 1,
  created_at     TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
  UNIQUE KEY uq_deduction_code (code)
) ENGINE=InnoDB;

-- 3.5 Affectations de déductions par employé
DROP TABLE IF EXISTS employee_deductions;
CREATE TABLE employee_deductions (
  id             BIGINT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
  userid         VARCHAR(30) NOT NULL,     -- clé Ingress
  deduction_id   INT UNSIGNED NOT NULL,
  active         TINYINT(1) NOT NULL DEFAULT 1,
  start_date     DATE NULL,
  end_date       DATE NULL,
  created_at     TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
  CONSTRAINT fk_empded_ded FOREIGN KEY (deduction_id) REFERENCES deduction_types(id)
    ON UPDATE CASCADE ON DELETE CASCADE
) ENGINE=InnoDB;
CREATE INDEX idx_empded_user ON employee_deductions (userid);

-- 3.6 Emprunts (Bank / ONA / autres)
DROP TABLE IF EXISTS employee_loans;
CREATE TABLE employee_loans (
  id               BIGINT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
  userid           VARCHAR(30) NOT NULL,
  loan_type        ENUM('bank','ona','other') NOT NULL,
  principal_amount DECIMAL(12,2) NOT NULL,
  start_deduction  DATE NOT NULL,
  installment_amt  DECIMAL(12,2) NOT NULL,
  periodicity      ENUM('biweekly','monthly') NOT NULL DEFAULT 'biweekly',
  active           TINYINT(1) NOT NULL DEFAULT 1,
  created_at       TIMESTAMP DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB;
CREATE INDEX idx_loans_user ON employee_loans (userid, active);

-- 3.7 Suppléments/Incomes (incentives, primes fixes, etc.)
DROP TABLE IF EXISTS employee_incomes;
CREATE TABLE employee_incomes (
  id               BIGINT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
  userid           VARCHAR(30) NOT NULL,
  income_type      ENUM('rate_override','incentive','extra','other') NOT NULL,
  amount           DECIMAL(12,2) NOT NULL,
  pay_type         ENUM('once','recurring') NOT NULL DEFAULT 'recurring',
  effective_from   DATE NULL,
  effective_to     DATE NULL,
  active           TINYINT(1) NOT NULL DEFAULT 1,
  note             VARCHAR(255) NULL,
  created_at       TIMESTAMP DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB;
CREATE INDEX idx_incomes_user ON employee_incomes (userid, active);

-- 3.8 Lancement & historique de paie (enregistre les runs)
DROP TABLE IF EXISTS payroll_runs;
CREATE TABLE payroll_runs (
  id             BIGINT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
  period_id      INT UNSIGNED NOT NULL,
  status         ENUM('calculated','reviewed','approved','locked') NOT NULL DEFAULT 'calculated',
  created_by     INT NULL,       -- id user applicatif (map sur system_users si besoin)
  created_at     TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
  locked_by      INT NULL,
  locked_at      DATETIME NULL,
  CONSTRAINT fk_runs_period FOREIGN KEY (period_id) REFERENCES payroll_periods(id)
    ON UPDATE CASCADE ON DELETE RESTRICT
) ENGINE=InnoDB;

-- 3.9 Détails de paie par employé (résultats du calcul)
DROP TABLE IF EXISTS payroll_run_items;
CREATE TABLE payroll_run_items (
  id               BIGINT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
  run_id           BIGINT UNSIGNED NOT NULL,
  userid           VARCHAR(30) NOT NULL,
  gross_income     DECIMAL(12,2) NOT NULL DEFAULT 0.00,
  total_deductions DECIMAL(12,2) NOT NULL DEFAULT 0.00,
  net_income       DECIMAL(12,2) NOT NULL DEFAULT 0.00,
  details_json     JSON NULL,     -- toutes les lignes calculées (OT, repas, taxes, prêts…)
  created_at       TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
  CONSTRAINT fk_items_run FOREIGN KEY (run_id) REFERENCES payroll_runs(id)
    ON UPDATE CASCADE ON DELETE CASCADE
) ENGINE=InnoDB;
CREATE INDEX idx_items_user ON payroll_run_items (userid);

-- 3.10 Journalisation
DROP TABLE IF EXISTS audit_logs;
CREATE TABLE audit_logs (
  id           BIGINT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
  actor_userid VARCHAR(50) NULL,
  action       VARCHAR(120) NOT NULL,
  target       VARCHAR(120) NULL,
  payload      JSON NULL,
  created_at   TIMESTAMP DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB;

/* ===========================================================
   4) Précharges utiles (exemples)
   =========================================================== */
-- Réglages par défaut
INSERT INTO payroll_settings (id, default_ot_multiplier, currency, locale, rounding_rule)
VALUES (1, 1.50, 'HTG', 'fr-HT', 'none')
ON DUPLICATE KEY UPDATE
  default_ot_multiplier=VALUES(default_ot_multiplier),
  currency=VALUES(currency),
  locale=VALUES(locale),
  rounding_rule=VALUES(rounding_rule);

-- Exemples de taxes (désactivées par défaut : le manager décide)
INSERT INTO deduction_types (code, label, method, rate, applies_to, is_mandatory, active)
VALUES
  ('ONA', 'ONA 6%', 'percent_of_gross', 0.0600, 'selected_employees', 0, 0),
  ('MEAL', 'Repas', 'fixed_amount', 0.00, 'selected_employees', 0, 0)
ON DUPLICATE KEY UPDATE code=code;

/* ===========================================================
   5) Vues pratiques combinées (lecture rapide)
   =========================================================== */

-- Employé + département + taux internes éventuels
CREATE OR REPLACE VIEW v_employee_overview AS
SELECT
  e.userid,
  e.full_name,
  e.department,
  e.designation,
  e.Phone,
  e.Email,
  e.hire_date,
  e.pay_rate,
  e.pay_type
FROM employees e;

-- Présences du jour avec nom employé
CREATE OR REPLACE VIEW v_today_attendance AS
SELECT
  a.date,
  a.userid,
  e.full_name,
  e.department,
  a.time_in,
  a.break_start,
  a.break_end,
  a.time_out,
  a.workhour,
  a.overtime_hours,
  a.short_hours,
  a.leavetype
FROM attendance a
LEFT JOIN employees e ON e.userid=a.userid
WHERE a.date = CURDATE();

/* ===========================================================
   6) Checks & requêtes de test
   =========================================================== */

-- Test 1 : présence de la société
SELECT * FROM company_info LIMIT 1;

-- Test 2 : 5 employés
SELECT userid, full_name, department, designation FROM employees LIMIT 5;

-- Test 3 : présences du jour
SELECT * FROM v_today_attendance ORDER BY department, full_name;

-- Test 4 : jours fériés connus
SELECT year, holidayname, startmonth, startday, endmonth, endday FROM holidays ORDER BY year, startmonth, startday;

-- Test 5 : schémas d’horaires (si présents)
SELECT COUNT(*) AS schedules_cnt FROM schedules;
SELECT COUNT(*) AS schedule_details_cnt FROM schedule_details;

/* ===========================================================
   7) Restauration paramètres SQL
   =========================================================== */
SET FOREIGN_KEY_CHECKS=1;
SET SQL_NOTES=@OLD_SQL_NOTES;
