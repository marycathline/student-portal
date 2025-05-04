-- This SQL script creates a simple student portal database with tables for students, courses, and enrollments.
-- The script includes sample data for students, courses, and enrollments to demonstrate the relationships between them.

-- Student database
DROP DATABASE IF EXISTS Student_Portaldb;

CREATE DATABASE Student_Portaldb;
USE Student_Portaldb;

-- Students Table
CREATE TABLE students (
    id INT AUTO_INCREMENT PRIMARY KEY,
    full_name VARCHAR(100) NOT NULL,
    email VARCHAR(100) UNIQUE NOT NULL,
    date_of_birth DATE,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

-- Courses Table
CREATE TABLE courses (
    id INT AUTO_INCREMENT PRIMARY KEY,
    course_name VARCHAR(100) NOT NULL,
    course_code VARCHAR(10) UNIQUE NOT NULL,
    description TEXT,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

-- Enrollments Table (many-to-many relationship)
CREATE TABLE enrollments (
    id INT AUTO_INCREMENT PRIMARY KEY,
    student_id INT NOT NULL,
    course_id INT NOT NULL,
    enrollment_date TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (student_id) REFERENCES students(id) ON DELETE CASCADE,
    FOREIGN KEY (course_id) REFERENCES courses(id) ON DELETE CASCADE,
    UNIQUE KEY (student_id, course_id)
);

-- sample students
INSERT INTO students (full_name, email, date_of_birth)
VALUES 
('Akinyi Moraa', 'akinyi.moraa@example.com', '2000-05-15'),
('Brian Otieno', 'brian.otieno@example.com', '1999-11-02'),
('Cynthia Wanjiru', 'cynthia.wanjiru@example.com', '2001-03-22');

--  sample courses
INSERT INTO courses (course_name, course_code, description)
VALUES 
('Introduction to Python', 'PY101', 'Learn the basics of Python programming.'),
('Database Systems', 'DB201', 'Explore relational databases and SQL.'),
('Web Development', 'WD301', 'Build modern web applications.');

--  sample enrollments (linking students to courses)
INSERT INTO enrollments (student_id, course_id)
VALUES 
(1, 1),  -- Akinyi enrolled in Python
(1, 2),  -- Akinyi enrolled in DB Systems
(2, 1),  -- Brian enrolled in Python
(3, 2),  -- Cynthia enrolled in DB Systems
(3, 3);  -- Cynthia enrolled in Web Dev



