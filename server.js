const express = require('express');
const cors = require('cors');
require('dotenv').config();
const db = require('./config/db');
const studentsRouter = require('./routes/students');

const app = express();
app.use(cors());
app.use(express.json());

// Sample route
app.get('/', (req, res) => {
  res.send('Student Portal API is working');
});

// Student routes
app.use('/students', studentsRouter);

const PORT = process.env.PORT || 3000;
app.listen(PORT, () => {
  console.log(`Server running on http://localhost:${PORT}`);
});
