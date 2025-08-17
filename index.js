const express = require('express');
const cors = require('cors');
const config = require('./config');

const app = express();
const port = config.port || 3000;

app.use(cors());
app.use(express.json());

const db = require('./db');

app.get('/', (req, res) => {
  res.send('Hello World!');
});

app.get('/api/db-test', async (req, res) => {
  try {
    const [rows] = await db.query('SELECT NOW()');
    res.json(rows[0]);
  } catch (err) {
    console.error(err);
    res.status(500).send('Database connection test failed');
  }
});

app.listen(port, () => {
  console.log(`Server is running on port ${port}`);
});
