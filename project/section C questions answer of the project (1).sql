--Retrieve full information stored in one table:
--For example, let's retrieve the full information stored in the users table:

SELECT * FROM users;

SELECT * FROM Challenges;

--Retrieve records from any table that satisfy certain criteria:
--For instance, let's retrieve the records from the Problem table where the Number_Questions is greater than or equal to 5:

SELECT * FROM Problem
WHERE Number_Questions >= 5;

SELECT * FROM User_Leaderboard
WHERE Score >= 80;

-- Retrieve the record with the maximum value from a numeric field:
--This query retrieves the record(s) from the User_Leaderboard table where 
--the Score is equal to the maximum score value in the table.

SELECT *
FROM User_Leaderboard
WHERE Score = (SELECT MAX(Score) FROM User_Leaderboard);

--retrieve the record(s) with the maximum value in the Score

SELECT *
FROM Submissions
WHERE Score = (SELECT MAX(Score) FROM Submissions);

--List related information from two tables. The list must contain at least one field from each table.
--his query retrieves the User_Leaderboard_ID, FirstName, and Score from the User_Leaderboard table while
--joining it with the users table based on the common User_ID.
SELECT C.Title, P.Problem_ID, P.Number_Questions
FROM Challenges C, Problem P 
WHERE C.Problem_ID = P.Problem_ID;

SELECT C.Title, U.Username
FROM Challenges C, Problem P, users U
WHERE C.Problem_ID = P.Problem_ID AND P.user_ID = U.User_ID;

SELECT * FROM problem;

/*Produce a statistical list (Query) of two columns only, which 
aggregates the records within a table based on the values stored in
one textual-field (the 1st column) while the 2nd column lists aggregated 
information using one of these functions: ‘COUNT’, ‘SUM’, or ‘AVERAGE’. */

--Using COUNT function:
--count the number of submissions for each user in the Submissions table
--query groups the submissions by user_ID and counts the number of submissions
--for each user, displaying the result in two columns: user_ID and Submission_Count

SELECT u.user_ID, COUNT(*) AS Submission_Count
FROM Submissions s, Problem p, users u
WHERE s.Problem_ID = p.Problem_ID
AND p.user_ID = u.User_ID
GROUP BY u.user_ID;

--Using SUM function:
--calculate the total score achieved by each user in the User_Leaderboard table.

/*This query calculates the total score for each user by summing the scores from 
the User_Leaderboard table, where the scores are associated with specific problems 
through a foreign key relationship with the Problem table. The result provides a list 
of users along with their corresponding aggregated total scores*/

SELECT u.user_ID, SUM(ul.Score) AS Total_Score
FROM User_Leaderboard ul, Problem p, users u
WHERE ul.Problem_ID = p.Problem_ID
AND p.user_ID = u.User_ID
GROUP BY u.user_ID;


/*
Produce a calculated list (Query) based on a single table. 
The list must have at least two columns, one of them is textual column 
while the 2nd column is calculated (e.g., summed-up) from other fields.
*/

-- Calculate the total score for each user from the User_Leaderboard table using a subquery
SELECT u.Username,
       (SELECT SUM(Score) 
	   FROM User_Leaderboard ul ,Problem p
	   WHERE ul.Problem_ID = p.Problem_ID and p.user_ID = u.User_ID) AS Total_Score
FROM users u;

