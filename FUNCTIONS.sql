--FUNCTION
/*
Example •
Create a function named circle_area(), which returns the area of a circle. •
The radius of the circle is passed as a parameter named p_radius to circle_area();
 notice that circle_area() returns a NUMERIC value:
*/

-- Create or alter a function named 'circle_area' that calculates and returns the area of a circle
CREATE OR ALTER FUNCTION circle_area (@p_radius NUMERIC(10,2))
RETURNS NUMERIC(8,2)
AS 
BEGIN 
    -- Declare a constant for the value of pi
    DECLARE @V_PI NUMERIC(8,2) = PI();
    
    -- Declare a variable to store the calculated area
    DECLARE @area NUMERIC(8,2);
    
    -- Calculate the area using the formula: pi * radius^2
    SET @area = @V_PI * POWER(@p_radius, 2);
    
    -- Return the calculated area
    RETURN @area;
END
--we can show the output with the select statment 
--select dbo.circle_area(5) as area;
-- Example usage
--or output by this 
DECLARE @radius NUMERIC(8,2);
SET @radius = 5;

-- Call the 'circle_area' function and store the result
DECLARE @result NUMERIC(8,2);
SET @result = dbo.circle_area(@radius);

-- Print the result
PRINT 'The area of the circle with radius ' + CAST(@radius AS NVARCHAR(10)) + ' is ' + CAST(@result AS NVARCHAR(20));

----------------------------------------------------------

/*create scalar function that concatonate a first name
and last name from customer table  and taking the id as a parameter */
-- Create or alter a function named 'concatenate_names'
CREATE OR ALTER FUNCTION concat_fn_ln (@id INT)
RETURNS NVARCHAR(100)
AS 
BEGIN 
    DECLARE @full_name NVARCHAR(100);

    SELECT @full_name = FirstName + ' ' + LastName
    FROM Customer
    WHERE Id = @id;

    RETURN @full_name;
END
/*SELECT Id, dbo.concat_fn_ln(Id) AS Full_Name
FROM Customer
WHERE Id=1;*/
-- Replace with the desired customer ID
DECLARE @customer_id INT = 1; 

-- Call the 'concatenate_names' function and store the result
DECLARE @name NVARCHAR(100);
SET @name = dbo.concat_fn_ln(@customer_id);

-- Print the result
PRINT 'Full Name with ID ' + 
       CAST(@customer_id AS NVARCHAR(10)) + ' is ' + @name;
--------------------------------------------------------------------
-- Create or alter a function named 'getcustomersbycountry'
-- This function takes a country name as a parameter and returns customer details for that country
CREATE OR ALTER FUNCTION getcustomersbycountry (@country NVARCHAR(50))
RETURNS TABLE
AS 
RETURN 

    -- Select customer details from the Customer table based on the provided country
    SELECT Id, FirstName, LastName, City, Country
    FROM Customer
    WHERE Country = @country;


-- Example usage with a SELECT statement
-- Retrieve customers from the USA using the 'getcustomersbycountry' function
SELECT *
FROM dbo.getcustomersbycountry('USA');

-----------------------------------------

-- Create or alter a function named 'getProductDetails'
-- This function takes a supplier ID as a parameter and returns product details for that supplier
CREATE OR ALTER FUNCTION getProductDetails(@cid int)
RETURNS TABLE
AS 
RETURN 
(
    -- Select product details from the Product and Supplier tables based on the provided supplier ID
    SELECT p.Id, CompanyName, ProductName
    FROM Supplier s, Product p
    WHERE s.Id = p.SupplierId and s.Id = @cid
);

-- Example usage with a SELECT statement
-- Retrieve product details for supplier with ID 10 using the 'getProductDetails' function
SELECT *
FROM dbo.getProductDetails(10);


-----------------------------------------------------------------------------------
/*
Create a function that determine the total sales amount for 
each year and each customer and taking the year as a parameter

*/
-- Create or alter a function named 'getTotalSalesByYear'
-- This function calculates the total sales amount for each year and customer based on the provided year parameter
CREATE OR ALTER FUNCTION getTotalSalesByYear(@year INT)
RETURNS TABLE
AS 
RETURN 

    SELECT  YEAR(o.OrderDate) AS SalesYear,c.Id,
	c.FirstName , c.LastName,
	SUM(od.Quantity * od.UnitPrice) AS TotalSalesAmount
    FROM Customer c,"Order" o,OrderItem  od
    
   
    WHERE YEAR(o.OrderDate) = @year and  o.Id = od.OrderId and c.Id = o.CustomerId
	GROUP BY c.Id, YEAR(o.OrderDate),c.FirstName,c.LastName


SELECT *
FROM dbo.getTotalSalesByYear(2012);
SELECT *
FROM dbo.getTotalSalesByYear(2013);
SELECT *
FROM dbo.getTotalSalesByYear(2014);
-- Create or alter a function named 'getTotalSalesByYear'
-- This function calculates the total sales amount for each year and customer based on the provided year parameter
CREATE OR ALTER FUNCTION getTotalSalesByYear(@year INT)
RETURNS TABLE
AS 
RETURN 

    -- Select customer ID, year, and total sales amount for each customer and year
    SELECT  YEAR(o.OrderDate) AS SalesYear, c.Id,
            c.FirstName, c.LastName,
            SUM(od.Quantity * od.UnitPrice) AS TotalSalesAmount
    FROM Customer c, "Order" o,OrderItem od
    WHERE YEAR(o.OrderDate) = @year and o.Id = od.OrderId and c.Id = o.CustomerId
    GROUP BY c.Id, YEAR(o.OrderDate), c.FirstName, c.LastName


-- Example usage with SELECT statements
-- Retrieve total sales amount for each customer for the years 2012, 2013, and 2014 using the 'getTotalSalesByYear' function
SELECT *
FROM dbo.getTotalSalesByYear(2012);

SELECT *
FROM dbo.getTotalSalesByYear(2013);

SELECT *
FROM dbo.getTotalSalesByYear(2014);
