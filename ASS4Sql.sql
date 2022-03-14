
Question1
CREATE VIEW view_product_order_kadje 
AS
SELECT p.ProductID, p.ProductName, SUM(od.Quantity) ProductTotal
FROM Products p JOIN [Order Details] od ON p.ProductID=od.ProductID JOIN Orders o ON od.OrderID=o.OrderID
GROUP BY p.ProductID, p.ProductName


Question 2
CREATE PROC sp_product_order_quantity_kadje
@productID int,
@productTotal int out
AS
BEGIN
SELECT @productTotal=SUM(od.Quantity) 
FROM Products p JOIN [Order Details] od ON p.ProductID=od.ProductID  --JOIN Orders o ON od.OrderID=o.OrderID; AVOID MULTIPLE JOINS
WHERE p.ProductID=@productID                                           
END

--BEGIN
--DECLARE @productQuantity int
--EXEC sp_product_order_quantity_kadje 23,@productQuantity output
--PRINT @productQuantity
--END

Question 3
CREATE PROC sp_product_order_city_kadje
@prodName VARCHAR(40)
AS
BEGIN
SELECT TOP 5 o.ShipCity, SUM(od.Quantity) CityQuantity
FROM Products p JOIN [Order Details] od ON p.ProductID=od.ProductID JOIN Orders o ON od.OrderID=o.OrderID 
WHERE p.ProductName=@prodName
GROUP BY o.ShipCity
ORDER BY SUM(od.Quantity) DESC
END

--BEGIN
--DECLARE @name VARCHAR(40)
--EXEC sp_product_order_city_kadje Chai
--END

Question 4
CREATE TABLE City_kadje(
Id int PRIMARY KEY IDENTITY(1,1),
CName VARCHAR(40) UNIQUE NOT NULL
)

INSERT INTO City_kadje VALUES('Seattle')
INSERT INTO City_kadje VALUES('Green Bay')

CREATE TABLE people_kadje(
Id int PRIMARY KEY,
Name VARCHAR(40) UNIQUE,
City int FOREIGN KEY REFERENCES City_kadje(Id) ON DELETE SET NULL)

INSERT INTO people_kadje VALUES(1,'Aaron Rodgers',2)
INSERT INTO people_kadje VALUES(2,'Russell Wilson',1)
INSERT INTO people_kadje VALUES(3,'Jody Nelson',2)

DELETE FROM City_kadje WHERE Id = 1
INSERT INTO City_kadje VALUES('Madison')

DELETE FROM people_kadje WHERE Id = 2
INSERT INTO people_kadje VALUES(2,'Russell Wilson',3)

CREATE VIEW Packers_kadje
AS SELECT * FROM people_kadje WHERE City = 2

DROP TABLE people_kadje
DROP TABLE City_kadje
DROP VIEW Packers_kadje

Question 5
CREATE PROC birthday_employees_kadje
AS
BEGIN
SELECT EmployeeID, Firstname+' '+LastName [Employee Name], Title, BirthDate  --Use Select INTO #EmployeeTemp
FROM Employees WHERE MONTH(BirthDate) = 02
END

DROP birthday_employees_kadje  --Select * from #EmployeeTemp , then drop #EmployeeTemp


Question 6
Create a view of on table, so both tables (table and the view of it) have the same data. --false

--SAME DATA SEEMS TO MEAN SAME COLUNS(ATTRIBUTES)
SELECT * FROM Customers where 1=2

SELECT c.CompanyName, o.CustomerID,o.OrderDate
FROM Customers c JOIN Orders o ON c.CustomerID=o.CustomerID 
WHERE OrderDate>1998-01-01



--SELECT * FROM Orders


