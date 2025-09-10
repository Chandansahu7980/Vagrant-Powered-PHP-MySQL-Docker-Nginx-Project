-- here I m creating a init sql that will help me to create my user, db and a sample table
-- Create a new database for the project
CREATE DATABASE IF NOT EXISTS my_project_db;

-- Create a new user and set a password
DROP USER IF EXISTS 'phpuser'@'192.168.56.21';
CREATE USER 'phpuser'@'192.168.56.21' IDENTIFIED BY 'phpuser';

-- Grant all privileges on the new database to the new user
GRANT ALL PRIVILEGES ON my_project_db.* TO 'phpuser'@'192.168.56.21';

-- Ensure changes are applied
FLUSH PRIVILEGES;

-- Switch to the new database
USE my_project_db;

-- Create a sample table
CREATE TABLE IF NOT EXISTS my_users (
id INT AUTO_INCREMENT PRIMARY KEY,
name VARCHAR(50) NOT NULL,
jobrole VARCHAR(100) NOT NULL,
address VARCHAR(100) NOT NULL,
created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

-- Insert some sample data into the users table
INSERT INTO my_users (name, jobrole, address) VALUES
('chandan', 'owner', 'ganjam'),
('dibya', 'admin', 'jharsuguda'),
('dipti', 'manager', 'angul');