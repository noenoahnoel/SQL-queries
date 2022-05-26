-- joining similar tables 
SELECT 
    SupplierMailAddr 
FROM Supplier, Fabric, Product 
WHERE Product.ProdFabCode = Fabric.FabricCode
    AND Fabric.FabSupplier = Supplier.SupId
    AND ProdDesc = 'Canoe Pack'; 

-- union, intersect & difference 
SELECT 
    ProductId, 
    ProdDesc 
FROM ProductEast 
UNION 
SELECT 
    ProductId, 
    ProdDesc
FROM ProductWest; 

SELECT 
    ProductId, 
    ProdDesc 
FROM ProductEast 
INTERSECT
SELECT 
    ProductId, 
    ProdDesc
FROM ProductWest;

-- difference, not supported on SQLite 
SELECT 
    ProductId, 
    ProdDesc 
FROM ProductEast 
DIFFERENCE
SELECT 
    ProductId, 
    ProdDesc
FROM ProductWest;

-- aggregate functions, grouping 
SELECT 
    AVG(ProductPrice), 
    SUM(ProductPrice),
    MIN(ProductPrice),
    MAX(ProductPrice),
    COUNT(ProductPrice)
FROM product;

SELECT 
    OrderNum, 
    AVG(Price),
    COUNT(ProductId) AS TotalProduct
FROM OrderItem
GROUP BY OrderNum; 

SELECT 
    ShippingCompany, 
    COUNT(OrderNum)
FROM Shipper, Orders 
WHERE Shipper.ShipId = Orders.OrderShipId
GROUP BY ShippingCompany; 

-- grouping w/ where & having statements 
SELECT 
    OrderNum, 
    COUNT(ProductId)
FROM OrderItem
GROUP BY OrderNum
HAVING COUNT(ProductId) > 1  

SELECT
    OrderNum, 
    COUNT(ORderItem.ProductId)
FROM OrderItem, Product, Fabric, Supplier
WHERE OrderItem.ProductId = Product.ProductId
    AND Fabric.FabricCode = Product.ProdFabCode
    AND Fabric.FabSupplier = Supplier.SupId
    AND SupplierState = 'MN'
GROUP BY OrderNum
HAVING COUNT(OrderItem.ProductId) > 1; 

-- subqueries 
SELECT
    ProdDesc, 
    ProductPrice
FROM Product 
WHERE ProductPrice > 
    (SELECT AVG(ProductPrice)
     FROM Product); 

-- using a subquery to join tables 
SELECT
    CustLastName, 
    CustFirstName
FROM Customer  
WHERE CustomerId IN 
    (SELECT OrderCustId
     FROM Orders 
     WHERE OrderDate = '2022/05/06'); 

-- calculated fields 
SELECT 
    ProdDesc, 
    ProductPrice, 
    ProductCost, 
    ProductPrice - ProductCost AS Profit
FROM Product; 

SELECT 
    OrderNum, 
    SUM(Quantity * Price) AS AmountDue 
FROM OrderItem
GROUP BY OrderNum

-- case statements 
SELECT 
    OrderNum, 
    ProductId, 
    DiscountLevel, 
    (Quantity * Price) AS AmountDue, 
    CASE DiscountLevel
        WHEN 'b' THEN (Quantity * Price) * .95 -- for 5% discount 
        WHEN 'c' THEN (Quantity * Price) * .90 -- for 10% discount 
        WHEN 'd' THEN (Quantity * Price) * .80 -- for 20% discount 
        ELSE (Quantity * Price)
        END AS DueAfterDiscount 
FROM OrderItem; 

