create database QuizSys;
use QuizSys;
drop database QuizSys; 
--DROP TABLE users;

CREATE TABLE programmingLanguage (
    Language_ID INT,
    Language_Name VARCHAR(255)
);

CREATE TABLE Problem (
    Problem_ID INT,
    Number_Questions INT,
    Creation_Date DATE,
    user_ID INT,
    Language_ID INT
);

CREATE TABLE Challenges (
    Challenge_ID INT,
    Title VARCHAR(255),
    Description TEXT,
    Problem_ID INT,
    Answer TEXT
);

CREATE TABLE users (
    User_ID INT,
    Username VARCHAR(255),
	FirstName VARCHAR(50),
	LastName VARCHAR(50),
    Passwords VARCHAR(255),
    Email VARCHAR(255),
    Role VARCHAR(50)
);

CREATE TABLE User_Leaderboard (
    User_Leaderboard_ID INT,
    Problem_ID INT,
    Score INT
);

CREATE TABLE quiz (
    Quiz_ID INT,
    Title VARCHAR(255),
    Description TEXT,
    Creation_Date DATE,
    Problem_ID INT
);

CREATE TABLE question (
    Question_ID INT,
    Text TEXT,
    Option_A VARCHAR(255),
    Option_B VARCHAR(255),
    Option_C VARCHAR(255),
    Option_D VARCHAR(255),
    Correct_Answer VARCHAR(255),
    Problem_ID INT
);

CREATE TABLE Submissions (
    Submission_ID INT,
    Problem_ID INT,
    Submission_Date DATE,
    Score INT
);
-- Add primary keys and foreign keys using ALTER TABLE

-- Alter programmingLanguage table to make Language_ID non-nullable
ALTER TABLE programmingLanguage
ALTER COLUMN Language_ID INT NOT NULL;
-- Add primary key constraint to programmingLanguage table
ALTER TABLE programmingLanguage
ADD CONSTRAINT PK_programmingLanguage PRIMARY KEY (Language_ID)

-- Add primary key to Problem table
ALTER TABLE Problem
ALTER COLUMN Problem_ID INT NOT NULL; -- Making the column non-nullable
ALTER TABLE Problem
ADD CONSTRAINT PK_Problem PRIMARY KEY (Problem_ID);

-- Add primary key to Challenges table
ALTER TABLE Challenges
ALTER COLUMN Challenge_ID INT NOT NULL; -- Making the column non-nullable
ALTER TABLE Challenges
ADD CONSTRAINT PK_Challenges PRIMARY KEY (Challenge_ID);

-- Add primary key to users table
ALTER TABLE users
ALTER COLUMN User_ID INT NOT NULL; -- Making the column non-nullable
ALTER TABLE users
ADD CONSTRAINT PK_users PRIMARY KEY (User_ID);

-- Add primary key to User_Leaderboard table
ALTER TABLE User_Leaderboard
ALTER COLUMN User_Leaderboard_ID INT NOT NULL; -- Making the column non-nullable
ALTER TABLE User_Leaderboard
ADD CONSTRAINT PK_User_Leaderboard PRIMARY KEY (User_Leaderboard_ID);

-- Add primary key to quiz table
ALTER TABLE quiz
ALTER COLUMN Quiz_ID INT NOT NULL; -- Making the column non-nullable
ALTER TABLE quiz
ADD CONSTRAINT PK_quiz PRIMARY KEY (Quiz_ID);

-- Add primary key to question table
ALTER TABLE question
ALTER COLUMN Question_ID INT NOT NULL; -- Making the column non-nullable
ALTER TABLE question
ADD CONSTRAINT PK_question PRIMARY KEY (Question_ID);

-- Add primary key to Submissions table
ALTER TABLE Submissions
ALTER COLUMN Submission_ID INT NOT NULL; -- Making the column non-nullable
ALTER TABLE Submissions
ADD CONSTRAINT PK_Submissions PRIMARY KEY (Submission_ID);

-- Add foreign keys using ALTER TABLE

-- Add foreign key to Problem table referencing users
ALTER TABLE Problem
ADD CONSTRAINT FK_Problem_users FOREIGN KEY (user_ID) REFERENCES users(User_ID);

-- Add foreign key to Problem table referencing programmingLanguage
ALTER TABLE Problem
ADD CONSTRAINT FK_Problem_programmingLanguage FOREIGN KEY (Language_ID) REFERENCES programmingLanguage(Language_ID);

-- Add foreign key to Challenges table referencing Problem
ALTER TABLE Challenges
ADD CONSTRAINT FK_Challenges_Problem FOREIGN KEY (Problem_ID) REFERENCES Problem(Problem_ID);

-- Add foreign key to User_Leaderboard table referencing Problem
ALTER TABLE User_Leaderboard
ADD CONSTRAINT FK_User_Leaderboard_Problem FOREIGN KEY (Problem_ID) REFERENCES Problem(Problem_ID);

-- Add foreign key to quiz table referencing Problem
ALTER TABLE quiz
ADD CONSTRAINT FK_quiz_Problem FOREIGN KEY (Problem_ID) REFERENCES Problem(Problem_ID);

-- Add foreign key to question table referencing Problem
ALTER TABLE question
ADD CONSTRAINT FK_question_Problem FOREIGN KEY (Problem_ID) REFERENCES Problem(Problem_ID);

-- Add foreign key to Submissions table referencing Problem
ALTER TABLE Submissions
ADD CONSTRAINT FK_Submissions_Problem FOREIGN KEY (Problem_ID) REFERENCES Problem(Problem_ID);
-----------------------
-- Insert data into programmingLanguage table
INSERT INTO programmingLanguage (Language_ID, Language_Name)
VALUES
    (1, 'Java'),
    (2, 'Python'),
    (3, 'JavaScript'),
    (4, 'C++');

-- Insert user records into the users table
INSERT INTO users (User_ID,Username ,FirstName, LastName, Passwords, Email, Role)
VALUES
    (1, 'admin_user','Admin','Adminuser','Admin','admin@example.com', 'Admin'),
    (2, 'Amira45', 'Amira','Ali','Amira@ali99', 'Amira_99_ali@example.com', 'User'),
    (3, 'Ali65','Ali','Salim','asa_ali445','aliSalim99@example.com', 'User'),
    (4, 'Sara98','Sara','Ahmed','Sara@@8787','Sara_ali74@example.com', 'User'),
    (5, 'Asam78','Asam','Hilal','Asam@54#214','Asam_hal447@example.com', 'User'),
    (6, 'Muza57','Muza','Hilal','Muza7788@123','Muzahai95@example.com', 'User'),
    (7, 'Rayan54','Rayan','Khalid','Rayan@3344@98','user5@example.com', 'User'),
    (8, 'Muzna88','Muzna','Sultan','Muzna#544@','Muzna44@example.com', 'User'),
    (9, 'Sultan55', 'Sultan','Mohammed','Sultan@4545','Sultan77@example.com', 'User'),
    (10, 'Raya66','Raya','Issa','Raya@488#','Raya487@example.com', 'User'),
    (11, 'Basma44','Basma','Haitham','Basma#5448','Basma@example.com', 'User'),
    (12, 'Ibtisam44', 'Ibtisam','Mahar','Ibtisam445', 'Ibtisam4@example.com', 'User');


-- Insert quiz questions for each programming language
INSERT INTO Problem (Problem_ID, Number_Questions, Creation_Date, user_ID, Language_ID)
VALUES
    (1, 5, '2023-08-15', 1, 1),
    (2, 5, '2023-08-15', 1, 2),
    (3, 5, '2023-08-15', 1, 3),
    (4, 5, '2023-08-15', 1, 4);

-- Insert data into quiz table for each programming language
INSERT INTO quiz (Quiz_ID, Title, Description, Creation_Date, Problem_ID)
VALUES
    (1, 'Java Quiz', 'Test your Java knowledge!', '2023-08-15', 1),
    (2, 'Python Quiz', 'Test your Python knowledge!', '2023-08-15', 2),
    (3, 'JavaScript Quiz', 'Test your JavaScript knowledge!', '2023-08-15', 3),
    (4, 'C++ Quiz', 'Test your C++ knowledge!', '2023-08-15', 4);

-- Insert quiz questions for Java
INSERT INTO question (Question_ID, Text, Option_A, Option_B, Option_C, Option_D, Correct_Answer, Problem_ID)
VALUES
    -- Question 1
    (1, 'What does JVM stand for?', 'Java Virtual Machine', 'Just Virtual Memory', 'Java Virtual Memory', 'Java Verified Memory', 'Java Virtual Machine', 1),
    -- Question 2
    (2, 'Which keyword is used to define a constant in Java?', 'const', 'constant', 'final', 'let', 'final', 1),
    -- Question 3
    (3, 'What is the output of the following code?\nint x = 10;\nSystem.out.println(x++ + ++x);', '20', '21', '22', '23', '22', 1),
    -- Question 4
    (4, 'Which data type is used to create a variable that should store text?', 'String', 'Text', 'txt', 'string', 'String', 1),
    -- Question 5
    (5, 'What is the purpose of the "break" statement in Java?', 'To end the current loop or switch statement', 'To exit the program', 'To skip the next iteration of the loop', 'To terminate the JVM', 'To end the current loop or switch statement', 1);

-- Insert quiz questions for Python
INSERT INTO question (Question_ID, Text, Option_A, Option_B, Option_C, Option_D, Correct_Answer, Problem_ID)
VALUES
    -- Question 1
    (6, 'What is the correct syntax to print "Hello, World!" in Python?', 'print("Hello, World!")', 'print("Hello World!")', 'echo "Hello, World!"', 'echo "Hello World!"', 'print("Hello, World!")', 2),
    -- Question 2
    (7, 'Which keyword is used to define a function in Python?', 'func', 'def', 'define', 'function', 'def', 2),
    -- Question 3
    (8, 'What is the output of the following code?\nnumbers = [1, 2, 3]\nprint(numbers[1])', '1', '2', '3', 'Error', '2', 2),
    -- Question 4
    (9, 'Which data type is used to store a sequence of characters in Python?', 'string', 'char', 'text', 'str', 'str', 2),
    -- Question 5
    (10, 'What is the purpose of the "if" statement in Python?', 'To create a loop', 'To define a function', 'To make decisions', 'To skip an iteration', 'To make decisions', 2);

-- Insert quiz questions for JavaScript
INSERT INTO question (Question_ID, Text, Option_A, Option_B, Option_C, Option_D, Correct_Answer, Problem_ID)
VALUES
    -- Question 1
    (11, 'How do you declare a variable in JavaScript?', 'v myVar;', 'variable myVar;', 'var myVar;', 'let myVar;', 'var myVar;', 3),
    -- Question 2
    (12, 'What is the correct syntax for referring to an external script named "script.js"?', 'script src="script.js"', 'script href="script.js"', 'script name="script.js"', 'script link="script.js"', 'script src="script.js"', 3);
-- Insert records into User_Leaderboard table
INSERT INTO User_Leaderboard (User_Leaderboard_ID, Problem_ID, Score)
VALUES
    (1, 1, 100),
    (2, 2, 75);

INSERT INTO Submissions (Submission_ID, Problem_ID, Submission_Date, Score)
VALUES
    (1, 1, '2023-08-15', 90),
    (2, 3, '2023-08-15', 85);
