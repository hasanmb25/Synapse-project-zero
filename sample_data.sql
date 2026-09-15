-- ============================================================================
-- Synapse Learning Management System - Sample Data
-- ============================================================================
-- This file contains realistic sample data for testing and demonstration.
-- All foreign key constraints, ENUM values, and unique constraints are respected.
-- Data is inserted in dependency order to avoid foreign key violations.

USE synapse_db;


-- ============================================================================
-- 1. USERS (5 records)
-- ============================================================================
INSERT INTO users (name, email, password_hash, semester, department, avatar_url, theme_preference, created_at)
VALUES
('Alex Johnson', 'alex.johnson@university.edu', '$2b$10$ExampleHashedPassword1', 'Fall 2024', 'Computer Science', 'https://example.com/avatars/alex.png', 'dark', '2024-01-15 10:30:00'),
('Jordan Lee', 'jordan.lee@university.edu', '$2b$10$ExampleHashedPassword2', 'Fall 2024', 'Computer Science', 'https://example.com/avatars/jordan.png', 'light', '2024-01-16 11:00:00'),
('Sam Chen', 'sam.chen@university.edu', '$2b$10$ExampleHashedPassword3', 'Fall 2024', 'Computer Science', 'https://example.com/avatars/sam.png', 'dark', '2024-01-17 09:15:00'),
('Taylor Williams', 'taylor.williams@university.edu', '$2b$10$ExampleHashedPassword4', 'Fall 2024', 'Computer Science', 'https://example.com/avatars/taylor.png', 'light', '2024-01-18 14:45:00'),
('Morgan Davis', 'morgan.davis@university.edu', '$2b$10$ExampleHashedPassword5', 'Fall 2024', 'Computer Science', 'https://example.com/avatars/morgan.png', 'dark', '2024-01-19 08:30:00');

-- ============================================================================
-- 2. COURSES (25 records - 5 per user)
-- ============================================================================
-- User 1: Alex Johnson (courses 1-5)
INSERT INTO courses (user_id, course_code, course_name, instructor, semester, color_tag, created_at)
VALUES
(1, 'CS201', 'Data Structures', 'Dr. Patricia Johnson', 'Fall 2024', '#FF5733', '2024-01-15 11:00:00'),
(1, 'CS301', 'Database Management Systems', 'Dr. Michael Chen', 'Fall 2024', '#3366FF', '2024-01-15 11:30:00'),
(1, 'CS101', 'Object-Oriented Programming', 'Prof. Jennifer Lee', 'Fall 2024', '#33FF66', '2024-01-15 12:00:00'),
(1, 'CS401', 'Computer Networks', 'Dr. Robert Thompson', 'Fall 2024', '#FFCC00', '2024-01-15 12:30:00'),
(1, 'MATH301', 'Discrete Mathematics', 'Prof. David Martinez', 'Fall 2024', '#FF33CC', '2024-01-15 13:00:00');

-- User 2: Jordan Lee (courses 6-10)
INSERT INTO courses (user_id, course_code, course_name, instructor, semester, color_tag, created_at)
VALUES
(2, 'CS201', 'Data Structures', 'Dr. Patricia Johnson', 'Fall 2024', '#FF5733', '2024-01-16 11:00:00'),
(2, 'CS301', 'Database Management Systems', 'Dr. Michael Chen', 'Fall 2024', '#3366FF', '2024-01-16 11:30:00'),
(2, 'CS101', 'Object-Oriented Programming', 'Prof. Jennifer Lee', 'Fall 2024', '#33FF66', '2024-01-16 12:00:00'),
(2, 'CS401', 'Computer Networks', 'Dr. Robert Thompson', 'Fall 2024', '#FFCC00', '2024-01-16 12:30:00'),
(2, 'MATH301', 'Discrete Mathematics', 'Prof. David Martinez', 'Fall 2024', '#FF33CC', '2024-01-16 13:00:00');

-- User 3: Sam Chen (courses 11-15)
INSERT INTO courses (user_id, course_code, course_name, instructor, semester, color_tag, created_at)
VALUES
(3, 'CS201', 'Data Structures', 'Dr. Patricia Johnson', 'Fall 2024', '#FF5733', '2024-01-17 11:00:00'),
(3, 'CS301', 'Database Management Systems', 'Dr. Michael Chen', 'Fall 2024', '#3366FF', '2024-01-17 11:30:00'),
(3, 'CS101', 'Object-Oriented Programming', 'Prof. Jennifer Lee', 'Fall 2024', '#33FF66', '2024-01-17 12:00:00'),
(3, 'CS401', 'Computer Networks', 'Dr. Robert Thompson', 'Fall 2024', '#FFCC00', '2024-01-17 12:30:00'),
(3, 'MATH301', 'Discrete Mathematics', 'Prof. David Martinez', 'Fall 2024', '#FF33CC', '2024-01-17 13:00:00');

-- User 4: Taylor Williams (courses 16-20)
INSERT INTO courses (user_id, course_code, course_name, instructor, semester, color_tag, created_at)
VALUES
(4, 'CS201', 'Data Structures', 'Dr. Patricia Johnson', 'Fall 2024', '#FF5733', '2024-01-18 11:00:00'),
(4, 'CS301', 'Database Management Systems', 'Dr. Michael Chen', 'Fall 2024', '#3366FF', '2024-01-18 11:30:00'),
(4, 'CS101', 'Object-Oriented Programming', 'Prof. Jennifer Lee', 'Fall 2024', '#33FF66', '2024-01-18 12:00:00'),
(4, 'CS401', 'Computer Networks', 'Dr. Robert Thompson', 'Fall 2024', '#FFCC00', '2024-01-18 12:30:00'),
(4, 'MATH301', 'Discrete Mathematics', 'Prof. David Martinez', 'Fall 2024', '#FF33CC', '2024-01-18 13:00:00');

-- User 5: Morgan Davis (courses 21-25)
INSERT INTO courses (user_id, course_code, course_name, instructor, semester, color_tag, created_at)
VALUES
(5, 'CS201', 'Data Structures', 'Dr. Patricia Johnson', 'Fall 2024', '#FF5733', '2024-01-19 11:00:00'),
(5, 'CS301', 'Database Management Systems', 'Dr. Michael Chen', 'Fall 2024', '#3366FF', '2024-01-19 11:30:00'),
(5, 'CS101', 'Object-Oriented Programming', 'Prof. Jennifer Lee', 'Fall 2024', '#33FF66', '2024-01-19 12:00:00'),
(5, 'CS401', 'Computer Networks', 'Dr. Robert Thompson', 'Fall 2024', '#FFCC00', '2024-01-19 12:30:00'),
(5, 'MATH301', 'Discrete Mathematics', 'Prof. David Martinez', 'Fall 2024', '#FF33CC', '2024-01-19 13:00:00');

-- ============================================================================
-- 3. TAGS (15 records)
-- ============================================================================
INSERT INTO tags (user_id, tag_name)
VALUES
(1, 'Important'),
(1, 'Review Later'),
(1, 'Exam Prep'),
(1, 'Tutorial'),
(1, 'Algorithm'),
(2, 'Important'),
(2, 'Practical'),
(2, 'Theory'),
(2, 'Query'),
(2, 'Network'),
(3, 'Design Pattern'),
(3, 'Performance'),
(4, 'Bug Fix'),
(4, 'Documentation'),
(5, 'Quick Reference');

-- ============================================================================
-- 4. PROJECTS (8 records)
-- ============================================================================
INSERT INTO projects (user_id, title, description, status, start_date, end_date)
VALUES
(1, 'Chat Application', 'Real-time messaging platform with WebSocket support and database integration', 'in_progress', '2024-02-01', '2024-04-30'),
(1, 'E-Commerce Platform', 'Full-stack online store with inventory management and payment processing', 'not_started', '2024-03-15', '2024-06-15'),
(2, 'Weather App', 'Mobile application showing real-time weather data using REST APIs', 'completed', '2024-01-01', '2024-02-28'),
(2, 'Social Network', 'Distributed system for social connections with graph algorithms', 'in_progress', '2024-02-15', '2024-05-31'),
(3, 'Database Optimizer', 'Query optimization engine using indexing and execution plans', 'not_started', '2024-03-01', '2024-05-01'),
(3, 'File System Implementation', 'Custom file system with B-tree indexing and transaction support', 'on_hold', '2024-02-20', '2024-06-20'),
(4, 'Network Simulator', 'Simulation of network protocols and routing algorithms', 'in_progress', '2024-01-20', '2024-04-20'),
(5, 'ML Recommendation Engine', 'Machine learning system for personalized content recommendations', 'not_started', '2024-03-10', '2024-06-30');

-- ============================================================================
-- 5. CONCEPTS (20 records)
-- ============================================================================
INSERT INTO concepts (user_id, course_id, concept_name, description, created_at)
VALUES
(1, 1, 'Hash Tables', 'Data structure providing constant-time average-case lookups using hashing', '2024-01-20 10:00:00'),
(1, 1, 'Binary Search Trees', 'Self-balancing tree structure for efficient searching and sorting operations', '2024-01-21 10:30:00'),
(1, 2, 'SQL Queries', 'Structured Query Language for data retrieval and manipulation', '2024-01-22 09:00:00'),
(1, 2, 'Database Normalization', 'Process of organizing data to eliminate redundancy following ACID properties', '2024-01-23 14:00:00'),
(1, 3, 'Inheritance', 'OOP mechanism allowing classes to inherit properties and methods', '2024-01-24 11:00:00'),
(2, 6, 'Polymorphism', 'OOP concept enabling objects to take multiple forms', '2024-01-25 13:00:00'),
(2, 9, 'TCP/IP', 'Protocol suite for internet communication and data transmission', '2024-01-26 10:00:00'),
(2, 9, 'DNS Resolution', 'System for translating domain names to IP addresses', '2024-01-27 15:00:00'),
(3, 11, 'Set Theory', 'Mathematical study of sets and their operations', '2024-01-28 09:30:00'),
(3, 15, 'Graph Theory', 'Study of graphs and networks with nodes and edges', '2024-01-29 11:00:00'),
(3, 12, 'B-Trees', 'Self-balancing search tree optimized for disk access', '2024-01-30 10:00:00'),
(4, 16, 'Stack Overflow', 'Memory error when stack grows beyond allocated space', '2024-01-31 12:00:00'),
(4, 19, 'Routing Algorithms', 'Algorithms for determining packet paths in networks', '2024-02-01 09:00:00'),
(5, 21, 'Machine Learning', 'Computational approach for enabling systems to learn from data', '2024-02-02 14:00:00'),
(1, NULL, 'Big O Notation', 'Mathematical notation for analyzing algorithm complexity', '2024-02-03 10:00:00'),
(2, NULL, 'Recursion', 'Programming technique where functions call themselves', '2024-02-04 11:00:00'),
(3, NULL, 'Synchronization', 'Coordination mechanisms in concurrent systems', '2024-02-05 09:00:00'),
(4, NULL, 'Encryption', 'Process of encoding information for security', '2024-02-06 13:00:00'),
(5, NULL, 'Caching', 'Storage technique for frequently accessed data', '2024-02-07 10:30:00'),
(1, 2, 'ACID Properties', 'Guarantees for reliable database transactions', '2024-02-08 12:00:00');

-- ============================================================================
-- 6. ACTIVITY LOGS (25 records)
-- ============================================================================
INSERT INTO activity_logs (user_id, action_type, reference_table, reference_id, timestamp)
VALUES
(1, 'created_note', 'notes', 1, '2024-02-01 09:00:00'),
(1, 'viewed_course', 'courses', 1, '2024-02-01 09:15:00'),
(1, 'completed_assignment', 'assignments', 1, '2024-02-01 10:30:00'),
(1, 'created_flashcard', 'flashcards', 1, '2024-02-01 11:00:00'),
(1, 'updated_note', 'notes', 1, '2024-02-01 14:00:00'),
(2, 'created_note', 'notes', 6, '2024-02-02 08:30:00'),
(2, 'started_project', 'projects', 3, '2024-02-02 09:00:00'),
(2, 'viewed_concept', 'concepts', 7, '2024-02-02 10:00:00'),
(2, 'submitted_assignment', 'assignments', 7, '2024-02-02 15:30:00'),
(2, 'created_flashcard', 'flashcards', 6, '2024-02-02 16:00:00'),
(3, 'uploaded_file', 'files', 1, '2024-02-03 09:00:00'),
(3, 'created_note', 'notes', 11, '2024-02-03 09:30:00'),
(3, 'completed_study_session', 'study_sessions', 1, '2024-02-03 11:00:00'),
(3, 'viewed_assignment', 'assignments', 12, '2024-02-03 13:00:00'),
(3, 'created_project', 'projects', 5, '2024-02-03 14:00:00'),
(4, 'created_tag', 'tags', 13, '2024-02-04 08:00:00'),
(4, 'pinned_note', 'notes', 16, '2024-02-04 10:00:00'),
(4, 'reviewed_flashcard', 'flashcard_reviews', 1, '2024-02-04 11:30:00'),
(4, 'created_milestone', 'milestones', 1, '2024-02-04 14:00:00'),
(4, 'viewed_concept', 'concepts', 13, '2024-02-04 15:00:00'),
(5, 'created_note', 'notes', 21, '2024-02-05 09:00:00'),
(5, 'updated_project', 'projects', 8, '2024-02-05 10:00:00'),
(5, 'started_study_session', 'study_sessions', 5, '2024-02-05 11:00:00'),
(5, 'created_summary', 'summaries', 1, '2024-02-05 12:00:00'),
(1, 'generated_ai_flashcard', 'flashcards', 11, '2024-02-06 09:00:00');

-- ============================================================================
-- 7. NOTES (20 records)
-- ============================================================================
INSERT INTO notes (course_id, title, content, is_pinned, created_at, updated_at)
VALUES
(1, 'Hash Tables: Implementation and Collision Handling', 'Hash tables are fundamental data structures. Key concepts: hashing functions, collision resolution (chaining vs open addressing), load factor, rehashing. Example: Java HashMap uses separate chaining.', 1, '2024-02-01 09:00:00', '2024-02-10 14:30:00'),
(1, 'Binary Search Trees Operations', 'BST operations: insertion (O(log n) avg), deletion with three cases, in-order traversal for sorted output. Important: balance is crucial for performance.', 0, '2024-02-02 10:00:00', '2024-02-08 11:00:00'),
(2, 'SQL SELECT Statements and WHERE Clauses', 'Basic SQL syntax: SELECT column FROM table WHERE condition. Wildcards, LIKE operator, AND/OR logic. Complex queries using multiple conditions.', 1, '2024-02-03 11:00:00', '2024-02-09 13:00:00'),
(2, 'Database Normalization: 1NF to BCNF', 'First Normal Form (atomic values), Second Normal Form (no partial dependencies), Third Normal Form (no transitive dependencies), Boyce-Codd Normal Form.', 0, '2024-02-04 14:00:00', '2024-02-07 10:00:00'),
(3, 'OOP Inheritance Patterns', 'Single inheritance, multiple inheritance (diamond problem), abstract classes, interfaces. Java vs Python approaches.', 0, '2024-02-05 09:30:00', '2024-02-11 12:00:00'),
(6, 'Polymorphism and Method Overriding', 'Compile-time (static) vs runtime (dynamic) polymorphism. Method overloading vs method overriding. Virtual functions in C++.', 1, '2024-02-06 10:00:00', '2024-02-10 15:00:00'),
(9, 'TCP/IP Protocol Stack', 'OSI model layers: Application, Transport (TCP/UDP), Network (IP), Link layers. TCP three-way handshake, UDP unreliable delivery.', 0, '2024-02-07 11:00:00', '2024-02-12 09:00:00'),
(9, 'DNS: Domain Name System Overview', 'Hierarchical naming system, DNS queries (recursive and iterative), caching, TTL, common record types (A, AAAA, MX, CNAME).', 1, '2024-02-08 14:30:00', '2024-02-11 16:00:00'),
(11, 'Set Theory: Operations and Proofs', 'Union, intersection, complement, Cartesian product. De Morgan Laws, distributive properties, power sets, cardinality.', 0, '2024-02-09 09:00:00', '2024-02-13 10:30:00'),
(15, 'Graph Theory Fundamentals', 'Vertices and edges, directed vs undirected, weighted graphs, graph representations (adjacency matrix, list), graph traversal (DFS, BFS).', 1, '2024-02-10 10:00:00', '2024-02-14 11:00:00'),
(12, 'B-Trees for Database Indexing', 'Self-balancing tree, order t, minimum/maximum degree, insertion with node splits, deletion with merging, O(log n) performance.', 0, '2024-02-11 11:30:00', '2024-02-15 13:00:00'),
(16, 'Stack Memory and Stack Overflow', 'Call stack, function frames, local variables, return addresses. Stack overflow causes, prevention, difference from heap.', 1, '2024-02-12 13:00:00', '2024-02-16 14:00:00'),
(19, 'Routing Algorithms: Dijkstra and BGP', 'Shortest path algorithms, link-state vs distance-vector, autonomous systems, route aggregation, convergence.', 0, '2024-02-13 14:00:00', '2024-02-17 10:00:00'),
(21, 'Supervised vs Unsupervised Learning', 'Classification, regression, clustering, feature engineering, training vs test sets, overfitting prevention.', 1, '2024-02-14 09:30:00', '2024-02-18 12:00:00'),
(2, 'Advanced SQL Joins and Subqueries', 'Inner, left, right, full joins, subqueries in SELECT/WHERE/FROM, correlated subqueries, performance implications.', 0, '2024-02-15 10:00:00', '2024-02-19 11:00:00'),
(4, 'OOP: Encapsulation and Access Modifiers', 'Public, private, protected, package-private, getters/setters, information hiding, design principles.', 1, '2024-02-16 11:00:00', '2024-02-20 13:30:00'),
(8, 'Congestion Control in TCP', 'Slow start, congestion avoidance, fast retransmit, fast recovery, window size management, ECN (Explicit Congestion Notification).', 0, '2024-02-17 12:00:00', '2024-02-21 14:00:00'),
(13, 'Discrete Math: Permutations and Combinations', 'Factorial, nPr, nCr, binomial theorem, counting principles, inclusion-exclusion principle.', 1, '2024-02-18 13:30:00', '2024-02-22 15:00:00'),
(5, 'Recursive Functions and Backtracking', 'Base case and recursive case, call stack visualization, memoization, backtracking algorithm templates.', 0, '2024-02-19 09:00:00', '2024-02-23 10:00:00'),
(10, 'Network Security: Encryption and Authentication', 'Symmetric vs asymmetric encryption, digital signatures, SSL/TLS handshake, certificate authorities, key exchange.', 1, '2024-02-20 10:00:00', '2024-02-24 12:00:00');

-- ============================================================================
-- 8. FILES (12 records)
-- ============================================================================
INSERT INTO files (course_id, file_name, storage_path, file_size_kb, extracted_text, uploaded_at)
VALUES
(1, 'DataStructures_Lecture1.pdf', '/uploads/courses/1/DataStructures_Lecture1.pdf', 2048, 'Introduction to data structures, array vs linked list comparison, time complexity analysis', '2024-01-20 08:00:00'),
(2, 'Database_Design_Slides.pptx', '/uploads/courses/2/Database_Design_Slides.pptx', 3200, 'ER diagrams, schema design, normalization rules, practical examples', '2024-01-21 09:00:00'),
(3, 'OOP_Tutorial.pdf', '/uploads/courses/3/OOP_Tutorial.pdf', 1500, 'Class design, inheritance hierarchy, polymorphic behavior', '2024-01-22 10:00:00'),
(9, 'TCP_IP_Protocol_Guide.docx', '/uploads/courses/9/TCP_IP_Protocol_Guide.docx', 1024, 'Protocol stack overview, packet structure, flow control', '2024-01-23 11:00:00'),
(15, 'Discrete_Math_Textbook_Ch3.pdf', '/uploads/courses/15/Discrete_Math_Textbook_Ch3.pdf', 4096, 'Set theory, relations, functions, cardinality proofs', '2024-01-24 12:00:00'),
(1, 'Algorithm_Analysis_Example_Code.zip', '/uploads/courses/1/Algorithm_Analysis_Example_Code.zip', 512, 'Java implementations of sorting algorithms with complexity analysis', '2024-01-25 13:00:00'),
(2, 'SQL_Query_Examples.sql', '/uploads/courses/2/SQL_Query_Examples.sql', 256, 'Sample queries, JOIN patterns, subquery templates', '2024-01-26 14:00:00'),
(6, 'Polymorphism_Patterns_Code.zip', '/uploads/courses/6/Polymorphism_Patterns_Code.zip', 768, 'Design patterns using polymorphism, factory pattern, strategy pattern', '2024-01-27 15:00:00'),
(19, 'Network_Simulation_Data.csv', '/uploads/courses/19/Network_Simulation_Data.csv', 1280, 'Routing table data, latency measurements, bandwidth statistics', '2024-01-28 16:00:00'),
(21, 'ML_Dataset.csv', '/uploads/courses/21/ML_Dataset.csv', 5120, 'Training data for classification, feature descriptions, labels', '2024-01-29 17:00:00'),
(12, 'BTree_Implementation_Guide.pdf', '/uploads/courses/12/BTree_Implementation_Guide.pdf', 2560, 'Insertion algorithm, node splitting, search optimization', '2024-01-30 18:00:00'),
(13, 'Discrete_Math_Proofs.pdf', '/uploads/courses/13/Discrete_Math_Proofs.pdf', 1792, 'Mathematical proofs, induction examples, set identities', '2024-01-31 19:00:00');

-- ============================================================================
-- 9. ASSIGNMENTS (22 records)
-- ============================================================================
INSERT INTO assignments (course_id, title, description, deadline, priority, status, progress_percentage, created_at)
VALUES
(1, 'Hash Table Implementation', 'Implement a hash table from scratch with collision handling', '2024-02-15 23:59:00', 'high', 'in_progress', 75, '2024-02-01 09:00:00'),
(1, 'BST Traversal Algorithms', 'Implement in-order, pre-order, and post-order traversal', '2024-02-20 23:59:00', 'medium', 'not_started', 0, '2024-02-02 10:00:00'),
(2, 'Database Design Project', 'Design a normalized schema for a library management system', '2024-02-25 23:59:00', 'urgent', 'in_progress', 60, '2024-02-03 11:00:00'),
(2, 'SQL Query Optimization', 'Optimize slow queries using indexes and JOIN techniques', '2024-03-05 23:59:00', 'high', 'not_started', 0, '2024-02-04 12:00:00'),
(3, 'Inheritance Hierarchy Design', 'Create class hierarchy for animal types with proper inheritance', '2024-02-28 23:59:00', 'medium', 'submitted', 100, '2024-02-05 09:00:00'),
(3, 'Polymorphism Exercise', 'Implement polymorphic shapes with area calculation', '2024-03-10 23:59:00', 'medium', 'not_started', 20, '2024-02-06 10:00:00'),
(9, 'TCP Connection Simulation', 'Simulate TCP three-way handshake and data transfer', '2024-02-22 23:59:00', 'high', 'in_progress', 50, '2024-02-07 11:00:00'),
(9, 'DNS Query Implementation', 'Build a simple DNS resolver application', '2024-03-01 23:59:00', 'medium', 'not_started', 0, '2024-02-08 14:00:00'),
(15, 'Graph Algorithms Project', 'Implement DFS, BFS, and shortest path algorithms', '2024-03-15 23:59:00', 'high', 'not_started', 10, '2024-02-09 09:00:00'),
(12, 'B-Tree Implementation', 'Build a B-tree with insertion and deletion operations', '2024-03-20 23:59:00', 'urgent', 'in_progress', 45, '2024-02-10 10:00:00'),
(16, 'Memory Profiling Exercise', 'Identify and fix stack overflow in recursive functions', '2024-02-18 23:59:00', 'high', 'submitted', 100, '2024-02-11 11:00:00'),
(19, 'Dijkstra Algorithm Implementation', 'Implement shortest path finding for network routing', '2024-03-08 23:59:00', 'high', 'in_progress', 40, '2024-02-12 12:00:00'),
(21, 'ML Classification Project', 'Build a classifier using decision trees or SVM', '2024-03-25 23:59:00', 'urgent', 'in_progress', 55, '2024-02-13 14:00:00'),
(4, 'Relational Schema Design', 'Normalize a given schema to BCNF', '2024-02-28 23:59:00', 'medium', 'completed', 100, '2024-02-14 09:00:00'),
(5, 'Recursion Problem Set', 'Solve 10 recursion problems with memoization', '2024-02-24 23:59:00', 'high', 'submitted', 100, '2024-02-15 10:00:00'),
(8, 'Congestion Control Simulation', 'Simulate TCP congestion control algorithms', '2024-03-12 23:59:00', 'medium', 'not_started', 5, '2024-02-16 11:00:00'),
(11, 'Combinatorics Problem Set', 'Solve permutation and combination problems', '2024-02-20 23:59:00', 'low', 'completed', 100, '2024-02-17 09:00:00'),
(2, 'Index Performance Analysis', 'Compare query performance with and without indexes', '2024-03-08 23:59:00', 'high', 'in_progress', 35, '2024-02-18 10:00:00'),
(10, 'Network Security Implementation', 'Implement RSA encryption and digital signatures', '2024-03-18 23:59:00', 'urgent', 'not_started', 0, '2024-02-19 11:00:00'),
(1, 'Sorting Algorithm Analysis', 'Compare quicksort, mergesort, and heapsort performance', '2024-02-22 23:59:00', 'medium', 'completed', 100, '2024-02-20 09:00:00'),
(6, 'Design Patterns Implementation', 'Implement Factory, Strategy, and Observer patterns', '2024-03-05 23:59:00', 'high', 'in_progress', 70, '2024-02-21 10:00:00'),
(3, 'Encapsulation Best Practices', 'Refactor code to improve encapsulation', '2024-02-27 23:59:00', 'medium', 'submitted', 100, '2024-02-22 11:00:00');

-- ============================================================================
-- 10. NOTIFICATIONS (20 records)
-- ============================================================================
INSERT INTO notifications (user_id, assignment_id, message, type, is_read, created_at)
VALUES
(1, 1, 'Reminder: Hash Table Implementation due in 2 days', 'reminder', 1, '2024-02-13 09:00:00'),
(1, 2, 'Assignment BST Traversal Algorithms is due tomorrow', 'alert', 0, '2024-02-19 15:00:00'),
(1, NULL, 'AI Suggestion: Consider reviewing Hash Table collision strategies', 'ai_recommendation', 0, '2024-02-10 14:00:00'),
(1, 3, 'Your Database Design Project has been graded', 'system', 1, '2024-02-26 10:00:00'),
(2, 7, 'Reminder: TCP Connection Simulation due in 3 days', 'reminder', 1, '2024-02-19 08:00:00'),
(2, 8, 'Alert: DNS Query Implementation deadline is approaching', 'alert', 0, '2024-02-27 12:00:00'),
(2, NULL, 'AI Suggestion: Practice DNS query patterns with examples', 'ai_recommendation', 0, '2024-02-05 16:00:00'),
(3, 9, 'Reminder: Graph Algorithms Project milestone due soon', 'reminder', 0, '2024-03-10 09:00:00'),
(3, 10, 'Alert: B-Tree Implementation is now overdue', 'alert', 1, '2024-03-21 18:00:00'),
(3, NULL, 'System: Your progress on B-Tree is 45%. Keep working!', 'system', 1, '2024-03-15 17:00:00'),
(4, 11, 'Congratulations! You completed Memory Profiling Exercise', 'system', 1, '2024-02-18 14:00:00'),
(4, 12, 'Reminder: Dijkstra Algorithm Implementation due in 4 days', 'reminder', 0, '2024-03-04 10:00:00'),
(4, NULL, 'AI Suggestion: Review graph search algorithms before Dijkstra', 'ai_recommendation', 0, '2024-03-02 13:00:00'),
(5, 13, 'Alert: ML Classification Project is due in 1 week', 'alert', 0, '2024-03-18 11:00:00'),
(5, NULL, 'AI Suggestion: Use cross-validation to evaluate your model', 'ai_recommendation', 0, '2024-03-10 14:00:00'),
(5, 19, 'Alert: Network Security Implementation not started', 'alert', 1, '2024-02-22 09:00:00'),
(1, NULL, 'Tip: Use flashcards for memorizing Key-Value pair concepts', 'ai_recommendation', 0, '2024-02-12 10:00:00'),
(2, NULL, 'You earned a study streak of 7 days!', 'system', 1, '2024-02-28 19:00:00'),
(3, 18, 'Reminder: Index Performance Analysis due in 5 days', 'reminder', 0, '2024-03-03 08:00:00'),
(4, 20, 'Congratulations! You completed Sorting Algorithm Analysis', 'system', 1, '2024-02-22 15:00:00');

-- ============================================================================
-- 11. STUDY SESSIONS (20 records)
-- ============================================================================
INSERT INTO study_sessions (course_id, session_date, start_time, end_time, duration_minutes, session_type, notes)
VALUES
(1, '2024-02-01', '14:00:00', '15:30:00', 90, 'lecture', 'Review of hash table collision resolution, focus on separate chaining'),
(1, '2024-02-03', '16:00:00', '17:45:00', 105, 'practice', 'Implementing hash table insertion and lookup, tested with collisions'),
(1, '2024-02-05', '10:00:00', '11:30:00', 90, 'review', 'BST operations and traversal methods'),
(2, '2024-02-02', '13:00:00', '14:30:00', 90, 'lecture', 'Database normalization concepts, examples from real systems'),
(2, '2024-02-04', '15:00:00', '16:45:00', 105, 'practice', 'Designing schema for small projects, identifying anomalies'),
(3, '2024-02-06', '10:30:00', '12:00:00', 90, 'lecture', 'Inheritance and polymorphism in Java'),
(3, '2024-02-08', '14:00:00', '15:45:00', 105, 'practice', 'Writing class hierarchies and overriding methods'),
(9, '2024-02-07', '11:00:00', '12:30:00', 90, 'lecture', 'TCP/IP stack and protocol interactions'),
(9, '2024-02-09', '16:00:00', '17:30:00', 90, 'review', 'DNS system architecture and query resolution'),
(15, '2024-02-10', '13:00:00', '14:45:00', 105, 'exam_prep', 'Graph algorithms review for midterm'),
(12, '2024-02-11', '10:00:00', '11:45:00', 105, 'practice', 'B-tree insertion and node splitting'),
(16, '2024-02-12', '15:30:00', '16:45:00', 75, 'group_study', 'Debugging stack overflow issues together'),
(19, '2024-02-13', '09:00:00', '10:30:00', 90, 'practice', 'Implementing Dijkstra shortest path algorithm'),
(21, '2024-02-14', '14:00:00', '16:00:00', 120, 'exam_prep', 'ML classification techniques and evaluation metrics'),
(2, '2024-02-15', '10:30:00', '12:00:00', 90, 'lecture', 'Advanced SQL joins and subqueries'),
(4, '2024-02-16', '11:00:00', '12:30:00', 90, 'practice', 'Writing recursive functions with memoization'),
(8, '2024-02-17', '16:00:00', '17:15:00', 75, 'review', 'TCP congestion control mechanisms'),
(13, '2024-02-18', '13:30:00', '15:00:00', 90, 'exam_prep', 'Combinatorics and discrete probability review'),
(10, '2024-02-19', '10:00:00', '11:45:00', 105, 'group_study', 'Encryption algorithms and cryptography'),
(5, '2024-02-20', '14:00:00', '15:30:00', 90, 'practice', 'Solving complex recursion problems');

-- ============================================================================
-- 12. NOTE_TAGS (25 records - junction table)
-- ============================================================================
INSERT INTO note_tags (note_id, tag_id)
VALUES
(1, 1),   -- Hash Tables note + Important tag (user 1)
(1, 5),   -- Hash Tables note + Algorithm tag (user 1)
(2, 1),   -- BST Operations note + Important tag (user 1)
(2, 5),   -- BST Operations note + Algorithm tag (user 1)
(3, 1),   -- SQL SELECT note + Important tag (user 1)
(3, 3),   -- SQL SELECT note + Exam Prep tag (user 1)
(4, 1),   -- Database Normalization note + Important tag (user 1)
(5, 3),   -- OOP Inheritance note + Exam Prep tag (user 1)
(6, 1),   -- Polymorphism note + Important tag (user 2)
(6, 8),   -- Polymorphism note + Theory tag (user 2)
(7, 10),  -- TCP/IP note + Network tag (user 2)
(8, 10),  -- DNS note + Network tag (user 2)
(8, 1),   -- DNS note + Important tag (user 2)
(9, 2),   -- Set Theory note + Review Later tag (user 3)
(10, 11), -- Graph Theory note + Design Pattern tag (user 3)
(10, 5),  -- Graph Theory note + Algorithm tag (user 3)
(11, 12), -- B-Trees note + Performance tag (user 3)
(12, 1),  -- Stack Overflow note + Important tag (user 4)
(12, 13), -- Stack Overflow note + Bug Fix tag (user 4)
(13, 10), -- Routing Algorithms note + Network tag (user 4)
(14, 1),  -- ML Learning note + Important tag (user 5)
(15, 5),  -- SQL Joins note + Algorithm tag (user 1)
(15, 9),  -- SQL Joins note + Query tag (user 2)
(16, 1),  -- Encapsulation note + Important tag (user 4)
(16, 14); -- Encapsulation note + Documentation tag (user 4)

-- ============================================================================
-- 13. FLASHCARDS (28 records)
-- ============================================================================
INSERT INTO flashcards (note_id, question, answer, difficulty, card_type, is_ai_generated, created_at)
VALUES
(1, 'What is a hash collision?', 'A hash collision occurs when two different keys hash to the same index. Resolved using chaining or open addressing.', 'medium', 'flashcard', 0, '2024-02-01 10:00:00'),
(1, 'What is the load factor in a hash table?', 'Load factor = number of elements / table size. Controls when to rehash. Typically kept below 0.75.', 'medium', 'flashcard', 1, '2024-02-02 10:00:00'),
(2, 'Define a Binary Search Tree.', 'A tree where for each node, all values in left subtree are smaller and all in right subtree are larger.', 'easy', 'flashcard', 0, '2024-02-03 10:00:00'),
(2, 'What is the time complexity of BST search in worst case?', 'O(n) when the tree is completely unbalanced (like a linked list). O(log n) for balanced trees.', 'hard', 'quiz', 1, '2024-02-04 10:00:00'),
(3, 'What does the SQL WHERE clause do?', 'WHERE clause filters rows based on specified conditions. Always follows FROM in SELECT statements.', 'easy', 'flashcard', 0, '2024-02-05 10:00:00'),
(4, 'What is Third Normal Form (3NF)?', 'A relation is in 3NF if it is in 2NF and has no transitive dependencies on the primary key.', 'hard', 'flashcard', 1, '2024-02-06 10:00:00'),
(5, 'Explain inheritance in OOP.', 'Inheritance allows a class to inherit properties and methods from another class, promoting code reuse.', 'easy', 'flashcard', 0, '2024-02-07 10:00:00'),
(6, 'What is method overriding?', 'Method overriding allows a subclass to provide a specific implementation of a method defined in superclass.', 'medium', 'flashcard', 0, '2024-02-08 10:00:00'),
(7, 'Explain the TCP three-way handshake.', 'SYN → SYN-ACK → ACK. Client sends SYN, server responds with SYN-ACK, client sends ACK to establish connection.', 'hard', 'quiz', 1, '2024-02-09 10:00:00'),
(8, 'What does DNS do?', 'DNS translates human-readable domain names (e.g., google.com) to IP addresses (e.g., 142.251.32.14).', 'easy', 'flashcard', 0, '2024-02-10 10:00:00'),
(9, 'Define a set.', 'A set is an unordered collection of unique elements with no duplicates.', 'easy', 'flashcard', 0, '2024-02-11 10:00:00'),
(10, 'What is a graph?', 'A graph consists of vertices (nodes) and edges connecting them. Can be directed or undirected.', 'easy', 'flashcard', 1, '2024-02-12 10:00:00'),
(10, 'What is Depth-First Search (DFS)?', 'DFS explores as far as possible along each branch before backtracking. Uses stack or recursion.', 'medium', 'flashcard', 0, '2024-02-13 10:00:00'),
(11, 'What is a B-tree?', 'A self-balancing search tree optimized for disk access. Multiple keys per node, widely used in databases.', 'hard', 'quiz', 1, '2024-02-14 10:00:00'),
(12, 'What causes a stack overflow?', 'Stack overflow occurs when stack grows beyond allocated memory, often from deep recursion or infinite loops.', 'medium', 'flashcard', 0, '2024-02-15 10:00:00'),
(13, 'Explain Dijkstra algorithm.', 'Shortest path algorithm using greedy approach. Maintains distances and selects unvisited node with minimum distance.', 'hard', 'quiz', 1, '2024-02-16 10:00:00'),
(14, 'What is supervised learning?', 'Machine learning with labeled training data. Goal is to predict outputs based on learned patterns.', 'medium', 'flashcard', 0, '2024-02-17 10:00:00'),
(15, 'What is a SQL JOIN?', 'JOIN combines rows from multiple tables based on related columns. Types: INNER, LEFT, RIGHT, FULL.', 'easy', 'flashcard', 1, '2024-02-18 10:00:00'),
(16, 'Define encapsulation.', 'Bundling data and methods together while hiding internal details. Achieved through access modifiers.', 'easy', 'flashcard', 0, '2024-02-19 10:00:00'),
(17, 'What is TCP congestion control?', 'Mechanism to adjust transmission rate based on network congestion. Includes slow start and congestion avoidance.', 'hard', 'quiz', 1, '2024-02-20 10:00:00'),
(18, 'What is a permutation?', 'Arrangement of objects where order matters. Formula: nPr = n! / (n-r)!', 'medium', 'flashcard', 0, '2024-02-21 10:00:00'),
(3, 'What SQL operators are used for pattern matching?', 'LIKE operator with wildcards: % (any characters) and _ (single character).', 'easy', 'flashcard', 1, '2024-02-22 10:00:00'),
(6, 'Explain polymorphism with an example.', 'A shape can be Circle, Square, Triangle. Each implements draw() differently but called same way.', 'medium', 'flashcard', 0, '2024-02-23 10:00:00'),
(8, 'What is an A record in DNS?', 'A record maps a domain name to an IPv4 address. Example: example.com → 93.184.216.34', 'easy', 'flashcard', 0, '2024-02-24 10:00:00'),
(9, 'What is the power set?', 'Set of all subsets of a given set. For set {a,b}, power set is {{}, {a}, {b}, {a,b}}', 'hard', 'quiz', 1, '2024-02-25 10:00:00'),
(20, 'What are some encryption algorithms?', 'RSA (asymmetric), AES (symmetric), ECC, DES, SHA (hashing). Choice depends on security requirements.', 'hard', 'flashcard', 0, '2024-02-26 10:00:00'),
(19, 'Explain routing in computer networks.', 'Process of selecting paths for traffic between networks. Uses routing tables and protocols like BGP.', 'hard', 'flashcard', 1, '2024-02-27 10:00:00'),
(4, 'What is the difference between 2NF and 3NF?', '2NF removes partial dependencies on composite keys. 3NF removes transitive dependencies where non-key attributes depend on other non-key attributes.', 'hard', 'quiz', 1, '2024-02-28 10:00:00');

-- ============================================================================
-- 14. SUMMARIES (20 records - one per note)
-- ============================================================================
INSERT INTO summaries (note_id, summary_text, keywords, model_used, generated_at)
VALUES
(1, 'Hash tables provide O(1) average-case lookup using hashing functions. Collisions are managed through chaining or open addressing. Load factor controls when to rehash, typically maintaining ratio below 0.75 for performance.', 'hash table, collision, chaining, load factor, O(1) lookup', 'GPT-4', '2024-02-01 11:00:00'),
(2, 'Binary Search Trees maintain sorted data with O(log n) average operations. Balance is critical; unbalanced trees degrade to O(n). Supports insertion, deletion, and in-order traversal for sorted iteration.', 'BST, balance, O(log n), traversal, sorted', 'GPT-4', '2024-02-02 11:00:00'),
(3, 'SQL SELECT statements retrieve data with WHERE clauses for filtering. Supports wildcards (%) and operators (LIKE, AND, OR) for complex conditions. Essential for data querying.', 'SQL, SELECT, WHERE, filtering, wildcards', 'Claude', '2024-02-03 11:00:00'),
(4, 'Database normalization eliminates redundancy through 1NF, 2NF, 3NF, and BCNF. Each form removes specific anomalies: 1NF removes multivalued attributes, 2NF removes partial dependencies, 3NF removes transitive dependencies.', 'normalization, 1NF, 2NF, 3NF, BCNF, redundancy', 'GPT-4', '2024-02-04 11:00:00'),
(5, 'Inheritance enables code reuse by allowing classes to inherit from superclasses. Supports single and multiple inheritance (with diamond problem in some languages). Facilitates polymorphic behavior.', 'inheritance, superclass, subclass, code reuse, diamond problem', 'Claude', '2024-02-05 11:00:00'),
(6, 'Polymorphism enables objects to behave differently based on context. Method overriding allows subclasses to provide specific implementations. Essential for flexible, extensible OOP design.', 'polymorphism, overriding, dynamic dispatch, flexible design', 'GPT-4', '2024-02-06 11:00:00'),
(7, 'TCP/IP protocol stack consists of application, transport, network, and link layers. TCP ensures reliable delivery; UDP offers speed without guarantees. Fundamental to internet communication.', 'TCP/IP, OSI model, protocol stack, layers, reliable delivery', 'Claude', '2024-02-07 11:00:00'),
(8, 'DNS hierarchically translates domain names to IP addresses through recursive/iterative queries. TTL caches results; record types include A, AAAA, MX, CNAME. Critical for internet accessibility.', 'DNS, domain name, IP address, hierarchical, caching, record types', 'GPT-4', '2024-02-08 11:00:00'),
(9, 'Set theory studies collections of unique elements. Operations include union, intersection, complement, Cartesian product. Supports proofs and properties like De Morgan Laws and distributive properties.', 'set theory, union, intersection, Cartesian product, properties', 'Claude', '2024-02-09 11:00:00'),
(10, 'Graphs represent relationships between vertices using edges. Can be directed/undirected, weighted/unweighted. Traversals (DFS, BFS) explore structure; algorithms solve shortest path, connectivity problems.', 'graph, vertices, edges, DFS, BFS, traversal, shortest path', 'GPT-4', '2024-02-10 11:00:00'),
(11, 'B-trees self-balance for efficient disk access. Multiple keys per node; order t defines min/max degree. Insertion causes splits; deletion may cause merges. O(log n) for all operations.', 'B-tree, self-balancing, disk access, insertion, deletion, O(log n)', 'Claude', '2024-02-11 11:00:00'),
(12, 'Stack overflow results from stack memory depletion, typically from deep recursion or loops. Prevention requires limiting recursion depth or converting to iteration. Understanding stack vs heap crucial.', 'stack overflow, recursion depth, stack vs heap, memory', 'GPT-4', '2024-02-12 11:00:00'),
(13, 'Dijkstra algorithm finds shortest paths using greedy selection of minimum-distance unvisited nodes. Requires non-negative weights. O(E + V log V) with binary heap; foundation for many routing protocols.', 'Dijkstra, shortest path, greedy, routing, binary heap', 'Claude', '2024-02-13 11:00:00'),
(14, 'Supervised learning trains on labeled data to predict outputs. Classification handles categories; regression handles continuous values. Overfitting prevention uses techniques like cross-validation.', 'supervised learning, classification, regression, overfitting, training', 'GPT-4', '2024-02-14 11:00:00'),
(15, 'SQL JOINs combine rows from multiple tables. INNER returns matching rows; LEFT/RIGHT/FULL include unmatched rows. Subqueries retrieve data used in WHERE/FROM/SELECT clauses.', 'JOIN, INNER, LEFT, RIGHT, FULL, subquery', 'Claude', '2024-02-15 11:00:00'),
(16, 'Encapsulation hides internal data through access modifiers (public, private, protected). Getters/setters control access. Promotes information hiding and reduces coupling between classes.', 'encapsulation, access modifiers, getters, setters, information hiding', 'GPT-4', '2024-02-16 11:00:00'),
(17, 'TCP congestion control adjusts transmission rate per network conditions. Slow start gradually increases window; congestion avoidance maintains stability. Fast retransmit/recovery optimize recovery.', 'TCP, congestion control, slow start, window, fast retransmit', 'Claude', '2024-02-17 11:00:00'),
(18, 'Combinatorics studies counting principles. Permutations (nPr) count arrangements; combinations (nCr) count selections. Binomial theorem expands (a+b)^n; inclusion-exclusion principle avoids overcounting.', 'permutation, combination, binomial, counting, nPr, nCr', 'GPT-4', '2024-02-18 11:00:00'),
(19, 'Recursion solves problems by breaking into smaller subproblems. Base case stops recursion; recursive case calls itself. Memoization caches results; backtracking explores solution space systematically.', 'recursion, base case, memoization, backtracking, subproblems', 'Claude', '2024-02-19 11:00:00'),
(20, 'Network security uses encryption (AES, RSA), digital signatures, and authentication. SSL/TLS establishes secure connections; certificate authorities verify trust. Essential for protecting data.', 'encryption, RSA, AES, digital signatures, SSL/TLS, security', 'GPT-4', '2024-02-20 11:00:00');

-- ============================================================================
-- 15. FLASHCARD_REVIEWS (35 records)
-- ============================================================================
INSERT INTO flashcard_reviews (flashcard_id, review_date, score, next_review_date)
VALUES
(1, '2024-02-05', 85, '2024-02-12'),
(1, '2024-02-12', 90, '2024-02-19'),
(2, '2024-02-06', 75, '2024-02-10'),
(3, '2024-02-08', 95, '2024-02-15'),
(3, '2024-02-15', 92, '2024-02-22'),
(4, '2024-02-09', 70, '2024-02-11'),
(4, '2024-02-11', 78, '2024-02-16'),
(5, '2024-02-10', 88, '2024-02-17'),
(6, '2024-02-11', 82, '2024-02-18'),
(7, '2024-02-12', 65, '2024-02-14'),
(7, '2024-02-14', 72, '2024-02-19'),
(8, '2024-02-13', 91, '2024-02-20'),
(9, '2024-02-14', 60, '2024-02-15'),
(10, '2024-02-15', 87, '2024-02-22'),
(11, '2024-02-16', 94, '2024-02-23'),
(12, '2024-02-17', 79, '2024-02-21'),
(13, '2024-02-18', 86, '2024-02-25'),
(14, '2024-02-19', 68, '2024-02-21'),
(14, '2024-02-21', 75, '2024-02-26'),
(15, '2024-02-20', 89, '2024-02-27'),
(16, '2024-02-21', 81, '2024-02-28'),
(17, '2024-02-22', 76, '2024-02-26'),
(18, '2024-02-23', 92, '2024-03-02'),
(19, '2024-02-24', 77, '2024-02-28'),
(20, '2024-02-25', 64, '2024-02-26'),
(20, '2024-02-26', 71, '2024-03-01'),
(21, '2024-02-26', 84, '2024-03-05'),
(22, '2024-02-27', 90, '2024-03-06'),
(23, '2024-02-28', 85, '2024-03-07'),
(24, '2024-02-29', 73, '2024-03-04'),
(25, '2024-03-01', 88, '2024-03-08'),
(26, '2024-03-02', 79, '2024-03-09'),
(27, '2024-03-03', 93, '2024-03-10'),
(28, '2024-03-04', 67, '2024-03-06'),
(1, '2024-03-05', 94, '2024-03-12');

-- ============================================================================
-- 16. MILESTONES (12 records)
-- ============================================================================
INSERT INTO milestones (project_id, title, due_date, status, completed_at)
VALUES
(1, 'Architecture Design Complete', '2024-02-15', 'completed', '2024-02-14 15:30:00'),
(1, 'Backend Implementation Phase 1', '2024-03-01', 'in_progress', NULL),
(1, 'Frontend UI Development', '2024-03-15', 'not_started', NULL),
(2, 'Market Analysis and Planning', '2024-03-20', 'not_started', NULL),
(2, 'Product Specification Document', '2024-04-01', 'not_started', NULL),
(3, 'API Integration Complete', '2024-02-20', 'completed', '2024-02-19 10:00:00'),
(3, 'Mobile App Release', '2024-02-28', 'completed', '2024-02-27 14:00:00'),
(4, 'Graph Algorithm Research', '2024-02-28', 'completed', '2024-02-26 16:00:00'),
(4, 'Feature Development Milestone', '2024-04-15', 'in_progress', NULL),
(5, 'Query Optimization Specification', '2024-03-15', 'not_started', NULL),
(6, 'Initial Implementation', '2024-03-30', 'not_started', NULL),
(7, 'Protocol Simulation Framework', '2024-03-01', 'in_progress', NULL);

-- ============================================================================
-- 17. CONCEPT_LINKS (20 records - knowledge graph)
-- ============================================================================
INSERT INTO concept_links (from_concept_id, to_concept_id, relationship_type, created_at)
VALUES
(1, 2, 'prerequisite', '2024-02-01 12:00:00'),    -- Hash Tables → BST
(2, 10, 'related', '2024-02-02 12:00:00'),         -- BST → Graph Theory
(3, 4, 'prerequisite', '2024-02-03 12:00:00'),    -- SQL Queries → Normalization
(4, 20, 'related', '2024-02-04 12:00:00'),         -- Normalization → ACID
(5, 6, 'extends', '2024-02-05 12:00:00'),          -- Inheritance → Polymorphism
(7, 8, 'related', '2024-02-06 12:00:00'),          -- TCP/IP → DNS
(9, 10, 'similar_to', '2024-02-07 12:00:00'),     -- Set Theory → Graph Theory
(10, 13, 'related', '2024-02-08 12:00:00'),        -- Graph Theory → Routing
(11, 3, 'depends_on', '2024-02-09 12:00:00'),     -- B-Trees → SQL Queries
(1, 15, 'related', '2024-02-10 12:00:00'),         -- Hash Tables → Big O Notation
(2, 15, 'related', '2024-02-11 12:00:00'),         -- BST → Big O Notation
(16, 19, 'related', '2024-02-12 12:00:00'),        -- Recursion → Caching
(5, 16, 'prerequisite', '2024-02-13 12:00:00'),   -- Inheritance → Recursion
(12, 18, 'related', '2024-02-14 12:00:00'),        -- Stack Overflow → Encryption
(18, 20, 'related', '2024-02-15 12:00:00'),        -- Encryption → ACID
(14, 13, 'prerequisite', '2024-02-16 12:00:00'),   -- ML → Routing
(3, 15, 'extends', '2024-02-17 12:00:00'),         -- SQL Queries → Query Optimization
(10, 13, 'extends', '2024-02-18 12:00:00'),        -- Graph Theory → Advanced Routing
(9, 17, 'related', '2024-02-19 12:00:00'),         -- Set Theory → Synchronization
(7, 18, 'depends_on', '2024-02-20 12:00:00');      -- TCP/IP → Encryption

-- ============================================================================
-- End of Sample Data
-- ============================================================================
SELECT 'courses', COUNT(*) FROM courses
UNION ALL
SELECT 'tags', COUNT(*) FROM tags
UNION ALL
SELECT 'projects', COUNT(*) FROM projects
UNION ALL
SELECT 'concepts', COUNT(*) FROM concepts
UNION ALL
SELECT 'activity_logs', COUNT(*) FROM activity_logs
UNION ALL
SELECT 'notes', COUNT(*) FROM notes
UNION ALL
SELECT 'files', COUNT(*) FROM files
UNION ALL
SELECT 'assignments', COUNT(*) FROM assignments
UNION ALL
SELECT 'notifications', COUNT(*) FROM notifications
UNION ALL
SELECT 'study_sessions', COUNT(*) FROM study_sessions
UNION ALL
SELECT 'note_tags', COUNT(*) FROM note_tags
UNION ALL
SELECT 'flashcards', COUNT(*) FROM flashcards
UNION ALL
SELECT 'summaries', COUNT(*) FROM summaries
UNION ALL
SELECT 'flashcard_reviews', COUNT(*) FROM flashcard_reviews
UNION ALL
SELECT 'milestones', COUNT(*) FROM milestones
UNION ALL
SELECT 'concept_links', COUNT(*) FROM concept_links;



-- DROP DATABASE IF EXISTS synapse_db;