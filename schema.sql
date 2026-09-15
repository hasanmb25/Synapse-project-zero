-- Synapse Learning Management System Database Schema
-- 17 tables with proper foreign key dependencies

-- Create Database
CREATE DATABASE IF NOT EXISTS synapse_db;
USE synapse_db;

-- ============================================================================
-- CORE TABLES
-- ============================================================================

-- 1. users (no dependencies)
CREATE TABLE users (
    user_id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(255) NOT NULL,
    email VARCHAR(255) UNIQUE NOT NULL,
    password_hash VARCHAR(255) NOT NULL,
    semester VARCHAR(50),
    department VARCHAR(100),
    avatar_url VARCHAR(500),
    theme_preference ENUM('light', 'dark') DEFAULT 'light',
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    INDEX idx_email (email),
    INDEX idx_created_at (created_at)
);

-- 2. courses (FK: user_id)
CREATE TABLE courses (
    course_id INT AUTO_INCREMENT PRIMARY KEY,
    user_id INT NOT NULL,
    course_code VARCHAR(50) NOT NULL,
    course_name VARCHAR(255) NOT NULL,
    instructor VARCHAR(255),
    semester VARCHAR(50),
    color_tag VARCHAR(20),
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (user_id) REFERENCES users(user_id) ON DELETE CASCADE,
    INDEX idx_user_id (user_id),
    INDEX idx_semester (semester),
    UNIQUE KEY unique_user_course (user_id, course_code)
);

-- 3. tags (FK: user_id)
CREATE TABLE tags (
    tag_id INT AUTO_INCREMENT PRIMARY KEY,
    user_id INT NOT NULL,
    tag_name VARCHAR(100) NOT NULL,
    FOREIGN KEY (user_id) REFERENCES users(user_id) ON DELETE CASCADE,
    INDEX idx_user_id (user_id),
    UNIQUE KEY unique_user_tag (user_id, tag_name)
);

-- 4. projects (FK: user_id)
CREATE TABLE projects (
    project_id INT AUTO_INCREMENT PRIMARY KEY,
    user_id INT NOT NULL,
    title VARCHAR(255) NOT NULL,
    description TEXT,
    status ENUM('not_started', 'in_progress', 'completed', 'on_hold') DEFAULT 'not_started',
    start_date DATE,
    end_date DATE,
    FOREIGN KEY (user_id) REFERENCES users(user_id) ON DELETE CASCADE,
    INDEX idx_user_id (user_id),
    INDEX idx_status (status)
);

-- 5. concepts (FK: user_id, course_id nullable)
CREATE TABLE concepts (
    concept_id INT AUTO_INCREMENT PRIMARY KEY,
    user_id INT NOT NULL,
    course_id INT,
    concept_name VARCHAR(255) NOT NULL,
    description TEXT,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (user_id) REFERENCES users(user_id) ON DELETE CASCADE,
    FOREIGN KEY (course_id) REFERENCES courses(course_id) ON DELETE SET NULL,
    INDEX idx_user_id (user_id),
    INDEX idx_course_id (course_id),
    INDEX idx_concept_name (concept_name)
);

-- 6. activity_logs (FK: user_id)
CREATE TABLE activity_logs (
    log_id INT AUTO_INCREMENT PRIMARY KEY,
    user_id INT NOT NULL,
    action_type VARCHAR(100) NOT NULL,
    reference_table VARCHAR(100),
    reference_id INT,
    timestamp TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (user_id) REFERENCES users(user_id) ON DELETE CASCADE,
    INDEX idx_user_id (user_id),
    INDEX idx_timestamp (timestamp),
    INDEX idx_action_type (action_type)
);

-- ============================================================================
-- ACADEMIC CONTENT TABLES
-- ============================================================================

-- 7. notes (FK: course_id)
CREATE TABLE notes (
    note_id INT AUTO_INCREMENT PRIMARY KEY,
    course_id INT NOT NULL,
    title VARCHAR(255) NOT NULL,
    content LONGTEXT NOT NULL,
    is_pinned BOOLEAN DEFAULT FALSE,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
    FOREIGN KEY (course_id) REFERENCES courses(course_id) ON DELETE CASCADE,
    INDEX idx_course_id (course_id),
    INDEX idx_created_at (created_at),
    INDEX idx_is_pinned (is_pinned)
);

-- 8. files (FK: course_id)
CREATE TABLE files (
    file_id INT AUTO_INCREMENT PRIMARY KEY,
    course_id INT NOT NULL,
    file_name VARCHAR(255) NOT NULL,
    storage_path VARCHAR(500) NOT NULL,
    file_size_kb INT,
    extracted_text LONGTEXT,
    uploaded_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (course_id) REFERENCES courses(course_id) ON DELETE CASCADE,
    INDEX idx_course_id (course_id),
    INDEX idx_uploaded_at (uploaded_at)
);

-- 9. assignments (FK: course_id)
CREATE TABLE assignments (
    assignment_id INT AUTO_INCREMENT PRIMARY KEY,
    course_id INT NOT NULL,
    title VARCHAR(255) NOT NULL,
    description TEXT,
    deadline DATETIME NOT NULL,
    priority ENUM('low', 'medium', 'high', 'urgent') DEFAULT 'medium',
    status ENUM('not_started', 'in_progress', 'submitted', 'completed', 'overdue') DEFAULT 'not_started',
    progress_percentage TINYINT DEFAULT 0,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (course_id) REFERENCES courses(course_id) ON DELETE CASCADE,
    INDEX idx_course_id (course_id),
    INDEX idx_deadline (deadline),
    INDEX idx_status (status),
    INDEX idx_priority (priority)
);

-- 10. notifications (FK: user_id, assignment_id nullable)
CREATE TABLE notifications (
    notification_id INT AUTO_INCREMENT PRIMARY KEY,
    user_id INT NOT NULL,
    assignment_id INT,
    message TEXT NOT NULL,
    type ENUM('reminder', 'alert', 'ai_recommendation', 'system') DEFAULT 'system',
    is_read BOOLEAN DEFAULT FALSE,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (user_id) REFERENCES users(user_id) ON DELETE CASCADE,
    FOREIGN KEY (assignment_id) REFERENCES assignments(assignment_id) ON DELETE SET NULL,
    INDEX idx_user_id (user_id),
    INDEX idx_assignment_id (assignment_id),
    INDEX idx_created_at (created_at),
    INDEX idx_is_read (is_read)
);

-- 11. study_sessions (FK: course_id)
CREATE TABLE study_sessions (
    session_id INT AUTO_INCREMENT PRIMARY KEY,
    course_id INT NOT NULL,
    session_date DATE NOT NULL,
    start_time TIME NOT NULL,
    end_time TIME NOT NULL,
    duration_minutes INT,
    session_type ENUM('lecture', 'practice', 'review', 'exam_prep', 'group_study') DEFAULT 'practice',
    notes TEXT,
    FOREIGN KEY (course_id) REFERENCES courses(course_id) ON DELETE CASCADE,
    INDEX idx_course_id (course_id),
    INDEX idx_session_date (session_date)
);

-- ============================================================================
-- NOTE-TAG JUNCTION TABLE
-- ============================================================================

-- 12. note_tags (FK: note_id, tag_id)
CREATE TABLE note_tags (
    note_id INT NOT NULL,
    tag_id INT NOT NULL,
    PRIMARY KEY (note_id, tag_id),
    FOREIGN KEY (note_id) REFERENCES notes(note_id) ON DELETE CASCADE,
    FOREIGN KEY (tag_id) REFERENCES tags(tag_id) ON DELETE CASCADE,
    INDEX idx_tag_id (tag_id)
);

-- ============================================================================
-- REVISION & STUDY TABLES
-- ============================================================================

-- 13. flashcards (FK: note_id)
CREATE TABLE flashcards (
    flashcard_id INT AUTO_INCREMENT PRIMARY KEY,
    note_id INT NOT NULL,
    question TEXT NOT NULL,
    answer TEXT NOT NULL,
    difficulty ENUM('easy', 'medium', 'hard') DEFAULT 'medium',
    card_type ENUM('flashcard', 'quiz') DEFAULT 'flashcard',
    is_ai_generated BOOLEAN DEFAULT FALSE,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (note_id) REFERENCES notes(note_id) ON DELETE CASCADE,
    INDEX idx_note_id (note_id),
    INDEX idx_difficulty (difficulty)
);

-- 14. summaries (FK: note_id, 1:1 relationship)
CREATE TABLE summaries (
    summary_id INT AUTO_INCREMENT PRIMARY KEY,
    note_id INT UNIQUE NOT NULL,
    summary_text LONGTEXT NOT NULL,
    keywords VARCHAR(500),
    model_used VARCHAR(100),
    generated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (note_id) REFERENCES notes(note_id) ON DELETE CASCADE,
    INDEX idx_generated_at (generated_at)
);

-- 15. flashcard_reviews (FK: flashcard_id)
CREATE TABLE flashcard_reviews (
    review_id INT AUTO_INCREMENT PRIMARY KEY,
    flashcard_id INT NOT NULL,
    review_date DATE NOT NULL,
    score TINYINT,
    next_review_date DATE,
    FOREIGN KEY (flashcard_id) REFERENCES flashcards(flashcard_id) ON DELETE CASCADE,
    INDEX idx_flashcard_id (flashcard_id),
    INDEX idx_review_date (review_date),
    INDEX idx_next_review_date (next_review_date)
);

-- 16. milestones (FK: project_id)
CREATE TABLE milestones (
    milestone_id INT AUTO_INCREMENT PRIMARY KEY,
    project_id INT NOT NULL,
    title VARCHAR(255) NOT NULL,
    due_date DATE NOT NULL,
    status ENUM('not_started', 'in_progress', 'completed') DEFAULT 'not_started',
    completed_at TIMESTAMP NULL,
    FOREIGN KEY (project_id) REFERENCES projects(project_id) ON DELETE CASCADE,
    INDEX idx_project_id (project_id),
    INDEX idx_due_date (due_date),
    INDEX idx_status (status)
);

-- ============================================================================
-- KNOWLEDGE GRAPH TABLES
-- ============================================================================

-- 17. concept_links (self-referencing FK)
CREATE TABLE concept_links (
    link_id INT AUTO_INCREMENT PRIMARY KEY,
    from_concept_id INT NOT NULL,
    to_concept_id INT NOT NULL,
    relationship_type ENUM('prerequisite', 'related', 'extends', 'depends_on', 'similar_to') DEFAULT 'related',
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (from_concept_id) REFERENCES concepts(concept_id) ON DELETE CASCADE,
    FOREIGN KEY (to_concept_id) REFERENCES concepts(concept_id) ON DELETE CASCADE,
    INDEX idx_from_concept (from_concept_id),
    INDEX idx_to_concept (to_concept_id),
    UNIQUE KEY unique_concept_link (from_concept_id, to_concept_id, relationship_type),
    CONSTRAINT chk_different_concepts CHECK (from_concept_id != to_concept_id)
);

-- ============================================================================
-- VIEWS FOR CALENDAR & EVENTS
-- ============================================================================

-- Calendar view: unions assignments, study sessions, and milestones
CREATE VIEW calendar_events AS
SELECT 
    CONCAT('assignment_', assignment_id) AS event_id,
    'assignment' AS event_type,
    title,
    NULL AS description,
    DATE(deadline) AS event_date,
    TIME(deadline) AS start_time,
    NULL AS end_time,
    priority,
    status,
    NULL AS project_id
FROM assignments
UNION ALL
SELECT 
    CONCAT('study_', session_id) AS event_id,
    'study_session' AS event_type,
    CONCAT('Study - ', session_type) AS title,
    notes AS description,
    session_date AS event_date,
    start_time,
    end_time,
    'medium' AS priority,
    'scheduled' AS status,
    NULL AS project_id
FROM study_sessions
UNION ALL
SELECT 
    CONCAT('milestone_', milestone_id) AS event_id,
    'milestone' AS event_type,
    title,
    NULL AS description,
    due_date AS event_date,
    NULL AS start_time,
    NULL AS end_time,
    'high' AS priority,
    status,
    project_id
FROM milestones;

-- ============================================================================
-- ANALYTICS VIEW
-- ============================================================================

-- User progress summary
CREATE VIEW user_progress_summary AS
SELECT 
    u.user_id,
    u.name,
    COUNT(DISTINCT c.course_id) AS total_courses,
    COUNT(DISTINCT n.note_id) AS total_notes,
    COUNT(DISTINCT CASE WHEN a.status = 'completed' THEN a.assignment_id END) AS completed_assignments,
    COUNT(DISTINCT CASE WHEN a.status IN ('not_started', 'in_progress') THEN a.assignment_id END) AS pending_assignments,
    COUNT(DISTINCT f.flashcard_id) AS total_flashcards,
    AVG(CASE WHEN fr.score IS NOT NULL THEN fr.score ELSE NULL END) AS avg_review_score
FROM users u
LEFT JOIN courses c ON u.user_id = c.user_id
LEFT JOIN notes n ON c.course_id = n.course_id
LEFT JOIN assignments a ON c.course_id = a.course_id
LEFT JOIN flashcards f ON n.note_id = f.note_id
LEFT JOIN flashcard_reviews fr ON f.flashcard_id = fr.flashcard_id
GROUP BY u.user_id, u.name;

-- ============================================================================
-- END OF SCHEMA
-- ============================================================================



-- DROP DATABASE synapse_db;

-- select * from assignments;

-- SELECT * FROM COURSES;
select * FROM files;