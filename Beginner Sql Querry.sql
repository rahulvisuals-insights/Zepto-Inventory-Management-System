                                                                 -- BEGINNER LEVEL --

-- 1 Retrieve all products in the "Fruits & Vegetables" category.

select name from zepto
where category="Fruits & Vegetables";

-- 2 Display product names and their selling prices.

SELECT 
    name AS Product_name,
    discountedSellingPrice AS Selling_price
FROM
    zepto;

-- 3 Find products where Discount_Percentage is greater than 15%.

SELECT 
    *
FROM
    zepto
WHERE
    dicountPercent > 15;

-- 4 Count total number of products in the dataset.

select count(sku_id) from zepto;

-- 5 Find the number of products available in each category.

select category, count(name) from zepto
group by category;

-- 6 List all products that are currently out of stock.

select name, availableQuantity from zepto
where outOfStock="True";

-- 7 Find the maximum and minimum MRP in the dataset.

select max(mrp) from zepto;
select min(mrp) from zepto;

-- 8 Show products with Available_Quantity less than 5.

select name from zepto 
where availableQuantity>5;
