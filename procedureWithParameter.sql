-- Create or alter a stored procedure named 'read_product_procedure'
CREATE OR ALTER PROCEDURE read_product_procedure 
@pcity AS NVARCHAR(40) -- Declare a parameter @pcity of type NVARCHAR with a maximum length of 40
AS 
BEGIN 
-- Declare a variable @city_name and assign the value of the input parameter @pcity to it
DECLARE @city_name NVARCHAR(40) = @pcity;

-- Select all columns from the Suppliers table where the City column matches the value in @city_name
SELECT * FROM Supplier WHERE City = @city_name;
END 

-- Execute the stored procedure 'read_product_procedure' with the argument 'New Orleans'
EXEC read_product_procedure 'New Orleans';
------------------------------------------------------------
--procedure same like function but procedure does not have a return function 
--function can be used with DML
-- Create or alter a stored procedure named 'product_details'
CREATE OR ALTER PROCEDURE product_details 
    @id INT,
    @productName NVARCHAR(40) OUTPUT,
    @unitprice DECIMAL(12,2) OUTPUT
AS 
BEGIN 
    -- Select the ProductName and UnitPrice from the Product table based on the given Id
    SELECT @productName = ProductName, @unitPrice = UnitPrice
    FROM Product
    WHERE Id = @id;
END

-- Begin a new code block
BEGIN 
    -- Declare variables to store the retrieved product details
    DECLARE @name NVARCHAR(50);
    DECLARE @price DECIMAL(12,2);

    -- Execute the 'product_details' stored procedure with Id 11 and store the output values in the variables
    EXEC product_details 11, @name OUTPUT, @price OUTPUT;

    -- Print the retrieved product name and price
    PRINT @name;
    PRINT @price;
END
------------------------------------------------

-- Create or alter a stored procedure named 'READ_CUSTOMER_PROC'
CREATE OR ALTER PROCEDURE READ_CUSTOMER_PROC
    @ID INT,
    @CUSTOMER_FNAME NVARCHAR(40) OUTPUT,
    @CUSTOMER_LNAME NVARCHAR(40) OUTPUT,
    @PHONE NVARCHAR(20) OUTPUT
AS 
BEGIN
    -- Select FirstName, LastName, and Phone from the Customer table based on the given Id
    SELECT @CUSTOMER_FNAME = FirstName, @CUSTOMER_LNAME = LastName, @PHONE = Phone
    FROM Customer
    WHERE Id = @ID;
END;

-- Begin a new code block
BEGIN
    -- Declare variables to store the retrieved customer details
    DECLARE @FNAME NVARCHAR(40);
    DECLARE @LNAME NVARCHAR(40);
    DECLARE @CPHONE NVARCHAR(20);

    -- Execute the 'READ_CUSTOMER_PROC' stored procedure with Id 11 and store the output values in the variables
    EXEC READ_CUSTOMER_PROC 11, @FNAME OUTPUT, @LNAME OUTPUT, @CPHONE OUTPUT;

    -- Print the concatenated customer's first name, last name, and phone number
    PRINT @FNAME ;
	print @LNAME;
	print @CPHONE;
END

--------------------------------------------
--Procedure Parameter with deafualt value 
-- Create or alter a stored procedure named 'product_details'
CREATE OR ALTER PROCEDURE product_details 
    @id INT = 10,  -- Set a default value for the @id parameter
    @productName NVARCHAR(40) OUTPUT,
    @unitprice DECIMAL(12,2) OUTPUT
AS 
BEGIN 
    -- Select the ProductName and UnitPrice from the Product table based on the given Id
    SELECT @productName = ProductName, @unitPrice = UnitPrice
    FROM Product
    WHERE Id=@id;
END

-- Begin a new code block
BEGIN 
    -- Declare variables to store the retrieved product details
    DECLARE @name NVARCHAR(50);
    DECLARE @price DECIMAL(12,2);

    -- Execute the 'product_details' stored procedure with Id 11 and store the output values in the variables
    EXEC product_details default, @name OUTPUT, @price OUTPUT;

    -- Print the retrieved product name and price
    PRINT @name;
    PRINT @price;
	PRINT @name +' '+CAST(@price as varchar);
END
--------------------------------------------------------------
CREATE OR ALTER PROCEDURE EvenOdd
    @number INT
AS 
BEGIN 
    IF @number % 2 = 0
        PRINT 'The number ' + CAST(@number AS NVARCHAR(10)) + ' is Even.';
    ELSE
        PRINT 'The number ' + CAST(@number AS NVARCHAR(10)) + ' is Odd.';
END

EXEC EvenOdd @number = 22;
EXEC EvenOdd @number = 17;
EXEC EvenOdd @number = 13;
EXEC EvenOdd @number = 40;
EXEC EvenOdd @number = 10;
EXEC EvenOdd @number = 1;

----------------------------------------------------------------------
