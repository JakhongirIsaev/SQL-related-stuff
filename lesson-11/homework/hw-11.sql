1. Return: OrderID, CustomerName, OrderDate
Task: Show all orders placed after 2022 along with the names of the customers who placed them.
Tables Used: Orders, Customers
  
SELECT o.OrderID, FirstName + ' '+ LastName AS CustomerName, OrderDate
FROM Orders o
JOIN Customers c
ON o.CustomerID = c.CustomerID 
WHERE OrderDate > '2022-12-31';


  
2. Return: EmployeeName, DepartmentName
Task: Display the names of employees who work in either the Sales or Marketing department.
Tables Used: Employees, Departments

SELECT e.Name , d.DepartmentName 
FROM Employees e
Join Departments d
ON e.DepartmentID = d.DepartmentID
WHERE d.DepartmentName = 'Sales' OR d.DepartmentName = 'Marketing';


  
3. Return: DepartmentName, MaxSalary
Task: Show the highest salary for each department.
Tables Used: Departments, Employees

SELECT MAX(e.Salary) AS MaxSalary, d.DepartmentName
FROM Employees e
JOIN Departments d
ON e.DepartmentID = d.DepartmentID
GROUP BY d.DepartmentName;

4. Return: CustomerName, OrderID, OrderDate
Task: List all customers from the USA who placed orders in the year 2023.
Tables Used: Customers, Orders

 
SELECT o.OrderID, FirstName + ' '+ LastName AS CustomerName, OrderDate
FROM Orders o
JOIN Customers c
ON o.CustomerID = c.CustomerID 
WHERE Country = 'USA' AND OrderDate BETWEEN '2023-01-01' AND '2023-12-31' 

5. Return: CustomerName, TotalOrders
Task: Show how many orders each customer has placed.
Tables Used: Orders , Customers

SELECT 
    c.FirstName + ' ' + c.LastName AS CustomerName,
    COUNT(o.OrderID) AS TotalOrders  
FROM Orders o
JOIN Customers c ON o.CustomerID = c.CustomerID
GROUP BY c.CustomerID, c.FirstName, c.LastName 
ORDER BY TotalOrders DESC;  


  
6. Return: ProductName, SupplierName
Task: Display the names of products that are supplied by either Gadget Supplies or Clothing Mart.
Tables Used: Products, Suppliers

SELECT p.ProductName, s.SupplierName
FROM Suppliers s
JOIN Products p
ON s.SupplierID = p.SupplierID
WHERE s.SupplierName IN ('Gadget Supplies', 'Clothing Mart')
ORDER BY p.ProductName;

7. Return: CustomerName, MostRecentOrderDate
Task: For each customer, show their most recent order. Include customers who have not placed any orders.
Tables Used: Customers, Orders


SELECT 
    c.FirstName + ' ' + c.LastName AS CustomerName,
    MAX(OrderDate) AS MostRecentOrderDate 
FROM Orders o
LEFT JOIN Customers c ON o.CustomerID = c.CustomerID
GROUP BY c.CustomerID, c.FirstName , c.LastName
ORDER BY CustomerName;


🟠 Medium-Level Tasks (6)
8. Return: CustomerName, OrderTotal
Task: Show the customers who have placed an order where the total amount is greater than 500.
Tables Used: Orders, Customers


SELECT 
    c.FirstName + ' ' + c.LastName AS CustomerName,
    o.TotalAmount AS OrderTotal
FROM Orders o
JOIN Customers c 
ON o.CustomerID = c.CustomerID
WHERE o.TotalAmount > 500
ORDER BY OrderTotal DESC;

9. Return: ProductName, SaleDate, SaleAmount
Task: List product sales where the sale was made in 2022 or the sale amount exceeded 400.
Tables Used: Products, Sales


SELECT p.ProductName, s.SaleDate, s.SaleAmount
FROM Sales s
JOIN Products p
ON s.ProductID = p.ProductID
WHERE (s.SaleDate BETWEEN '2022-01-01' AND '2022-12-31' OR s.SaleAmount > 400)
ORDER BY p.ProductName;

10. Return: ProductName, TotalSalesAmount
Task: Display each product along with the total amount it has been sold for.
Tables Used: Sales, Products

SELECT 
    p.ProductName,
    COALESCE(SUM(s.SaleAmount), 0) AS TotalSalesAmount
FROM Products p
LEFT JOIN Sales s ON p.ProductID = s.ProductID
GROUP BY p.ProductID, p.ProductName
ORDER BY TotalSalesAmount DESC;
  

11. Return: EmployeeName, DepartmentName, Salary
Task: Show the employees who work in the HR department and earn a salary greater than 60000.
Tables Used: Employees, Departments

SELECT e.Salary, d.DepartmentName, e.Name AS EmployeeName
FROM Employees e
JOIN Departments d
ON e.DepartmentID = d.DepartmentID
WHERE d.DepartmentName = 'Human Resources' AND e.Salary > 60000;  

12. Return: ProductName, SaleDate, StockQuantity
Task: List the products that were sold in 2023 and had more than 100 units in stock at the time.
Tables Used: Products, Sales

SELECT 
    p.ProductName,
    s.SaleDate,
    p.StockQuantity
FROM Sales s
INNER JOIN Products p ON s.ProductID = p.ProductID
WHERE YEAR(s.SaleDate) = 2023
  AND p.StockQuantity > 100
ORDER BY p.ProductName;
  

13. Return: EmployeeName, DepartmentName, HireDate
Task: Show employees who either work in the Sales department or were hired after 2020.
Tables Used: Employees, Departments

SELECT 
    e.Name AS EmployeeName,
    d.DepartmentName,
    e.HireDate
FROM Employees e
INNER JOIN Departments d ON e.DepartmentID = d.DepartmentID
WHERE d.DepartmentName = 'Sales' 
   OR e.HireDate > '2020-12-31'
ORDER BY EmployeeName;


  

🔴 Hard-Level Tasks (7)
14. Return: CustomerName, OrderID, Address, OrderDate
Task: List all orders made by customers in the USA whose address starts with 4 digits.
Tables Used: Customers, Orders

SELECT 
    c.FirstName + ' ' + c.LastName AS CustomerName,
    o.OrderID,
    c.Address,
    o.OrderDate
FROM Orders o
JOIN Customers c ON o.CustomerID = c.CustomerID
WHERE c.Country = 'USA'
  AND PATINDEX('[0-9][0-9][0-9][0-9][^0-9]%', c.Address) = 1 
ORDER BY CustomerName;

  

15. Return: ProductName, Category, SaleAmount
Task: Display product sales for items in the Electronics category or where the sale amount exceeded 350.
Tables Used: Products, Sales

SELECT 
    p.ProductName,
    p.Category,
    s.SaleAmount
FROM Sales s
INNER JOIN Products p ON s.ProductID = p.ProductID
WHERE p.Category = 'Electronics' 
   OR s.SaleAmount > 350
ORDER BY p.ProductName;

16. Return: CategoryName, ProductCount
Task: Show the number of products available in each category.
Tables Used: Products, Categories

SELECT 
    Category AS CategoryName,
    COUNT(*) AS ProductCount
FROM Products
GROUP BY Category
ORDER BY CategoryName;
  

17. Return: CustomerName, City, OrderID, Amount
Task: List orders where the customer is from Los Angeles and the order amount is greater than 300.
Tables Used: Customers, Orders

 SELECT 
    c.FirstName + ' ' + c.LastName AS CustomerName,
    c.City,
    o.TotalAmount AS Amount,
    o.OrderID
FROM Orders o
JOIN Customers c ON o.CustomerID = c.CustomerID
WHERE c.City = 'Los Angeles' 
  AND o.TotalAmount > 300
ORDER BY CustomerName DESC; 

18. Return: EmployeeName, DepartmentName
Task: Display employees who are in the HR or Finance department, or whose name contains at least 4 vowels.
Tables Used: Employees, Departments

SELECT 
    e.Name AS EmployeeName,
    d.DepartmentName
FROM Employees e
JOIN Departments d ON e.DepartmentID = d.DepartmentID
WHERE d.DepartmentName IN ('Human Resources', 'Finance')
   OR (LEN(e.Name) - LEN(REPLACE(LOWER(e.Name), 'aeiou', ''))) >= 4
ORDER BY EmployeeName;
  

19. Return: EmployeeName, DepartmentName, Salary
Task: Show employees who are in the Sales or Marketing department and have a salary above 60000.
Tables Used: Employees, Departments

SELECT 
    e.Name AS EmployeeName,
    d.DepartmentName,
    e.Salary AS Salary
FROM Employees e
JOIN Departments d ON e.DepartmentID = d.DepartmentID
WHERE d.DepartmentName IN ('Sales', 'Marketing') 
  AND e.Salary > 60000
ORDER BY EmployeeName;



