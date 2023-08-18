BEGIN 
   PRINT 'WELCOME TO T-SQL';
END 

---------------------------------------
BEGIN
DECLARE @VAR1 INT=5;
DECLARE @VAR2 INT;
SET @VAR2 =5
PRINT @VAR1;
END

----------------------------------------
BEGIN  
DECLARE @NAME VARCHAR(20);
DECLARE @SAL NUMERIC(8,2);
SET @NAME ='ALI';
SET @SAL =700;
PRINT @NAME;
PRINT @SAL ;
PRINT @NAME +  '  ' +CAST(@SAL AS VARCHAR); -- CASTING TO CONVERT THE DATATYPES 
END
------------------------------------------------------------
-- CALCULATE THE HEIGHT AND WIDTH OF RECTANGLE 
BEGIN  
DECLARE @HEIGHT INT ;
DECLARE @WIDTH INT;
DECLARE @AREA INT;
SET @HEIGHT = 5;
SET @WIDTH =5;
SET @AREA =@WIDTH * @HEIGHT;
PRINT 'THE AREA IS '+ CAST((@AREA) AS VARCHAR);
END
---------------------------------------------------------
--DISPLAY CUSTOMER FIRSTNAME AND LASTNAME WHERE CUSTOMER ID = 4
BEGIN  
DECLARE @firstname  VARCHAR(20) ;
DECLARE @lastname  VARCHAR(20) ;
SELECT @firstname= FIRSTNAME , @lastname=LASTNAME
FROM CUSTOMER
WHERE Id= 4;
PRINT 'CUSTOMER WITH ID 4 '+@firstname+' ' + @firstname;
END
---------------------------------------------------------
-- PRINT THE AVG OF PRODUCTS PRICE IS +AVG
BEGIN 
DECLARE @AVRAGEPRICE NUMERIC(8,2);
select @AVRAGEPRICE= AVG(UnitPrice) from Product;
PRINT ' the averge price' +CAST(@AVRAGEPRICE AS VARCHAR);
END

----------------------------------------------------------
-- To check is the price of the product is expensive or not expensive where id = 35
BEGIN 
DECLARE @PRICE NUMERIC(12,2);
SELECT @PRICE = UnitPrice FROM Product where Id =35;
IF @PRICE >=100
 PRINT 'THE PRODUCT IS EXPENSIVE';
ELSE 
 PRINT 'THE PRODUCT IS NOT EXPENSIVE';
END
--SELECT UnitPrice from product where Id = 35;
-----------------------------------------------------------
BEGIN
DECLARE @PriceUnit NUMERIC(12, 2)=70;
--where id  from 30 to 40-- Check if the unit price is greater than or equal to 50
IF @PriceUnit >= 50
   SELECT * FROM Product WHERE UnitPrice >=50;
ELSE
   SELECT * FROM Product WHERE UnitPrice <50; 
END 

------------------------------------------------------------


SELECT CompanyName,Country= 
       Case Country
	   when 'UK' then 'United kindom'
	   when 'USA' then 'United state'
	   else Country
END
from Supplier;
select * from Supplier;
--------------------------------------------------------------
/*BEGIN
SELECT Country, Fax=
  case Fax 
  when null then 'NOT FOUND'
  else Fax
  end
from Supplier
END*/

BEGIN
SELECT Country, Fax = 
    CASE 
     WHEN Fax IS NULL THEN 'NOT FOUND'
     ELSE Fax
        END
FROM Supplier;
END;
-------------------------------------------

-- Declare the PriceUnit variable and set its value
DECLARE @Price1 NUMERIC(12, 2);

-- Initialize the ID variable for the loop
DECLARE @Id INT = 30;

-- Start a WHILE loop to iterate through IDs from 30 to 40
WHILE @id <= 40
BEGIN
 SELECT @Price1 = UnitPrice  FROM Product WHERE Id=@id;
    -- Check if the PriceUnit is greater than or equal to 50
    IF @Price1 >= 100
        -- If true, select products with UnitPrice >= 50 for the current ID
      PRINT 'THE PRODUCT IS EXPENSIVE';
ELSE 
 PRINT 'THE PRODUCT IS NOT EXPENSIVE';
    
    -- Increment the ID for the next iteration
    SET @id= @id + 1;
END
-------------------------------------------------
DECLARE @counter INT = 1;
DECLARE @maxCount INT = 10;
WHILE @counter <= @maxCount 
BEGIN
-- Statements to execute
PRINT 'Counter: '+ CAST(@counter AS VARCHAR); 
SET @counter = @counter + 1; 
IF @counter > 5
BREAK; 
-- Exit the loop 
END

------------------------------------------------------

--print number from 1 to 10 and skip printing numbers that are divisiable by 3

DECLARE @Counter1 INT = 1;

WHILE @Counter1  <= 10
BEGIN
    
    IF @Counter1 % 3 != 0
    BEGIN
        -- Print number
        PRINT 'Number that is  not divisiable  by 3: ' + CAST(@Counter1 AS NVARCHAR(10));
    END

    -- Increment counter
    SET @Counter1 = @Counter1 + 1;
END
-----------------------------------------------------
--DISPLAY WHICH CUSTOMER FROM LONDON PRINT THE CUSTOMER FROM LONDON OTHERWISER CUTOMER NOT FROM LONDON
BEGIN 
    DECLARE @CITY VARCHAR(25); 
    DECLARE @COUN INT = 1;

    WHILE @COUN <= 10
    BEGIN 
        SELECT @CITY = City
        FROM Customer
        WHERE Id = @COUN;

        IF @CITY = 'London' 
            PRINT 'THE CUSTOMER IS FROM London';
        ELSE 
            PRINT 'THE CUSTOMER IS NOT FROM London';

        SET @COUN = @COUN + 1;
    END
END
-----------------------------------------------
-- PRINT FROM 1 TO 5 USING WHILE LOOP
 DECLARE @counter2 INT = 1;
 DECLARE @maxCount2 INT = 10; 
 WHILE @counter2 <= @maxCount2
 BEGIN
 -- Statements to execute 
 PRINT 'Counter: '+ CAST(@counter2 AS VARCHAR); 
 SET @counter2 = @counter2 + 1;
 IF @counter2 > 5
 BREAK; 
 -- Exit the loop END
END
---------------------------------------------
--EXCEPTION HANDLING
 BEGIN TRY 
 SELECT 1/0; 
 END TRY 
 BEGIN CATCH 
 SELECT
 @@ERROR AS ERROR, 
 ERROR_NUMBER() AS ErrorNumber,
 ERROR_SEVERITY() AS ErrorServerity ,
 ERROR_STATE() AS ErrorState, 
 ERROR_PROCEDURE () AS ErrorProcedure,
 ERROR_LINE() AS ErrorLine, 
 ERROR_MESSAGE() AS ErrorMessage;
 END CATCH



 ------------------------------------------------
 
 BEGIN TRY 
DECLARE @AVRAGEPRICE1 NUMERIC(8,2);
select @AVRAGEPRICE1= AVG(UnitPrice) from Product;
PRINT ' the averge price' +@AVRAGEPRICE1;
 END TRY 
 BEGIN CATCH 
 SELECT
 @@ERROR AS ERROR, 
 ERROR_NUMBER() AS ErrorNumber,
 ERROR_SEVERITY() AS ErrorServerity ,
 ERROR_STATE() AS ErrorState, 
 ERROR_PROCEDURE () AS ErrorProcedure,
 ERROR_LINE() AS ErrorLine, 
 ERROR_MESSAGE() AS ErrorMessage;
 END CATCH

 ------------------------------------------------
 BEGIN
--Cursor and Fetch
--STEP1 : DECLARE THE VARIABLES
 DECLARE @CUSTOMERID INT;
DECLARE @FNAME NVARCHAR(40);
DECLARE @CITY1 NVARCHAR(40);

-- STEP2: Declare and open the cursor
DECLARE v_customer_cursor CURSOR FOR
SELECT Id, FirstName, City
FROM Customer;

-- STEP3: Open the cursor
OPEN v_customer_cursor;

-- STEP4: Fetch data from the cursor
FETCH NEXT FROM v_customer_cursor INTO @CUSTOMERID, @FNAME, @CITY1;

-- STEP5: Loop through the cursor
WHILE @@FETCH_STATUS = 0
BEGIN
    -- STEP6:Process the fetched data
    PRINT 'Customer ' + CAST(@CUSTOMERID AS NVARCHAR(10)) + '=>'+ @FNAME + ' from' + @CITY1;

    -- Fetch the next row
    FETCH NEXT FROM v_customer_cursor INTO @CUSTOMERID, @FNAME, @CITY1;
END

-- Close and deallocate the cursor
CLOSE v_customer_cursor;
DEALLOCATE v_customer_cursor;

END

--------------------------------------------------------------------

-- DECLARE A CURSOR TO FETCH ALL PRODUCTS THAT HAVE DISCOUNTS ALONG WITH THE PRICE AND NAME OF THE COMPANY
DECLARE @ProductID INT;
DECLARE @Discount DECIMAL(18, 2);
DECLARE @UnitPrice DECIMAL(18, 2);
DECLARE @CompanyName NVARCHAR(100);

-- Declare and open the cursor
DECLARE DiscountCursor CURSOR FOR
SELECT P.Id,  P.IsDiscontinued, P.UnitPrice, S.CompanyName
FROM Product P , Supplier S 
WHERE P.SupplierID = S.Id AND P.IsDiscontinued ='1';

-- Open the cursor
OPEN DiscountCursor;

-- Fetch data from the cursor
FETCH NEXT FROM DiscountCursor INTO @ProductID,  @Discount, @UnitPrice, @CompanyName;

-- Loop through the cursor
WHILE @@FETCH_STATUS = 0
BEGIN
    -- Print or process the fetched data
    PRINT 'Product ' + CAST(@ProductID AS NVARCHAR(10)) + ' => ' 
        + ' Discount: ' + CAST(@Discount AS NVARCHAR(10)) + ', ' + CAST(@UnitPrice AS NVARCHAR(10))
        + ', Company Name: ' + @CompanyName;

    -- Fetch the next row
    FETCH NEXT FROM DiscountCursor INTO @ProductID,  @Discount, @UnitPrice, @CompanyName;
END;

-- Close and deallocate the cursor
CLOSE DiscountCursor;
DEALLOCATE DiscountCursor;

SELECT * FROM Supplier;
select * from Product ;
------------------------------------------------------------------------------------
-- UPDATE THE FAX VALUE FOR SUPPLIERS WHO ARE FROM UK BY CHANING THE VALUE FROM NULL TO NOT NOT FOUND 
DECLARE @Country NVARCHAR(100);
DECLARE @Fax NVARCHAR(100);
DECLARE @NewFax NVARCHAR(100);

-- Declare and open the cursor
DECLARE SupplierCursor CURSOR FOR
SELECT Country, Fax
FROM Supplier
where Country='UK';

-- Open the cursor
OPEN SupplierCursor;

-- Fetch data from the cursor
FETCH NEXT FROM SupplierCursor INTO @Country, @Fax;

-- Loop through the cursor
WHILE @@FETCH_STATUS = 0
BEGIN
    -- Perform the CASE operation to get the new Fax value
    SET @NewFax = CASE
        WHEN @Fax IS NULL THEN 'NOT FOUND'
        ELSE @Fax
    END

    -- Update the Fax column with the new value
    UPDATE Supplier
    SET Fax = @NewFax
    WHERE CURRENT OF SupplierCursor;

    -- Fetch the next row
    FETCH NEXT FROM SupplierCursor INTO @Country, @Fax;
END

-- Close and deallocate the cursor
CLOSE SupplierCursor;
DEALLOCATE SupplierCursor;

select * from Supplier;

-----------------------------------------------------------------
-- FETACH ALL CUSTOMER NAMES AND ID WITH PHONE NUMBER THAT CONTAINS '555'
-- Declare variables
DECLARE @Cust_ID INT;
DECLARE @Cust_Name NVARCHAR(100);
DECLARE @PhoneNumber NVARCHAR(20);

-- Declare and open the cursor
DECLARE CustomerCursor CURSOR FOR
SELECT Id, FirstName, Phone
FROM Customer
WHERE Phone LIKE '%555%';

-- Open the cursor
OPEN CustomerCursor;

-- Fetch data from the cursor
FETCH NEXT FROM CustomerCursor INTO @Cust_ID, @Cust_Name, @PhoneNumber;

-- Loop through the cursor
WHILE @@FETCH_STATUS = 0
BEGIN
    -- Print or process the fetched data
    PRINT 'ID ' + CAST(@Cust_ID AS VARCHAR)
        + '=> |Customer Name: ' + @Cust_Name
        + ',| Phone Number: ' + CAST(@PhoneNumber AS VARCHAR);
	PRINT '------------------------------------------------------------------------------';
    -- Fetch the next row
    FETCH NEXT FROM CustomerCursor INTO @Cust_ID, @Cust_Name, @PhoneNumber;
END

-- Close and deallocate the cursor
CLOSE CustomerCursor;
DEALLOCATE CustomerCursor;
