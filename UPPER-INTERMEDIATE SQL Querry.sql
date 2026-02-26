                                  -- UPPER-INTERMEDIATE (Subqueries, Derived Tables) --
-- 16 Find products whose selling price is above the average selling price.

SELECT 
    sku_id,
    name,
    discountedSellingPrice
FROM zepto
WHERE   discountedSellingPrice > (
    SELECT AVG(  discountedSellingPrice)
    FROM zepto
);

-- 17 Identify products generating revenue higher than the average revenue.

SELECT 
    name,
    discountedsellingprice * Quantity AS revenue
FROM zepto
WHERE (discountedSellingPrice * Quantity) > (
    SELECT AVG(discountedSellingPrice * Quantity)
    FROM zepto
)
ORDER BY revenue DESC;

-- 18 Find the second highest selling product.

SELECT name,
       Quantity
FROM zepto
ORDER BY Quantity DESC
LIMIT 1 OFFSET 2;



-- 19 Display products that have higher MRP than the average MRP of their category.


SELECT 
    sku_id,
    name,
    Category,
    MRP
FROM zepto z1
WHERE MRP > (
    SELECT AVG(MRP)
    FROM zepto z2
    WHERE z1.Category = z2.Category
);


-- 20 Find the category contributing the highest total revenue.


SELECT 
    Category,
    SUM(discountedsellingprice * Quantity) AS total_revenue
FROM zepto
GROUP BY Category
ORDER BY total_revenue DESC
LIMIT 1;


