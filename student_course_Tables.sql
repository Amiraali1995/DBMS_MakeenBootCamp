/*CREATE TABLE Courses (
    CourseID INT PRIMARY KEY,
    CourseName NVARCHAR(100) NOT NULL,
    CourseDescription NVARCHAR(255),
    CourseCredits INT
);

CREATE TABLE Students (
    StudentID INT PRIMARY KEY,
    FirstName NVARCHAR(50) NOT NULL,
    LastName NVARCHAR(50) NOT NULL,
    Age INT,
    Gender NVARCHAR(10),
    Email NVARCHAR(100)
);



*/ 
/*
ALTER TABLE Students
ADD CourseID INT,FOREIGN KEY (CourseID) REFERENCES Courses(CourseID);
*/

/*

--ALTER TABLE Students ADD CONSTRAINT STUDENT_COURSE_FK FOREIGN KEY(CourseID) REFERENCES Courses(CourseID) ON DELETE CASCADE;

INSERT INTO Courses (CourseID, CourseName, CourseDescription, CourseCredits)
VALUES (1, 'Mathematics 101', 'Introduction to Mathematics', 3);

INSERT INTO Courses (CourseID, CourseName, CourseDescription, CourseCredits)
VALUES (2, 'English Composition', 'Basic English writing and communication skills', 4);

INSERT INTO Courses (CourseID, CourseName, CourseDescription, CourseCredits)
VALUES (3, 'History of World', 'Overview of world history', 3);
*/



/*
INSERT INTO Students (StudentID, FirstName, LastName, Age, Gender, Email, CourseID)
VALUES (1, 'John', 'Doe', 20, 'Male', 'john.doe@example.com', 1);

INSERT INTO Students (StudentID, FirstName, LastName, Age, Gender, Email, CourseID)
VALUES (2, 'Jane', 'Smith', 22, 'Female', 'jane.smith@example.com', 2);

INSERT INTO Students (StudentID, FirstName, LastName, Age, Gender, Email, CourseID)
VALUES (3, 'Michael', 'Johnson', 19, 'Male', 'michael.johnson@example.com', 3);

*/
SELECT * FROM Students;
SELECT * FROM Courses;
SELECT TABLE_NAME, CONSTRAINT_TYPE,CONSTRAINT_NAME
FROM INFORMATION_SCHEMA.TABLE_CONSTRAINTS WHERE TABLE_NAME='Students';

SELECT CONVERT(TIME,SYSDATETIME() )AS TODAY,
SYSDATETIMEOFFSET(),
SYSUTCDATETIME();


/*
--COPY THE VALUES FROM TEST1 TO TEST2 
-- WE WILL CREATE TWO TABLES TEST1 AND TEST2 , TEST1 WITH RECORDS AND TEST2 WITHOUT RECORDS ,THE WE WILL COPY THE RECORDS THAT IS IN TEST1 TO TEST2
CREATE TABLE TEST1 (
    T_ID INT PRIMARY KEY,
    FirstName NVARCHAR(50) NOT NULL,
    LastName NVARCHAR(50) NOT NULL   
);

CREATE TABLE TEST2 (
    T_ID INT PRIMARY KEY,
    FirstName NVARCHAR(50) NOT NULL,
    LastName NVARCHAR(50) NOT NULL,
    );

INSERT INTO TEST1(T_ID, FirstName, LastName)
VALUES (3, 'AMIRA', 'ALI')
INSERT INTO TEST1(T_ID, FirstName, LastName)
VALUES (4, 'ASMA', 'HILAL')
INSERT INTO TEST1(T_ID, FirstName, LastName)
VALUES (6, 'MUZN', 'HILAL')

INSERT INTO TEST2(T_ID, FirstName, LastName)
SELECT T_ID, FirstName, LastName FROM TEST1;
*/

SELECT * FROM TEST1;
--SELECT * FROM TEST2;
/*
CREATE TABLE product (
    id INT PRIMARY KEY,
    name VARCHAR(255) NOT NULL,
    quantity INT,
    price DECIMAL(10, 2)
);*/
/*
-- Inserting a single record
INSERT INTO product (id, name, quantity, price)
VALUES (1, 'Product A', 100, 19.99);

-- Inserting multiple records in a single query
INSERT INTO product (id, name, quantity, price)
VALUES
    (2, 'Product B', 50, 29.99),
    (3, 'Product X', 75, 9.99),
    (4, 'Product Y', 200, 15.50),
    (5, 'Product N', 30, 49.95);
*/
	
--SELECT quantity,price,(quantity * price) AS Total_Result FROM product;
SELECT id,name,quantity,price,(quantity * price) AS Total_Result FROM product;
/*
UPDATE product set price =(
select price from product 
where name='Product B')where name='Product N';
*/