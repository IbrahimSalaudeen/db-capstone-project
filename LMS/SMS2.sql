Create Database School_management_system;

USE School_management_system;
-- Creating course table to store course details
CREATE TABLE Course (
  id INT PRIMARY KEY,
  title VARCHAR(255),
  description VARCHAR(255),
  author VARCHAR(255),
  length INT,
  category_id INT,
  FOREIGN KEY (category_id) REFERENCES Category(id)
);

-- Role table to store role id and name
CREATE TABLE Role (
  id INT,
  RoleName Varchar(20) Default "user"
);

-- instructors table for intructors information
CREATE TABLE Instructor (
  id INT PRIMARY KEY,
  name VARCHAR(255),
  bio VARCHAR(255),
  photo_url VARCHAR(255),
  email VARCHAR(255),
  phone VARCHAR(255),
  certifications_url Varchar(255),
  role_id Int,
  FOREIGN KEY (role_id) REFERENCES Role(id)
);

-- learner tables
CREATE TABLE Enrollee (
  id INT PRIMARY KEY,
  name VARCHAR(255),
  email VARCHAR(255),
  username VARCHAR(255),
  password VARCHAR(255),
  role_id Int,
  FOREIGN KEY (role_id) REFERENCES Role(id)
);

-- lesson tables for storing courses information
CREATE TABLE Lesson (
  id INT PRIMARY KEY,
  title VARCHAR(255),
  description VARCHAR(255),
  content TEXT,
  video_url VARCHAR(255),
  course_id INT,
  FOREIGN KEY (course_id) REFERENCES Course(id)
);


-- Quiz
CREATE TABLE Quiz (
  id INT PRIMARY KEY,
  title VARCHAR(255),
  description VARCHAR(255),
  course_id INT,
  FOREIGN KEY (course_id) REFERENCES Course(id)
);



CREATE TABLE Question (
  id INT PRIMARY KEY,
  text VARCHAR(255),
  quiz_id INT,
  FOREIGN KEY (quiz_id) REFERENCES Quiz(id)
);

CREATE TABLE Answer (
  id INT PRIMARY KEY,
  text VARCHAR(255),
  is_correct BOOLEAN,
  question_id INT,
  FOREIGN KEY (question_id) REFERENCES Question(id)
);

CREATE TABLE Assignment (
  id INT PRIMARY KEY,
  title VARCHAR(255),
  description VARCHAR(255),
  due_date DATE,
  submission TEXT,
  course_id INT,
  enrollee_id INT,
  FOREIGN KEY (course_id) REFERENCES Course(id),
  FOREIGN KEY (enrollee_id) REFERENCES Enrollee(id)
);

CREATE TABLE Discussion (
  id INT PRIMARY KEY,
  title VARCHAR(255),
  description VARCHAR(255),
  course_id INT,
  FOREIGN KEY (course_id) REFERENCES Course(id)
);

CREATE TABLE Thread (
  id INT PRIMARY KEY,
  title VARCHAR(255),
  discussion_id INT,
  FOREIGN KEY (discussion_id) REFERENCES Discussion(id)
);

CREATE TABLE Post (
  id INT PRIMARY KEY,
  text TEXT,
  thread_id INT,
  enrollee_id INT,
  FOREIGN KEY (thread_id) REFERENCES Thread(id),
  FOREIGN KEY (enrollee_id) REFERENCES Enrollee(id)
);

CREATE TABLE Certificate (
  id INT PRIMARY KEY,
  title VARCHAR(255),
  description VARCHAR(255),
  issue_date DATE,
  enrollee_id INT,
  course_id INT,
  FOREIGN KEY (enrollee_id) REFERENCES Enrollee(id),
  FOREIGN KEY (course_id) REFERENCES Course(id)
);

CREATE TABLE Payment (
  id INT PRIMARY KEY,
  amount DECIMAL(10, 2),
  payment_date DATE,
  payment_method VARCHAR(255),
  payment_status VARCHAR(255),
  enrollee_id INT,
  course_id INT,
  FOREIGN KEY (enrollee_id) REFERENCES Enrollee(id),
  FOREIGN KEY (course_id) REFERENCES Course(id)
);

CREATE TABLE Category (
  id INT PRIMARY KEY,
  name VARCHAR(255),
  description VARCHAR(255)
);

CREATE TABLE Course_Instructor (
  course_id INT,
  instructor_id INT,
  PRIMARY KEY (course_id, instructor_id),
  FOREIGN KEY (course_id) REFERENCES Course(id),
  FOREIGN KEY (instructor_id) REFERENCES Instructor(id)
);

  
