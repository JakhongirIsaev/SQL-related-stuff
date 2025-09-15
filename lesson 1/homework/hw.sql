EASY

1. Define the following terms: data, database, relational database, and table.
  
Data is a value or set of values representing a specific concept or concepts
Database is collection of data stored and managed in a structured way.
Relational database is a type of database that organizes data into structured tables consisting of rows  and columns.
Table is like a grid made of rows and columns, similar to an Excel sheet.

2. List five key features of SQL Server.

Relational Database Management 
Transact-SQL (T-SQL)
High Security 
Scalability and Performance 
Business Intelligence and Integration Tools
  
3. What are the different authentication modes available when connecting to SQL Server? (Give at least 2)
     
  Windows Authentication and SQL Server Authentication.

  
MEDIUM

4. Create a new database in SSMS named SchoolDB.
  
  Create database SchoolDB
  
5. Write and execute a query to create a table called Students with columns: StudentID (INT, PRIMARY KEY), Name (VARCHAR(50)), Age (INT).
  
   create tavke Students (StudentID (INT, PRIMARY KEY), Name (VARCHAR(50)), Age (INT))
  
6. Describe the differences between SQL Server, SSMS, and SQL.

  
SQL = language

SQL Server = database system

SSMS = tool to use SQL with SQL Server



HARD

  
7. Research and explain the different SQL commands: DQL, DML, DDL, DCL, TCL with examples.

  DQL - Makes or changes tables.	CREATE, ALTER, DROP
  DML - Adds, changes , delets the data. INSERT, UPDATE, DELETE
  DQL - Asks questions to get data.	SELECT
  DCL - Controls who can access data	GRANT, REVOKE
  TCL	- Manages changes as one group	COMMIT, ROLLBACK
  
8. Write a query to insert three records into the Students table.

  INSERT INTO Students values

  (1, "John", "Blaze", 15, "BIO1")
  (2, "Kim", "Harvey", 16, "BIO2")
  (3, "Goldberg", "Andrew", 15, "ENG1")
  
9. Restore AdventureWorksDW2022.bak file to your server. (write its steps to submit) You can find the database from this link :https://github.com/Microsoft/sql-server-samples/releases/download/adventureworks/AdventureWorksDW2022.bak


For this one I could not find it on my laptop even after downloading and putting the file to right folders.
