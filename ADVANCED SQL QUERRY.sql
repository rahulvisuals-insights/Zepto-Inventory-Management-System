                                                       -- ADVANCED QUESTION --

-- Rank products based on revenue within each category.

SELECT 
    Category,
    name,
    SUM(discountedsellingprice * Quantity) AS total_revenue,
    RANK() OVER (
        PARTITION BY Category
        ORDER BY SUM(discountedsellingprice *Quantity) DESC
    ) AS revenue_rank
FROM zepto
GROUP BY Category, name;

-- Find top 3 products from each category using ROW_NUMBER().

SELECT *
FROM (
    SELECT 
        Category,
        name,
        SUM(discountedsellingprice * Quantity) AS total_revenue,
        ROW_NUMBER() OVER (
            PARTITION BY Category
            ORDER BY SUM(discountedsellingprice * Quantity) DESC
        ) AS row_num
    FROM zepto
    GROUP BY Category, name
) ranked
WHERE row_num <= 3;


-- Calculate percentage contribution of each product to total revenue.

SELECT 
    name,
    SUM(discountedsellingprice * Quantity) AS product_revenue,
    ROUND(
        SUM(discountedsellingprice * Quantity) * 100.0 /
        SUM(SUM(discountedsellingprice * Quantity)) OVER (),
        2
    ) AS revenue_percentage
FROM zepto
GROUP BY name
ORDER BY revenue_percentage DESC;






