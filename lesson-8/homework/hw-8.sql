1. Using Products table, find the total number of products available in each category.

SELECT Category, COUNT(*) AS TotalProducts
FROM Products
GROUP BY Category
ORDER BY TotalProducts DESC;

2. Using Products table, get the average price of products in the 'Electronics' category.

SELECT AVG(Price) AS AveragePrice
FROM Products
WHERE Category = 'Electronics';

3. Using Customers table, list all customers from cities that start with 'L'.
SELECT FirstName, LastName, City, Country
FROM Customers
WHERE City LIKE 'L%'
ORDER BY LastName;
  
4. Using Products table, get all product names that end with 'er'.
SELECT ProductName
FROM Products
WHERE ProductName LIKE '%er'
ORDER BY ProductName;
  
5. Using Customers table, list all customers from countries ending in 'A'.
SELECT FirstName, LastName, Country
FROM Customers
WHERE Country LIKE '%A'
ORDER BY Country, LastName;
  
6. Using Products table, show the highest price among all products.
SELECT MAX(Price) AS HighestPrice
FROM Products;
  
7. Using Products table, label stock as 'Low Stock' if quantity < 30, else 'Sufficient'.
SELECT ProductName, StockQuantity,
       CASE
           WHEN StockQuantity < 30 THEN 'Low Stock'
           ELSE 'Sufficient'
       END AS StockStatus
FROM Products
ORDER BY ProductName;
  
8. Using Customers table, find the total number of customers in each country.
SELECT Country, COUNT(*) AS TotalCustomers
FROM Customers
GROUP BY Country
ORDER BY TotalCustomers DESC;
  
9. Using Orders table, find the minimum and maximum quantity ordered.

SELECT MIN(Quantity) AS MinQuantity, MAX(Quantity) AS MaxQuantity
FROM Orders;  

10. Using Orders and Invoices tables, list customer IDs who placed orders in 2023 January to find those who did not have invoices.
SELECT DISTINCT o.CustomerID
FROM Orders o
LEFT JOIN Invoices i ON o.CustomerID = i.CustomerID
WHERE YEAR(o.OrderDate) = 2023 AND MONTH(o.OrderDate) = 1
  AND i.CustomerID IS NULL
ORDER BY o.CustomerID;

  
11. Using Products and Products_Discounted table, Combine all product names from Products and Products_Discounted including duplicates.
SELECT ProductName FROM Products
UNION ALL
SELECT ProductName FROM Products_Discounted
ORDER BY ProductName;
  
12. Using Products and Products_Discounted table, Combine all product names from Products and Products_Discounted without duplicates.

SELECT ProductName FROM Products
UNION
SELECT ProductName FROM Products_Discounted
ORDER BY ProductName;
  
13. Using Orders table, find the average order amount by year.

SELECT YEAR(OrderDate) AS Year, AVG(TotalAmount) AS AverageOrderAmount
FROM Orders
GROUP BY YEAR(OrderDate)
ORDER BY Year;
  
14. Using Products table, group products based on price: 'Low' (<100), 'Mid' (100-500), 'High' (>500). Return productname and pricegroup.
SELECT ProductName,
       CASE
           WHEN Price < 100 THEN 'Low'
           WHEN Price BETWEEN 100 AND 500 THEN 'Mid'
           ELSE 'High'
       END AS PriceGroup
FROM Products
ORDER BY PriceGroup, ProductName;

  
15. Using City_Population table, use Pivot to show values of Year column in seperate columns ([2012], [2013]) and copy results to a new Population_Each_Year table.

CREATE TABLE Population_Each_Year AS
SELECT district_name, [2012], [2013]
FROM (
    SELECT district_name, population, year
    FROM City_Population
) AS SourceTable
PIVOT (
    SUM(population)
    FOR year IN ([2012], [2013])
) AS PivotTable;

  
16. Using Sales table, find total sales per product Id.

SELECT ProductID, SUM(SaleAmount) AS TotalSales
FROM Sales
GROUP BY ProductID
ORDER BY ProductID;
  
17. Using Products table, use wildcard to find products that contain 'oo' in the name. Return productname.

SELECT ProductName
FROM Products
WHERE ProductName LIKE '%oo%'
ORDER BY ProductName;
  
18. Using City_Population table, use Pivot to show values of City column in seperate columns (Bektemir, Chilonzor, Yakkasaroy) and copy results to a new Population_Each_City table.

CREATE TABLE Population_Each_City AS
SELECT year, [Bektemir], [Chilonzor], [Yakkasaroy]
FROM (
    SELECT year, population, district_name
    FROM City_Population
) AS SourceTable
PIVOT (
    SUM(population)
    FOR district_name IN ([Bektemir], [Chilonzor], [Yakkasaroy])
) AS PivotTable;

19. Using Invoices table, show top 3 customers with the highest total invoice amount. Return CustomerID and Totalspent.

  SELECT TOP 3 CustomerID, SUM(TotalAmount) AS TotalSpent
FROM Invoices
GROUP BY CustomerID
ORDER BY TotalSpent DESC;
20. Transform Population_Each_Year table to its original format (City_Population).

  -- Unpivot to original format and recreate City_Population with district_id
DROP TABLE IF EXISTS City_Population;  -- Optional: clear existing if needed

CREATE TABLE City_Population AS
SELECT 
    CASE district_name 
        WHEN 'Chilonzor' THEN 1
        WHEN 'Yakkasaroy' THEN 2
        WHEN 'Mirobod' THEN 3
        WHEN 'Yashnobod' THEN 4
        WHEN 'Bektemir' THEN 5
    END AS district_id,
    district_name, 
    population, 
    year
FROM (
    SELECT district_name, [2012], [2013]
    FROM Population_Each_Year
) s
UNPIVOT (
    population FOR year IN ([2012], [2013])
) AS unpvt;
21. Using Products and Sales tables, list product names and the number of times each has been sold. (Research for Joins)
-- Using INNER JOIN to combine Products and Sales tables based on ProductID
SELECT p.ProductName, COUNT(s.SaleID) AS TimesSold
FROM Products p
INNER JOIN Sales s ON p.ProductID = s.ProductID
GROUP BY p.ProductName
ORDER BY TimesSold DESC;
  
22. Transform Population_Each_City table to its original format (City_Population).
  -- Unpivot to original format (partial, as pivot only included 3 cities) and recreate City_Population with district_id
DROP TABLE IF EXISTS City_Population;  -- Optional: clear existing if needed

CREATE TABLE City_Population AS
SELECT 
    CASE district_name 
        WHEN 'Chilonzor' THEN 1
        WHEN 'Yakkasaroy' THEN 2
        WHEN 'Bektemir' THEN 5
    END AS district_id,
    district_name, 
    population, 
    year
FROM (
    SELECT year, [Bektemir], [Chilonzor], [Yakkasaroy]
    FROM Population_Each_City
) s
UNPIVOT (
    population FOR district_name IN ([Bektemir], [Chilonzor], [Yakkasaroy])
) AS unpvt;
