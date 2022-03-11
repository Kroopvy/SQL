Question 1
SELECT DISTINCT  e.City
FROM Employees e JOIN Customers c ON e.City=c.City

Question 2
SELECT DISTINCT City
From Customers Where City NOT IN (Select Distinct City From Employees)

SELECT DISTINCT  c.City
FROM Customers c CROSS JOIN Employees 
WHERE c.City NOT IN ('Kirkland','London','Seattle')    

Question3
SELECT p.ProductID, p.ProductName, SUM(od.Quantity) TotalQuantity
FROM Products p JOIN [Order Details] od ON p.ProductID=od.ProductID JOIN Orders o ON od.OrderID=o.OrderID
GROUP BY p.ProductID, p.ProductName

Question 4
SELECT c.City, SUM(od.Quantity) TotalCityQuantity
FROM Customers c JOIN Orders o ON c.City=o.ShipCity JOIN [Order Details] od ON o.OrderID=od.OrderID     
GROUP BY c.City

Question 5

SELECT dt.City, dt.TotalCustomers
FROM  
(SELECT DISTINCT City, COUNT(City) TotalCustomers
FROM Customers
GROUP BY City) dt
WHERE dt.TotalCustomers>=2

Question 6
SELECT c.City, COUNT ( p.ProductID) NbrOfProd
FROM Customers c JOIN Orders o ON c.CustomerID=o.CustomerID JOIN [Order Details] od ON o.OrderID=od.OrderID JOIN Products p ON od.ProductID=p.ProductID
GROUP BY c.City
HAVING COUNT(p.ProductID) >= 2

Question 7
SELECT DISTINCT c.CustomerID,c.CompanyName, c.City, o.ShipCity
FROM Customers c JOIN Orders o ON c.CustomerID=o.CustomerID
WHERE c.City != o.ShipCity

Question 8,
SELECT  dt.ProductName, AVG(dt.UnitPrice) dt.TotalQuantity, dt.RNK
FROM
(SELECT p.ProductName, p.UnitPrice, SUM(od.Quantity) TotalQuantity, RANK() OVER(ORDER BY SUM(od.Quantity) DESC) RNK
FROM Products p JOIN [Order Details] od ON p.ProductID=od.ProductID JOIN Orders o ON od.OrderID=o.OrderID
GROUP BY p.ProductName, p.UnitPrice) dt
WHERE RNK <= 5
UNION 
SELECT dt1.City, dt1.TotalCityQuantity, dt1.RNK
FROM
(SELECT c.City, SUM(od.Quantity) TotalCityQuantity, RANK() OVER(ORDER BY SUM(od.Quantity) DESC) RNK
FROM Customers c JOIN Orders o ON c.City=o.ShipCity JOIN [Order Details] od ON o.OrderID=od.OrderID     
GROUP BY c.City) dt1
WHERE dt1.RNK=1


Question 9
SELECT City FROM Employees WHERE Employees.City NOT IN (SELECT ShipCity FROM Orders)

SELECT City FROM Employees
EXCEPT
SELECT ShipCity FROM Orders

Question 10
SELECT dt.City, dt.TotalOrder, dt.RNK
FROM
(select e.City, COUNT(OrderID) TotalOrder, RANK() OVER(ORDER BY COUNT(OrderID) DESC) RNK
from employees e JOIN Orders o ON e.EmployeeID=o.EmployeeID
GROUP BY e.City) dt
WHERE dt.RNK=1
INTERSECT
SELECT dt1.City, dt1.TotalCityQuantity, dt1.RNK
FROM
(SELECT c.City, SUM(od.Quantity) TotalCityQuantity, RANK() OVER(ORDER BY SUM(od.Quantity) DESC) RNK
FROM Customers c JOIN Orders o ON c.City=o.ShipCity JOIN [Order Details] od ON o.OrderID=od.OrderID     
GROUP BY c.City) dt1
WHERE dt1.RNK=1

Question 11
SELECT DISTINCT

SELECT *
FROM Employees
SELECT *
FROM [Order Details]
SELECT *
FROM Orders
SELECT *
FROM Customers