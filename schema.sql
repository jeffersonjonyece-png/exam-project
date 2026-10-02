-- USERS
CREATE TABLE Users (
    user_id     INT AUTO_INCREMENT PRIMARY KEY,
    name        VARCHAR(25) NOT NULL,
    email       VARCHAR(25) NOT NULL UNIQUE,
    role        ENUM('Student', 'Faculty') NOT NULL,
   created_at  TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
   nshe_id   CHAR(10) NOT NULL UNIQUE, 
   student_id CHAR(10) NOT NULL UNQIUE 
);

-- EXAM SESSIONS
CREATE TABLE ExamSessions (
    session_id    INT AUTO_INCREMENT PRIMARY KEY,
    exam_name     VARCHAR(150) NOT NULL,
    session_date  DATETIME NOT NULL,
    capacity      INT NOT NULL DEFAULT 20 CHECK (capacity > 0),
    is_active TINYINT(1) NOT NULL DEFAULT
);

-- REGISTRATIONS
CREATE TABLE Registrations (
    registration_id INT AUTO_INCREMENT PRIMARY KEY,
    user_id          INT NOT NULL,
    session_id       INT NOT NULL,
    registered_at    TIMESTAMP DEFAULT CURRENT_TIMESTAMP,

    CONSTRAINT fk_reg_user
        FOREIGN KEY (user_id) REFERENCES Users(user_id)
        ON DELETE CASCADE,

    CONSTRAINT fk_reg_session
        FOREIGN KEY (session_id) REFERENCES ExamSessions(session_id)
        ON DELETE CASCADE,

    CONSTRAINT uq_user_session UNIQUE (user_id, session_id)  -- prevents duplicate registration
);

