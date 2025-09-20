Basic-Level Tasks (10)


1. Create a table Employees with columns: EmpID INT, Name (VARCHAR(50)), and Salary (DECIMAL(10,2)).

CREATE TABLE Employees ( EmpID INT, Name VARCHAR(50), Salary DECIMAL(10,2) );
  
2. Insert three records into the Employees table using different INSERT INTO approaches (single-row insert and multiple-row insert).
  Single-row 
  INSERT INTO Employees (EmpID, Name, Salary) VALUES (1, 'Alice Johnson', 55000.00);

  Multiple-row
  INSERT INTO Employees (EmpID, Name, Salary)
  VALUES 
      (2, 'Bob Smith', 62000.00),
      (3, 'Charlie Davis', 70000.00);
  
3. Update the Salary of an employee to 7000 where EmpID = 1.
  
   UPDATE Employees SET Salary = 7000.00 WHERE EmpID = 1;
  
4. Delete a record from the Employees table where EmpID = 2.
      DELETE FROM Employees WHERE EmpID = 2;

  
5. Give a brief definition for difference between DELETE, TRUNCATE, and DROP.
  The DELETE command deletes one or more existing records from the table in the database. The DROP Command drops the complete table from the database. 
  The TRUNCATE Command deletes all the rows from the existing table, leaving the row with the column names.
  
6. Modify the Name column in the Employees table to VARCHAR(100).
     ALTER TABLE Employees MODIFY Name VARCHAR(100);

7. Add a new column Department (VARCHAR(50)) to the Employees table.
  
ALTER TABLE Employees ADD Department VARCHAR(50);


  
8.Change the data type of the Salary column to FLOAT.
   ALTER TABLE Employees MODIFY COLUMN Salary FLOAT;


  
9. Create another table Departments with columns DepartmentID (INT, PRIMARY KEY) and DepartmentName (VARCHAR(50)).

  CREATE TABLE Departments ( DepartmentID INT PRIMARY KEY, DepartmentName VARCHAR(50) );


10. Remove all records from the Employees table without deleting its structure.

  TRUNCATE TABLE Employees;


Intermediate-Level Tasks

  
11. Insert five records into the Departments table using INSERT INTO SELECT method(you can write anything you want as data).

  INSERT INTO Departments (DepartmentID, DepartmentName)
  SELECT 1, 'Human Resources' 
  UNION ALL
  SELECT 2, 'Engineering'
  UNION ALL
  SELECT 3, 'Marketing'
  UNION ALL
  SELECT 4, 'Finance'
  UNION ALL
  SELECT 5, 'Sales';
  
12. Update the Department of all employees where Salary > 5000 to 'Management'.

UPDATE Employees
SET Department = 'Management'
WHERE Salary > 5000;
  
13. Write a query that removes all employees but keeps the table structure intact.
  TRUNCATE TABLE Employees;
  
14. Drop the Department column from the Employees table.

ALTER TABLE Employees
DROP COLUMN Department;

15. Rename the Employees table to StaffMembers using SQL commands.

ALTER TABLE Employees
RENAME TO StaffMembers; 

16. Write a query to completely remove the Departments table from the database.

  DROP TABLE Departments;

Advanced-Level Tasks
  
17. Create a table named Products with at least 5 columns, including: ProductID (Primary Key), ProductName (VARCHAR), Category (VARCHAR), Price (DECIMAL)

CREATE TABLE Products (
    ProductID INT PRIMARY KEY,
    ProductName VARCHAR(100),
    Category VARCHAR(50),
    Price DECIMAL(10, 2),
    StockQuantity INT
);
  
18. Add a CHECK constraint to ensure Price is always greater than 0.
ALTER TABLE Products
MODIFY COLUMN Price DECIMAL(10, 2) NOT NULL;

19. Modify the table to add a StockQuantity column with a DEFAULT value of 50.

ALTER TABLE Products
ADD StockQuantity2 INT DEFAULT 50;
  

20. Rename Category to ProductCategory
  
ALTER TABLE Products
RENAME COLUMN Category TO ProductCategory;
  
21. Insert 5 records into the Products table using standard INSERT INTO queries.

INSERT INTO Products (ProductID, ProductName, ProductCategory, Price, StockQuantity)
VALUES
    (1, 'Laptop', 'Electronics', 999.99, 20),
    (2, 'Desk Chair', 'Furniture', 149.50, 50),
    (3, 'Smartphone', 'Electronics', 699.00, 30),
    (4, 'Coffee Maker', 'Appliances', 89.99, 15),
    (5, 'Headphones', 'Electronics', 199.95, 25); 
  
22. Use SELECT INTO to create a backup table called Products_Backup containing all Products data.

SELECT * INTO Products_Backup
FROM Products;

23. Rename the Products table to Inventory.

ALTER TABLE Products
RENAME TO Inventory;

24. Alter the Inventory table to change the data type of Price from DECIMAL(10,2) to FLOAT.

ALTER TABLE Inventory
MODIFY COLUMN Price FLOAT;

25. Add an IDENTITY column named ProductCode that starts from 1000 and increments by 5 to Inventory table.

ALTER TABLE Inventory
ADD ProductCode INT IDENTITY(1000, 5); 

