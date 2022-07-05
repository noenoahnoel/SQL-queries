--View the indivdual tables 
SELECT * FROM Sales.SalesTerritory

SELECT * FROM Sales.SalesTerritoryHistory 

--Join tables w/ an inner join 
SELECT t.Name, t.SalesYTD, h.StartDate, h.EndDate
FROM Sales.SalesTerritory t
JOIN Sales.SalesTerritoryHistory h
ON t.TerritoryID = h.TerritoryID 

--Sort the table 
SELECT t.Name, t.SalesYTD, h.StartDate, h.EndDate
FROM Sales.SalesTerritory t
JOIN Sales.SalesTerritoryHistory h
ON t.TerritoryID = h.TerritoryID
ORDER BY Name DESC

--Check for duplicate records, group results by the count 
SELECT t.Name, t.SalesYTD, h.StartDate, h.EndDate, COUNT(*) as CNT
FROM Sales.SalesTerritory t
JOIN Sales.SalesTerritoryHistory h
ON t.TerritoryID = h.TerritoryID
GROUP BY Name, StartDate, EndDate, SalesYTD
HAVING COUNT(*)>1

--Calculate the total sales YTD for USA 
SELECT t.Name, SUM(t.SalesYTD) as Total_Sales, h.StartDate, h.EndDate, COUNT(*) as CNT
FROM Sales.SalesTerritory t
JOIN Sales.SalesTerritoryHistory h
ON t.TerritoryID = h.TerritoryID
GROUP BY Name, StartDate, EndDate, SalesYTD
HAVING Name = ‘USA’

--Calculate the total sales for Canada, and Mexico
SELECT t.Name, SUM(t.SalesYTD) as Total_Sales, h.StartDate, h.EndDate, COUNT(*) as CNT
FROM Sales.SalesTerritory t
JOIN Sales.SalesTerritoryHistory h
ON t.TerritoryID = h.TerritoryID
GROUP BY Name, StartDate, EndDate, SalesYTD
HAVING Name in (‘Canada’, ’Mexico’) 

--Return the highest total sales by calculating the sum of SalesYTD & returning TOP record 
SELECT TOP(1) t.Name, SUM(t.SalesYTD) as Total_Sales, h.StartDate, h.EndDate, COUNT(*) as CNT
FROM Sales.SalesTerritory t
JOIN Sales.SalesTerritoryHistory h
ON t.TerritoryID = h.TerritoryID
GROUP BY Name, StartDate, EndDate, SalesYTD
ORDER BY SUM(t.SalesYTD) DESC