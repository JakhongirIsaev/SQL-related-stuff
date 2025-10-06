### Easy-Level Tasks (10)
1. Using the Employees and Departments tables, write a query to return the names and salaries of employees whose salary is greater than 50000, along with their department names.  
   🔁 Expected Columns: EmployeeName, Salary, DepartmentName
  
SELECT e.Name AS EmployeeName, e.Salary, d.DepartmentName
FROM Employees e
LEFT JOIN Departments d ON e.DepartmentID = d.DepartmentID
WHERE e.Salary > 50000;

2. Using the Customers and Orders tables, write a query to display customer names and order dates for orders placed in the year 2023.  
   🔁 Expected Columns: FirstName, LastName, OrderDate
SELECT c.CustomerName, COUNT(o.OrderID) AS NumberOfOrders
FROM Customers c
LEFT JOIN Orders o ON c.CustomerID = o.CustomerID
GROUP BY c.CustomerName
ORDER BY NumberOfOrders DESC;

3. Using the Employees and Departments tables, write a query to show all employees along with their department names. Include employees who do not belong to any department.  
   🔁 Expected Columns: EmployeeName, DepartmentName
SELECT p.ProductName, s.SupplierName
FROM Products p
JOIN Suppliers s ON p.SupplierID = s.SupplierID;
4. Using the Products and Suppliers tables, write a query to list all suppliers and the products they supply. Show suppliers even if they don’t supply any product.  
   🔁 Expected Columns: SupplierName, ProductName
SELECT o.OrderID, SUM(p.Amount) AS TotalPayment
FROM Orders o
JOIN Payments p ON o.OrderID = p.OrderID
GROUP BY o.OrderID;
5. Using the Orders and Payments tables, write a query to return all orders and their corresponding payments. Include orders without payments and payments not linked to any order.  
   🔁 Expected Columns: OrderID, OrderDate, PaymentDate, Amount
SELECT Name, Salary
FROM Employees
WHERE Salary BETWEEN 40000 AND 80000;
6. Using the Employees table, write a query to show each employee's name along with the name of their manager.  
   🔁 Expected Columns: EmployeeName, ManagerName
SELECT d.DepartmentName, COUNT(e.EmployeeID) AS EmployeeCount
FROM Departments d
LEFT JOIN Employees e ON d.DepartmentID = e.DepartmentID
GROUP BY d.DepartmentName;

7. Using the Students, Courses, and Enrollments tables, write a query to list the names of students who are enrolled in the course named 'Math 101'.  
   🔁 Expected Columns: StudentName, CourseName
SELECT *
FROM Orders
WHERE OrderDate >= DATEADD(MONTH, -6, GETDATE());
8. Using the Customers and Orders tables, write a query to find customers who have placed an order with more than 3 items. Return their name and the quantity they ordered.  
   🔁 Expected Columns: FirstName, LastName, Quantity
SELECT ProductName, Price
FROM Products
WHERE Price = (SELECT MAX(Price) FROM Products);
9. Using the Employees and Departments tables, write a query to list employees working in the 'Human Resources' department.  
   🔁 Expected Columns: EmployeeName, DepartmentName
SELECT e.Name AS EmployeeName, d.DepartmentName
FROM Employees e
INNER JOIN Departments d ON e.DepartmentID = d.DepartmentID
WHERE d.DepartmentName = 'Human Resources';
  
### 🟠 Medium-Level Tasks (9)
10. Using the Employees and Departments tables, write a query to return department names that have more than 5 employees.  
    🔁 Expected Columns: DepartmentName, EmployeeCount
SELECT d.DepartmentName, COUNT(e.EmployeeID) AS EmployeeCount
FROM Departments d
INNER JOIN Employees e ON d.DepartmentID = e.DepartmentID
GROUP BY d.DepartmentID, d.DepartmentName
HAVING COUNT(e.EmployeeID) > 5;
  
11. Using the Products and Sales tables, write a query to find products that have never been sold.  
    🔁 Expected Columns: ProductID, ProductName
SELECT p.ProductID, p.ProductName
FROM Products p
LEFT JOIN Sales s ON p.ProductID = s.ProductID
WHERE s.ProductID IS NULL;
  
12. Using the Customers and Orders tables, write a query to return customer names who have placed at least one order.  
    🔁 Expected Columns: FirstName, LastName, TotalOrders
SELECT c.FirstName, c.LastName, COUNT(o.OrderID) AS TotalOrders
FROM Customers c
INNER JOIN Orders o ON c.CustomerID = o.CustomerID
GROUP BY c.CustomerID, c.FirstName, c.LastName;
  
13. Using the Employees and Departments tables, write a query to show only those records where both employee and department exist (no NULLs).  
    🔁 Expected Columns: EmployeeName, DepartmentName
SELECT e.Name AS EmployeeName, d.DepartmentName
FROM Employees e
INNER JOIN Departments d ON e.DepartmentID = d.DepartmentID;
  
14. Using the Employees table, write a query to find pairs of employees who report to the same manager.  
    🔁 Expected Columns: Employee1, Employee2, ManagerID
SELECT e1.Name AS Employee1, e2.Name AS Employee2, e1.ManagerID
FROM Employees e1
INNER JOIN Employees e2 ON e1.ManagerID = e2.ManagerID AND e1.EmployeeID < e2.EmployeeID
WHERE e1.ManagerID IS NOT NULL;
  
15. Using the Orders and Customers tables, write a query to list all orders placed in 2022 along with the customer name.  
    🔁 Expected Columns: OrderID, OrderDate, FirstName, LastName
SELECT o.OrderID, o.OrderDate, c.FirstName, c.LastName
FROM Orders o
INNER JOIN Customers c ON o.CustomerID = c.CustomerID
WHERE YEAR(o.OrderDate) = 2022;
16. Using the Employees and Departments tables, write a query to return employees from the 'Sales' department whose salary is above 60000.  
    🔁 Expected Columns: EmployeeName, Salary, DepartmentName
SELECT e.Name AS EmployeeName, e.Salary, d.DepartmentName
FROM Employees e
INNER JOIN Departments d ON e.DepartmentID = d.DepartmentID
WHERE d.DepartmentName = 'Sales' AND e.Salary > 60000;
17. Using the Orders and Payments tables, write a query to return only those orders that have a corresponding payment.  
    🔁 Expected Columns: OrderID, OrderDate, PaymentDate, Amount
SELECT o.OrderID, o.OrderDate, p.PaymentDate, p.Amount
FROM Orders o
INNER JOIN Payments p ON o.OrderID = p.OrderID;
18. Using the Products and Orders tables, write a query to find products that were never ordered.  
    🔁 Expected Columns: ProductID, ProductName
  
SELECT p.ProductID, p.ProductName
FROM Products p
LEFT JOIN Orders o ON p.ProductID = o.ProductID
WHERE o.ProductID IS NULL;
  
### 🔴 Hard-Level Tasks (9)


#### 19. Using the Employees table, write a query to find employees whose salary is greater than the average salary in their own departments.

SELECT e.Name AS EmployeeName, e.Salary
FROM Employees e
WHERE e.DepartmentID IS NOT NULL
AND e.Salary > (
    SELECT AVG(e2.Salary)
    FROM Employees e2
    WHERE e2.DepartmentID = e.DepartmentID
);

20. Using the Orders and Payments tables, write a query to list all orders placed before 2020 that have no corresponding payment.

SELECT o.OrderID, o.OrderDate
FROM Orders o
LEFT JOIN Payments p ON o.OrderID = p.OrderID
WHERE YEAR(o.OrderDate) < 2020 AND p.OrderID IS NULL;


 21. Using the Products and Categories tables, write a query to return products that do not have a matching category.

SELECT p.ProductID, p.ProductName
FROM Products p
LEFT JOIN Categories c ON p.Category = c.CategoryID
WHERE c.CategoryID IS NULL;


22. Using the Employees table, write a query to find employees who report to the same manager and earn more than 60000.

SELECT e1.Name AS Employee1, e2.Name AS Employee2, e1.ManagerID, e1.Salary
FROM Employees e1
INNER JOIN Employees e2 ON e1.ManagerID = e2.ManagerID AND e1.EmployeeID < e2.EmployeeID
WHERE e1.Salary > 60000 AND e2.Salary > 60000;


23. Using the Employees and Departments tables, write a query to return employees who work in departments which name starts with the letter 'M'.

SELECT e.Name AS EmployeeName, d.DepartmentName
FROM Employees e
INNER JOIN Departments d ON e.DepartmentID = d.DepartmentID
WHERE d.DepartmentName LIKE 'M%';


24. Using the Products and Sales tables, write a query to list sales where the amount is greater than 500, including product names.

SELECT s.SaleID, p.ProductName, s.SaleAmount
FROM Sales s
INNER JOIN Products p ON s.ProductID = p.ProductID
WHERE s.SaleAmount > 500;

25. Using the Students, Courses, and Enrollments tables, write a query to find students who have not enrolled in the course 'Math 101'.


SELECT s.StudentID, s.Name AS StudentName
FROM Students s
LEFT JOIN Enrollments en ON s.StudentID = en.StudentID
LEFT JOIN Courses c ON en.CourseID = c.CourseID AND c.CourseName = 'Math 101'
WHERE c.CourseID IS NULL;


 26. Using the Orders and Payments tables, write a query to return orders that are missing payment details.

SELECT o.OrderID, o.OrderDate, p.PaymentID
FROM Orders o
LEFT JOIN Payments p ON o.OrderID = p.OrderID
WHERE p.PaymentID IS NULL;

27. Using the Products and Categories tables, write a query to list products that belong to either the 'Electronics' or 'Furniture' category.

SELECT p.ProductID, p.ProductName, c.CategoryName
FROM Products p
INNER JOIN Categories c ON p.Category = c.CategoryID
WHERE c.CategoryName IN ('Electronics', 'Furniture');
