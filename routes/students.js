// routes/students.js
const express = require('express');
const router = express.Router();
const db = require('../config/db');

// Get all students
router.get('/', (req, res) => {
  db.query('SELECT * FROM students', (err, results) => {
    if (err) return res.status(500).json({ error: err });
    res.json(results);
  });
});

// Get one student by ID
router.get('/:id', (req, res) => {
  const { id } = req.params;
  db.query('SELECT * FROM students WHERE id = ?', [id], (err, results) => {
    if (err) return res.status(500).json({ error: err });
    res.json(results[0]);
  });
});

// Add a new student
router.post('/', (req, res) => {
  const { full_name, email, date_of_birth } = req.body;
  const sql = 'INSERT INTO students (full_name, email, date_of_birth) VALUES (?, ?, ?)';
  db.query(sql, [full_name, email, date_of_birth], (err, result) => {
    if (err) return res.status(500).json({ error: err });
    res.json({ message: 'Student added successfully', id: result.insertId });
  });
});

// Update student info
router.put('/:id', (req, res) => {
  const { id } = req.params;
  const { full_name, email, date_of_birth } = req.body;
  const sql = 'UPDATE students SET full_name = ?, email = ?, date_of_birth = ? WHERE id = ?';
  db.query(sql, [full_name, email, date_of_birth, id], (err) => {
    if (err) return res.status(500).json({ error: err });
    res.json({ message: 'Student updated successfully' });
  });
});

// Delete a student
router.delete('/:id', (req, res) => {
  const { id } = req.params;
  db.query('DELETE FROM students WHERE id = ?', [id], (err) => {
    if (err) return res.status(500).json({ error: err });
    res.json({ message: 'Student deleted successfully' });
  });
});

module.exports = router;
