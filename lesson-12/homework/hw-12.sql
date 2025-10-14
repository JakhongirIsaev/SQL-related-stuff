1. 
SELECT p.firstName, p.lastName, a.city, a.state
FROM Person p
LEFT JOIN Address a ON p.personId = a.personId


2. 
SELECT e.name AS Employee
FROM Employee e
JOIN Employee m ON e.managerId = m.id
WHERE e.salary > m.salary;

3. 

SELECT email AS Email
FROM Person
GROUP BY email
HAVING COUNT(*) > 1;


4. 
DELETE p1 FROM Person p1
INNER JOIN Person p2 ON p1.email = p2.email AND p1.id > p2.id;

5.
SELECT DISTINCT g.ParentName
FROM girls g
WHERE g.ParentName NOT IN (SELECT DISTINCT ParentName FROM boys);


6.

SELECT 
    c.companyname AS CustomerName,
    SUM(o.freight) AS TotalSalesAmount,
    MIN(o.freight) AS LeastWeight
FROM Sales.Orders o
JOIN Sales.Customers c ON o.custid = c.custid
WHERE o.freight > 50
GROUP BY c.custid, c.companyname
ORDER BY CustomerName;


7. 
SELECT 
    c1.Item AS [Item Cart 1],
    c2.Item AS [Item Cart 2]
FROM Cart1 c1
FULL OUTER JOIN Cart2 c2 ON c1.Item = c2.Item
ORDER BY ISNULL(c1.Item, c2.Item);

8. 
  
SELECT c.name AS Customers
FROM Customers c
LEFT JOIN Orders o ON c.id = o.customerId
WHERE o.customerId IS NULL;

9.
  
sqlSELECT 
    s.student_id,
    s.student_name,
    sub.subject_name,
    ISNULL(COUNT(e.student_id), 0) AS attended_exams
FROM Students s
CROSS JOIN Subjects sub
LEFT JOIN Examinations e ON s.student_id = e.student_id AND sub.subject_name = e.subject_name
GROUP BY s.student_id, s.student_name, sub.subject_name
ORDER BY s.student_id, sub.subject_name;
