CREATE DATABASE student_register;

USE student_register;

CREATE TABLE students (
    id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(100) NOT NULL,
    age INT NOT NULL,
    dob DATE NOT NULL,
    sex VARCHAR(10) NOT NULL,
    department VARCHAR(100) NOT NULL,
    phone VARCHAR(15) NOT NULL
);
