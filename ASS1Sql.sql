Question 1.1
SELECT ProductID, Name, Color, ListPrice 
FROM  Production.Product 

Question 1.2
SELECT ProductID, Name, Color, ListPrice 
FROM  Production.Product
WHERE ListPrice <> 0

Question 1.3
SELECT ProductID, Name, Color, ListPrice 
FROM  Production.Product
WHERE Color IS NULL

Question 1.4
SELECT ProductID, Name, Color, ListPrice 
FROM  Production.Product
WHERE Color IS NOT NULL

Question 1.5
SELECT ProductID, Name, Color, ListPrice 
FROM  Production.Product
WHERE Color IS NOT NULL AND ListPrice>0

Question 1.6
SELECT Name +'   '+ Color AS [Product   -   Color]
FROM Production.Product
WHERE Color IS NOT NULL

Question 1.7
SELECT TOP 6 Name +'   '+ Color AS [Product   -   Color]
FROM Production.Product
WHERE Color IS NOT NULL

Question 1.8
SELECT ProductID, Name 
FROM  Production.Product
WHERE ProductID BETWEEN 400 AND 500

Question 1.9
SELECT ProductID, Name, Color 
FROM  Production.Product
WHERE Color = 'Black' OR Color = 'Blue'

Question 1.10
SELECT ProductID, Name, Color 
FROM  Production.Product
WHERE Production.Product.Name LIKE 'S%'

Question 1.11
SELECT TOP 6 Name, ListPrice 
FROM  Production.Product
WHERE Name LIKE 'Seat%' OR Name LIKE 'Short%'
ORDER BY Name

Question 1.12
SELECT TOP 5 Name, ListPrice 
FROM  Production.Product
WHERE Name LIKE 'S%' OR Name LIKE 'A%'
ORDER BY Name

Question 1.13
SELECT Name, ListPrice 
FROM  Production.Product
WHERE Name LIKE 'SPO[^K]%' 
ORDER BY Name

Question 1.14
SELECT DISTINCT Color
FROM  Production.Product
ORDER BY Color DESC

Question 1.15
SELECT DISTINCT ProductSubcategoryID, Color
FROM Production.Product
WHERE ProductSubcategoryID IS NOT NULL AND Color IS NOT NULL