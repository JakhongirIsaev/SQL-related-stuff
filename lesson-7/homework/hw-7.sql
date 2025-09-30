1. Write a query to find the minimum (MIN) price of a product in the Products table.

  SELECT MIN(Price) AS minprice FROM Products
  
2. Write a query to find the maximum (MAX) Salary from the Employees table.
  SELECT MAX(Salary) as maxsalary FROM Employees
  
3. Write a query to count the number of rows in the Customers table.
  SELECT COUNT(CustomerID) FROM Customers

 -- I chose CustomerID cause it is unique and will give us number of rows too.
  
4. Write a query to count the number of unique product categories from the Products table.
  
  select count(DISTINCT Category)  from Products

5. Write a query to find the total sales amount for the product with id 7 in the Sales table.

  select sum(SaleAmount)from Sales where ProductID = 7; 

6. Write a query to calculate the average age of employees in the Employees table.
  
select AVG(Age) from Employees;

  
7. Write a query to count the number of employees in each department.

SELECT DepartmentName, COUNT(*) AS employee_count
FROM Employees
GROUP BY DepartmentName;
  
8. Write a query to show the minimum and maximum Price of products grouped by Category. Use products table.
  
SELECT Category,
max(Price) as maxprice, 
min(Price) as minprice 
from Products 
GROUP BY Category

  
9. Write a query to calculate the total sales per Customer in the Sales table.

SELECT CustomerID, SUM(SaleAmount) AS total_sales
FROM Sales
GROUP BY CustomerID
ORDER BY CustomerID;


10. Write a query to filter departments having more than 5 employees from the Employees table.(DeptID is enough, if you dont have DeptName). 

SELECT DepartmentName, COUNT(*) AS employee_count
FROM Employees
GROUP BY DepartmentName
HAVING COUNT(*) > 5;  


11. Write a query to calculate the total sales and average sales for each product category from the Sales table.

SELECT p.Category, SUM(s.SaleAmount) AS total_sales, AVG(s.SaleAmount) AS avg_sales
FROM Sales s
JOIN Products p ON s.ProductID = p.ProductID
GROUP BY p.Category;

12. Write a query to count the number of employees from the Department HR.


SELECT COUNT(*) AS hr_employee_count
FROM Employees
WHERE DepartmentName = 'HR';

13. Write a query that finds the highest and lowest Salary by department in the Employees table.(DeptID is enough, if you don't have DeptName).
SELECT DepartmentName, MAX(Salary) AS max_salary, MIN(Salary) AS min_salary
FROM Employees
GROUP BY DepartmentName;

14. Write a query to calculate the average salary per Department.(DeptID is enough, if you don't have DeptName).

  SELECT DepartmentName, AVG(Salary) AS avg_salary
FROM Employees
GROUP BY DepartmentName;
15. Write a query to show the AVG salary and COUNT(*) of employees working in each department.(DeptID is enough, if you don't have DeptName).
  SELECT DepartmentName, AVG(Salary) AS avg_salary, COUNT(*) AS employee_count
FROM Employees
GROUP BY DepartmentName;
  
16. Write a query to filter product categories with an average price greater than 400.

  SELECT Category
FROM Products
GROUP BY Category
HAVING AVG(Price) > 400;
17. Write a query that calculates the total sales for each year in the Sales table.


  SELECT strftime('%Y', SaleDate) AS year, SUM(SaleAmount) AS total_sales
FROM Sales
GROUP BY year;
18. Write a query to show the list of customers who placed at least 3 orders.

SELECT CustomerID, COUNT(*) AS order_count
FROM Orders
GROUP BY CustomerID
HAVING COUNT(*) >= 3
ORDER BY CustomerID;
  
19. Write a query to filter out Departments with average salary expenses greater than 60000.(DeptID is enough, if you don't have DeptName).

SELECT DepartmentName
FROM Employees
GROUP BY DepartmentName
HAVING AVG(Salary) > 60000;

20. Write a query that shows the average price for each product category, and then filter categories with an average price greater than 150.


SELECT Category, AVG(Price) AS avg_price
FROM Products
GROUP BY Category
HAVING AVG(Price) > 150;
21. Write a query to calculate the total sales for each Customer, then filter the results to include only Customers with total sales over 1500.

  SELECT CustomerID, SUM(SaleAmount) AS total_sales
FROM Sales
GROUP BY CustomerID
HAVING SUM(SaleAmount) > 1500
ORDER BY CustomerID;
22. Write a query to find the total and average salary of employees in each department, and filter the output to include only departments with an average salary greater than 65000.

  SELECT DepartmentName, SUM(Salary) AS total_salary, AVG(Salary) AS avg_salary
FROM Employees
GROUP BY DepartmentName
HAVING AVG(Salary) > 65000;
23. Write a query to find total amount for the orders which weights more than $50 for each customer along with their least purchases.(least amount might be lower than 50, use tsql2012.sales.orders table,freight col, ask ur assistant to give the TSQL2012 database).
  IDK
24. Write a query that calculates the total sales and counts unique products sold in each month of each year, and then filter the months with at least 2 products sold.(Orders)
  IDK
25. Write a query to find the MIN and MAX order quantity per Year. From orders table. Necessary tables:

SELECT 
    strftime('%Y', OrderDate) AS year, 
    MIN(Quantity) AS min_quantity, 
    MAX(Quantity) AS max_quantity
FROM Orders
GROUP BY year
ORDER BY year;
