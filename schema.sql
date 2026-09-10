-- 1.1 Reset and Create Database
DROP DATABASE IF EXISTS synapse_db;
CREATE DATABASE synapse_db;
USE synapse_db;

-- 1.2 Create 15 Tables (in relational order)

-- 1. users
CREATE TABLE users (
    id INT AUTO_INCREMENT PRIMARY KEY,
    username VARCHAR(50) NOT NULL UNIQUE,
    email VARCHAR(100) NOT NULL UNIQUE,
    password_hash VARCHAR(255) NOT NULL,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

-- 2. courses
CREATE TABLE courses (
    id INT AUTO_INCREMENT PRIMARY KEY,
    user_id INT NOT NULL,
    name VARCHAR(100) NOT NULL,
    code VARCHAR(20),
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (user_id) REFERENCES users(id) ON DELETE CASCADE
);

-- 3. notes
CREATE TABLE notes (
    id INT AUTO_INCREMENT PRIMARY KEY,
    course_id INT NOT NULL,
    title VARCHAR(100) NOT NULL,
    content TEXT,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (course_id) REFERENCES courses(id) ON DELETE CASCADE
);

-- 4. tags
CREATE TABLE tags (
    id INT AUTO_INCREMENT PRIMARY KEY,
    user_id INT NOT NULL,
    name VARCHAR(50) NOT NULL,
    FOREIGN KEY (user_id) REFERENCES users(id) ON DELETE CASCADE
);

-- 5. note_tags
CREATE TABLE note_tags (
    note_id INT NOT NULL,
    tag_id INT NOT NULL,
    PRIMARY KEY (note_id, tag_id),
    FOREIGN KEY (note_id) REFERENCES notes(id) ON DELETE CASCADE,
    FOREIGN KEY (tag_id) REFERENCES tags(id) ON DELETE CASCADE
);

-- 6. assignments
CREATE TABLE assignments (
    id INT AUTO_INCREMENT PRIMARY KEY,
    course_id INT NOT NULL,
    title VARCHAR(100) NOT NULL,
    due_date DATETIME,
    status ENUM('Pending', 'In Progress', 'Completed') DEFAULT 'Pending',
    FOREIGN KEY (course_id) REFERENCES courses(id) ON DELETE CASCADE
);

-- 7. files
CREATE TABLE files (
    id INT AUTO_INCREMENT PRIMARY KEY,
    note_id INT,
    file_name VARCHAR(255) NOT NULL,
    file_path VARCHAR(255) NOT NULL,
    uploaded_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (note_id) REFERENCES notes(id) ON DELETE CASCADE
);

-- 8. study_sessions
CREATE TABLE study_sessions (
    id INT AUTO_INCREMENT PRIMARY KEY,
    user_id INT NOT NULL,
    start_time DATETIME NOT NULL,
    end_time DATETIME,
    focus_score INT DEFAULT 0,
    FOREIGN KEY (user_id) REFERENCES users(id) ON DELETE CASCADE
);

-- 9. flashcards
CREATE TABLE flashcards (
    id INT AUTO_INCREMENT PRIMARY KEY,
    note_id INT NOT NULL,
    question TEXT NOT NULL,
    answer TEXT NOT NULL,
    FOREIGN KEY (note_id) REFERENCES notes(id) ON DELETE CASCADE
);

-- 10. flashcard_reviews
CREATE TABLE flashcard_reviews (
    id INT AUTO_INCREMENT PRIMARY KEY,
    flashcard_id INT NOT NULL,
    review_date DATETIME DEFAULT CURRENT_TIMESTAMP,
    quality INT CHECK (quality BETWEEN 0 AND 5),
    FOREIGN KEY (flashcard_id) REFERENCES flashcards(id) ON DELETE CASCADE
);

-- 11. summaries
CREATE TABLE summaries (
    id INT AUTO_INCREMENT PRIMARY KEY,
    note_id INT NOT NULL,
    summary_text TEXT NOT NULL,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (note_id) REFERENCES notes(id) ON DELETE CASCADE
);

-- 12. projects
CREATE TABLE projects (
    id INT AUTO_INCREMENT PRIMARY KEY,
    course_id INT NOT NULL,
    name VARCHAR(100) NOT NULL,
    deadline DATETIME,
    FOREIGN KEY (course_id) REFERENCES courses(id) ON DELETE CASCADE
);

-- 13. milestones
CREATE TABLE milestones (
    id INT AUTO_INCREMENT PRIMARY KEY,
    project_id INT NOT NULL,
    title VARCHAR(100) NOT NULL,
    status ENUM('Pending', 'Completed') DEFAULT 'Pending',
    FOREIGN KEY (project_id) REFERENCES projects(id) ON DELETE CASCADE
);

-- 14. notifications
CREATE TABLE notifications (
    id INT AUTO_INCREMENT PRIMARY KEY,
    user_id INT NOT NULL,
    message VARCHAR(255) NOT NULL,
    is_read BOOLEAN DEFAULT FALSE,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (user_id) REFERENCES users(id) ON DELETE CASCADE
);

-- 15. activity_logs
CREATE TABLE activity_logs (
    id INT AUTO_INCREMENT PRIMARY KEY,
    user_id INT NOT NULL,
    action VARCHAR(255) NOT NULL,
    timestamp TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (user_id) REFERENCES users(id) ON DELETE CASCADE
);

-- 1. Insert Demo User
INSERT INTO users (username, email, password_hash) 
VALUES ('student_demo', 'student@synapse.edu', 'hashed_pass_123');

-- 2. Insert Demo Courses
INSERT INTO courses (user_id, name, code) VALUES 
(1, 'Database Systems', 'CSE299'),
(1, 'Algorithms', 'CSE220');

-- 3. Insert Demo Notes
INSERT INTO notes (course_id, title, content) VALUES 
(1, 'ER Diagram Basics', 'Entities, Attributes, and Relationships breakdown.'),
(2, 'Graph Traversal', 'BFS uses queue, DFS uses stack.');

-- 4. Insert Demo Tags
INSERT INTO tags (user_id, name) VALUES 
(1, 'Important'),
(1, 'Exam Prep');

-- 5. Link Note Tags
INSERT INTO note_tags (note_id, tag_id) VALUES 
(1, 1),
(2, 2);

-- 6. Insert Demo Assignments
INSERT INTO assignments (course_id, title, due_date, status) VALUES 
(1, 'Schema Design Project', '2026-09-20 23:59:00', 'In Progress'),
(2, 'Lab Quiz 1', '2026-09-15 10:00:00', 'Pending');

-- 7. Insert Demo Files
INSERT INTO files (note_id, file_name, file_path) VALUES 
(1, 'er_diagram_cheatsheet.pdf', '/uploads/files/er_diagram_cheatsheet.pdf');

-- 8. Insert Demo Study Sessions
INSERT INTO study_sessions (user_id, start_time, end_time, focus_score) VALUES 
(1, '2026-09-09 14:00:00', '2026-09-09 16:00:00', 88);

-- 9. Insert Demo Flashcards
INSERT INTO flashcards (note_id, question, answer) VALUES 
(1, 'What is an Entity in an ER Diagram?', 'A real-world object or concept that can exist independently.');

-- 10. Insert Demo Flashcard Reviews
INSERT INTO flashcard_reviews (flashcard_id, review_date, quality) VALUES 
(1, '2026-09-10 09:30:00', 4);

-- 11. Insert Demo Summaries
INSERT INTO summaries (note_id, summary_text) VALUES 
(1, 'Summary of ER Diagrams covering entities, attributes, primary keys, and mapping rules.');

-- 12. Insert Demo Projects
INSERT INTO projects (course_id, name, deadline) VALUES 
(1, 'Database System Implementation', '2026-10-15 23:59:00');

-- 13. Insert Demo Milestones
INSERT INTO milestones (project_id, title, status) VALUES 
(1, 'ER Diagram Design', 'Completed'),
(1, 'SQL DDL Execution', 'Pending');

-- 14. Insert Demo Notifications
INSERT INTO notifications (user_id, message, is_read) VALUES 
(1, 'Assignment "Schema Design Project" is due soon.', FALSE);

-- 15. Insert Demo Activity Logs
INSERT INTO activity_logs (user_id, action) VALUES 
(1, 'User logged in'),
(1, 'Created note: ER Diagram Basics');


-- SHOW TABLES;

-- SELECT * FROM users;
-- SELECT * FROM courses;
-- SELECT * FROM notes;
-- SELECT * FROM tags;
-- SELECT * FROM note_tags;
-- SELECT * FROM assignments;
-- SELECT * FROM notifications;

SELECT 
    table_name, 
    table_rows 
FROM 
    information_schema.tables 
WHERE 
    table_schema = 'synapse_db';