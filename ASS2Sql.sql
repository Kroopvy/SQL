Question 1
SELECT COUNT(1)
FROM Production.Product

Question 2
SELECT COUNT(ProductSubcategoryID) 
FROM Production.Product
WHERE ProductSubcategoryID IS NOT NULL

Question 3
SELECT ProductSubcategoryID, COUNT(ProductSubcategoryID) CountedProducts
FROM Production.Product
WHERE ProductSubcategoryID IS NOT NULL
GROUP BY ProductSubcategoryID

Question 4
SELECT COUNT(ProductID) AS "Number of Products Not in a Subcategory" 
FROM Production.Product
WHERE ProductSubcategoryID IS NULL

Question 5
SELECT ProductID, SUM(Quantity) QuantityOfProduct
FROM Production.ProductInventory
GROUP BY ProductID

Question 6
SELECT ProductID, SUM(Quantity) TheSum
FROM Production.ProductInventory
WHERE LocationID = 40                 
GROUP BY ProductID
HAVING TheSum < 100

Question 7
SELECT Shelf, ProductID, SUM(Quantity) TheSum
FROM Production.ProductInventory
WHERE LocationID = 40                 
GROUP BY Shelf, ProductID
HAVING SUM(Quantity) < 100

Question 8
SELECT ProductID, AVG(Quantity) AverageQuantity
FROM Production.ProductInventory
WHERE LocationID = 10                 
GROUP BY ProductID

Question 9
SELECT ProductID, Shelf, AVG(Quantity) TheAvg
FROM Production.ProductInventory                
GROUP BY ProductID, Shelf

Question 10
SELECT ProductID, Shelf, AVG(Quantity) TheAvg
FROM Production.ProductInventory 
WHERE Shelf != 'N/A'                
GROUP BY ProductID, Shelf

Question 11
SELECT Color, Class ,COUNT(Color)TheCount, AVG(ListPrice) AvgPrice
FROM Production.Product
WHERE Color IS NOT NULL AND Class IS NOT NULL 
GROUP BY Color, Class

Question 12
SELECT c.Name Country, p.Name Province
FROM person.CountryRegion c JOIN person.StateProvince p ON c.CountryRegionCode=p.CountryRegionCode

Question 13
SELECT c.Name Country, p.Name Province
FROM person.CountryRegion c JOIN person.StateProvince p ON c.CountryRegionCode=p.CountryRegionCode
WHERE c.Name IN ('Germany', 'Canada')

Question 14
SELECT DISTINCT p.ProductID, p.ProductName
FROM Orders o JOIN [Order Details] od ON o.OrderID=od.OrderID RIGHT JOIN Products p ON od.ProductID=p.ProductID 
WHERE YEAR(o.OrderDate) > YEAR(GETDATE()) - 25  

Question 15
SELECT TOP 5 SUM(od.Quantity) TopQuantity, o.ShipPostalCode
FROM Orders o JOIN [Order Details] od ON o.OrderID=od.OrderID JOIN Products p ON od.ProductID=p.ProductID
WHERE o.ShipPostalCode IS NOT NULL
GROUP BY o.ShipPostalCode
ORDER BY SUM(od.Quantity) DESC

Question 16
SELECT TOP 5 SUM(od.Quantity) TopQuantity, o.ShipPostalCode
FROM Orders o JOIN [Order Details] od ON o.OrderID=od.OrderID JOIN Products p ON od.ProductID=p.ProductID
WHERE o.ShipPostalCode IS NOT NULL AND YEAR(o.OrderDate) > YEAR(GETDATE()) - 25 
GROUP BY o.ShipPostalCode
ORDER BY SUM(od.Quantity) DESC

Question 17
SELECT DISTINCT City, Count(CustomerID)
FROM Customers
GROUP BY City

Question 18
SELECT DISTINCT City, Count(CustomerID) AS Total
FROM Customers
GROUP BY City
HAVING  Count(CustomerID) > 2

Question 19
SELECT DISTINCT c.CompanyName, o.OrderDate
FROM Customers c JOIN Orders o ON c.CustomerID=o.CustomerID
WHERE o.OrderDate > '1998-01-01'

Question 20
SELECT c.CompanyName, Max(o.OrderDate)
FROM Customers c LEFT JOIN Orders o ON c.CustomerID=o.CustomerID
GROUP BY c.CompanyName
--WHERE o.OrderDate > '1998-01-01'
--ORDER BY o.OrderDate DESC

Question 21
SELECT c.CustomerID, c.CompanyName, SUM(od.Quantity) ProdCount
FROM Customers c LEFT JOIN Orders o ON c.CustomerID=o.CustomerID JOIN [Order Details] od ON o.OrderID=od.OrderID 
GROUP BY c.CustomerID,c.CompanyName

Question 22
SELECT c.CustomerID, SUM(Quantity) ProdCount
FROM Customers c LEFT JOIN Orders o ON c.CustomerID=o.CustomerID JOIN [Order Details] od ON o.OrderID=od.OrderID 
GROUP BY c.CustomerID
HAVING SUM(Quantity) > 100

Question 23
SELECT s.CompanyName [Supplier CompanyName], sh.CompanyName [Shipping CompanyName]
FROM Suppliers s CROSS JOIN Shippers sh 
ORDER BY sh.CompanyName, s.CompanyName   

Question 24
SELECT o.OrderDate, p.ProductName
FROM Products p JOIN [Order Details] od ON p.ProductID=od.ProductID RIGHT JOIN Orders o ON od.OrderID=o.OrderID
GROUP BY o.OrderDate, p.ProductName
ORDER BY p.ProductName

Question 25
SELECT  e.FirstName+' '+e.LastName Employee1, e1.FirstName+' '+e1.LastName Employee2, e.Title
FROM Employees e JOIN Employees e1 ON e.Title=e1.Title
WHERE e.FirstName != e1.FirstName OR e.LastName <> e1.LastName

Question 26
SELECT  m.FirstName+' '+m.LastName Manager, COUNT(e.ReportsTo) NumberOfEmployees
FROM Employees e JOIN Employees m ON e.ReportsTo=m.EmployeeID
GROUP BY m.FirstName+' '+m.LastName 
HAVING COUNT(e.ReportsTo) > 2

Question27
SELECT City, CompanyName, ContactName, 'Customer' AS Type
FROM Customers
UNION
SELECT City, CompanyName, ContactName, 'Supplier' AS  Type
FROM Suppliers

SELECT dt.ZipCode, dt.City, dt.TotalQuantity
FROM (SELECT c.PostalCode ZipCode,c.City City, SUM(od.Quantity) TotalQuantity, RANK() OVER(ORDER BY SUM(od.Quantity) DESC )as RNK
FROM Customers c JOIN Orders o ON c.CustomerID=o.CustomerID Join [Order Details] od ON od.OrderID=o.OrderID
GROUP BY c.PostalCode, c.City)dt
WHERE RNK <= 5

SELECT *
FROM [Order Details]
SELECT *
FROM Orders