1. Using Products, Suppliers table List all combinations of product names and supplier names.

  SELECT p.ProductName, s.SupplierName
FROM Products p
CROSS JOIN Suppliers s;

2. Using Departments, Employees table Get all combinations of departments and employees.
SELECT d.DepartmentName, e.Name
FROM Departments d
CROSS JOIN Employees e;

  
3. Using Products, Suppliers table List only the combinations where the supplier actually supplies the product. Return supplier name and product name
SELECT s.SupplierName, p.ProductName
FROM Products p
JOIN Suppliers s ON p.SupplierID = s.SupplierID;

  
4. Using Orders, Customers table List customer names and their orders ID.
  SELECT c.FirstName || ' ' || c.LastName AS CustomerName, o.OrderID
FROM Customers c
JOIN Orders o ON c.CustomerID = o.CustomerID;

5. Using Courses, Students table Get all combinations of students and courses.
  SELECT s.StudentName, c.CourseName
FROM Students s
CROSS JOIN Courses c;

6. Using Products, Orders table Get product names and orders where product IDs match.
  SELECT p.ProductName, o.OrderID
FROM Products p
JOIN Orders o ON p.ProductID = o.ProductID;

7. Using Departments, Employees table List employees whose DepartmentID matches the department.
  SELECT e.Name, d.DepartmentName
FROM Employees e
JOIN Departments d ON e.DepartmentID = d.DepartmentID;

8. Using Students, Enrollments table List student names and their enrolled course IDs.
  SELECT s.StudentName, e.CourseID
FROM Students s
JOIN Enrollments e ON s.StudentID = e.StudentID;

9. Using Payments, Orders table List all orders that have matching payments.
  SELECT o.OrderID, p.PaymentID, p.Amount
FROM Orders o
JOIN Payments p ON o.OrderID = p.OrderID;

10. Using Orders, Products table Show orders where product price is more than 100.
  SELECT o.OrderID, p.ProductName, p.Price
FROM Orders o
JOIN Products p ON o.ProductID = p.ProductID
WHERE p.Price > 100;

🟡 Medium (10 puzzles)
11. Using Employees, Departments table List employee names and department names where department IDs are not equal. It means: Show all mismatched employee-department combinations.
  SELECT e.Name, d.DepartmentName
FROM Employees e
JOIN Departments d ON e.DepartmentID <> d.DepartmentID;

12. Using Orders, Products table Show orders where ordered quantity is greater than stock quantity.
  SELECT o.OrderID, p.ProductName, o.Quantity, p.StockQuantity
FROM Orders o
JOIN Products p ON o.ProductID = p.ProductID
WHERE o.Quantity > p.StockQuantity;

13. Using Customers, Sales table List customer names and product IDs where sale amount is 500 or more.
  SELECT c.FirstName || ' ' || c.LastName AS CustomerName, s.ProductID
FROM Customers c
JOIN Sales s ON c.CustomerID = s.CustomerID
WHERE s.Amount >= 500;

14. Using Courses, Enrollments, Students table List student names and course names they’re enrolled in.
  SELECT s.StudentName, c.CourseName
FROM Students s
JOIN Enrollments e ON s.StudentID = e.StudentID
JOIN Courses c ON e.CourseID = c.CourseID;

15. Using Products, Suppliers table List product and supplier names where supplier name contains “Tech”.
  SELECT p.ProductName, s.SupplierName
FROM Products p
JOIN Suppliers s ON p.SupplierID = s.SupplierID
WHERE s.SupplierName LIKE '%Tech%';

16. Using Orders, Payments table Show orders where payment amount is less than total amount.
  SELECT o.OrderID, o.TotalAmount, p.Amount
FROM Orders o
JOIN Payments p ON o.OrderID = p.OrderID
WHERE p.Amount < o.TotalAmount;

17. Using Employees and Departments tables, get the Department Name for each employee.
  SELECT e.Name, d.DepartmentName
FROM Employees e
JOIN Departments d ON e.DepartmentID = d.DepartmentID;

18.Using Products, Categories table Show products where category is either 'Electronics' or 'Furniture'.
  SELECT ProductName, Category
FROM Products
WHERE Category IN ('Electronics', 'Furniture');

19. Using Sales, Customers table Show all sales from customers who are from 'USA'.
  SELECT s.SaleID, c.FirstName, c.LastName, c.Country
FROM Sales s
JOIN Customers c ON s.CustomerID = c.CustomerID
WHERE c.Country = 'USA';

20. Using Orders, Customers table List orders made by customers from 'Germany' and order total > 100.
  SELECT o.OrderID, c.FirstName, c.LastName, o.TotalAmount
FROM Orders o
JOIN Customers c ON o.CustomerID = c.CustomerID
WHERE c.Country = 'Germany' AND o.TotalAmount > 100;

🔴 Hard (5 puzzles)(Do some research for the tasks below)
  
21. Using Employees table List all pairs of employees from different departments.
  SELECT e1.Name AS Employee1, e2.Name AS Employee2
FROM Employees e1
JOIN Employees e2 ON e1.EmployeeID < e2.EmployeeID
WHERE e1.DepartmentID <> e2.DepartmentID;

22. Using Payments, Orders, Products table List payment details where the paid amount is not equal to (Quantity × Product Price).
  SELECT p.PaymentID, o.OrderID, p.Amount, (o.Quantity * pr.Price) AS ExpectedAmount
FROM Payments p
JOIN Orders o ON p.OrderID = o.OrderID
JOIN Products pr ON o.ProductID = pr.ProductID
WHERE p.Amount <> (o.Quantity * pr.Price);

23. Using Students, Enrollments, Courses table Find students who are not enrolled in any course.
  SELECT s.StudentName
FROM Students s
LEFT JOIN Enrollments e ON s.StudentID = e.StudentID
WHERE e.StudentID IS NULL;

24. Using Employees table List employees who are managers of someone, but their salary is less than or equal to the person they manage.
  SELECT m.Name AS Manager, e.Name AS Employee, m.Salary AS ManagerSalary, e.Salary AS EmployeeSalary
FROM Employees e
JOIN Employees m ON e.ManagerID = m.EmployeeID
WHERE m.Salary <= e.Salary;

25. Using Orders, Payments, Customers table List customers who have made an order, but no payment has been recorded for it.
SELECT DISTINCT c.FirstName, c.LastName, o.OrderID
FROM Customers c
JOIN Orders o ON c.CustomerID = o.CustomerID
LEFT JOIN Payments p ON o.OrderID = p.OrderID
WHERE p.OrderID IS NULL;

