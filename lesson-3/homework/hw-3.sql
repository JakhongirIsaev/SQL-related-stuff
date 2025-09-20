Easy-Level Tasks

  
1. Define and explain the purpose of BULK INSERT in SQL Server.
  
  BULK INSERT is a T-SQL command in SQL Server used to efficiently import large amounts of data from a text file into a SQL Server table. 
  It is designed for high-performance data loading, allowing direct insertion of data from a file into a table without requiring individual INSERT statements for each row.
  
2. List four file formats that can be imported into SQL Server.

  CSV , TXT, XML , JSON
  
3. Create a table Products with columns: ProductID (INT, PRIMARY KEY), ProductName (VARCHAR(50)), Price (DECIMAL(10,2)).

CREATE TABLE Products (
    ProductID INT PRIMARY KEY,
    ProductName VARCHAR(50),
    Price DECIMAL(10,2)
);
  
4. Insert three records into the Products table using INSERT INTO.
  
INSERT INTO Products (ProductID, ProductName, Price)
VALUES
    (1, 'Smartphone', 599.99),
    (2, 'Headphones', 89.95),
    (3, 'Tablet', 299.50);
  
5. Explain the difference between NULL and NOT NULL.
  
NULL means a column can have no value (unknown or missing). NOT NULL requires a column to always have a valid value.
NULL is used for optional fields where data might not exist. NOT NULL is for mandatory fields where a value is required.
NULL allows empty entries, which can affect queries . NOT NULL ensures data is present, simplifying queries.
Example: In the Products table, a NULL ProductName allows . A NOT NULL Price prevents.


  
6. Add a UNIQUE constraint to the ProductName column in the Products table.

ALTER TABLE Products
ADD CONSTRAINT uk_productname UNIQUE (ProductName);
  
7. Write a comment in a SQL query explaining its purpose.

-- Retrieve all records from the Products table to display product details
SELECT * FROM Products;
  
8. Add CategoryID column to the Products table.

ALTER TABLE Products
ADD CategoryID INT;
  
9. Create a table Categories with a CategoryID as PRIMARY KEY and a CategoryName as UNIQUE.

CREATE TABLE Categories (
    CategoryID INT PRIMARY KEY,
    CategoryName VARCHAR(50) UNIQUE
);
  
10. Explain the purpose of the IDENTITY column in SQL Server.

An IDENTITY column in SQL Server is a special column that automatically generates sequential numeric values typically integers for each new row inserted into a table. 
It is commonly used to create unique identifiers for records without requiring manual input.


Medium-Level Tasks

  
11.Use BULK INSERT to import data from a text file into the Products table.

BULK INSERT Products
FROM 'C:\Data\products.csv' -- Example path
WITH
(
    FIELDTERMINATOR = ',',
    ROWTERMINATOR = '\n',
    FIRSTROW = 2, -- Skip header row
    FORMAT = 'CSV',
    CHECK_CONSTRAINTS
);
  
  
12. Create a FOREIGN KEY in the Products table that references the Categories table.

ALTER TABLE Products
ADD CONSTRAINT fk_categoryid FOREIGN KEY (CategoryID) REFERENCES Categories(CategoryID);
  
13. Explain the differences between PRIMARY KEY and UNIQUE KEY.
  
PRIMARY KEY uniquely identifies each row in a table and cannot be NULL. UNIQUE KEY ensures all values in a column (or set of columns) are unique but allows NULL values .
PRIMARY KEY automatically creates a unique index and enforces NOT NULL. UNIQUE KEY creates a unique index but does not enforce NOT NULL unless specified.
A table can have only one PRIMARY KEY (single or composite). A table can have multiple UNIQUE KEY constraints.
PRIMARY KEY is often used for the main identifier (e.g., ProductID in Products table). UNIQUE KEY is used for other columns requiring uniqueness .
Example: In Products table, PRIMARY KEY on ProductID ensures unique, non-NULL IDs. UNIQUE KEY on ProductName ensures no duplicate names but may allow NULL .


  
14. Add a CHECK constraint to the Products table ensuring Price > 0.

ALTER TABLE Products
ADD CONSTRAINT chk_price_positive CHECK (Price > 0);

  
15. Modify the Products table to add a column Stock (INT, NOT NULL).
  
ALTER TABLE Products
ADD Stock INT NOT NULL;

  
16. Use the ISNULL function to replace NULL values in Price column with a 0.
Describe the purpose and usage of FOREIGN KEY constraints in SQL Server. 

-- Temporarily drop CHECK constraint to allow Price = 0
ALTER TABLE Products
DROP CONSTRAINT chk_price_positive;

-- Update NULL values in Price to 0
UPDATE Products
SET Price = ISNULL(Price, 0);

-- Re-add CHECK constraint if needed, modified to allow Price >= 0
ALTER TABLE Products
ADD CONSTRAINT chk_price_positive CHECK (Price >= 0);

17. Describe the purpose and usage of FOREIGN KEY constraints in SQL Server.

A FOREIGN KEY constraint in SQL Server establishes a relationship between two tables by ensuring that values in a column (or set of columns) in one table (the child table) match values in a PRIMARY KEY or UNIQUE column in another table (the parent table).
  Its primary purpose is to maintain referential integrity, ensuring data consistency across related tables.
  
Hard-Level Tasks 
  
18. Write a script to create a Customers table with a CHECK constraint ensuring Age >= 18.

CREATE TABLE Customers (
    CustomerID INT PRIMARY KEY,
    FirstName VARCHAR(50),
    LastName VARCHAR(50),
    Age INT,
    CONSTRAINT chk_age CHECK (Age >= 18)
);
  
19. Create a table with an IDENTITY column starting at 100 and incrementing by 10.

CREATE TABLE Orders (
    OrderID INT IDENTITY(100, 10) PRIMARY KEY,
    OrderDate DATE,
    CustomerID INT
);
  
20. Write a query to create a composite PRIMARY KEY in a new table OrderDetails.

CREATE TABLE OrderDetails (
    OrderID INT,
    ProductID INT,
    Quantity INT,
    PRIMARY KEY (OrderID, ProductID)
);
  
21. Explain the use of COALESCE and ISNULL functions for handling NULL values.

Both COALESCE and ISNULL are SQL Server functions used to handle NULL values by replacing them with a specified non-NULL value. 
They are useful for ensuring queries return meaningful data instead of NULL, especially in calculations, display, or data processing. 
Below is an explanation of their purpose and usage, with examples in the context of the Products table
  
22. Create a table Employees with both PRIMARY KEY on EmpID and UNIQUE KEY on Email.

CREATE TABLE Employees (
    EmpID INT PRIMARY KEY,
    Email VARCHAR(100) UNIQUE,
    FirstName VARCHAR(50),
    LastName VARCHAR(50)
);
  
23. Write a query to create a FOREIGN KEY with ON DELETE CASCADE and ON UPDATE CASCADE options.

-- Drop existing FOREIGN KEY constraint if it exists
ALTER TABLE Products
DROP CONSTRAINT fk_categoryid;

-- Add FOREIGN KEY with ON DELETE CASCADE and ON UPDATE CASCADE
ALTER TABLE Products
ADD CONSTRAINT fk_categoryid FOREIGN KEY (CategoryID) REFERENCES Categories(CategoryID)
    ON DELETE CASCADE
    ON UPDATE CASCADE;
  
