                                                       -- Database Creation --


create database Zepto_SQL_Project;

CREATE TABLE Zepto (
    category VARCHAR(250),
    name VARCHAR(250) NOT NULL,
    mrp INT,
    dicountPercent INT,
    availableQuantity INT,
    discountedSellingPrice INT,
    weightinGms INT,
    outOfStock VARCHAR(25),
    quantity INT
);

ALTER TABLE zepto
ADD COLUMN sku_id INT AUTO_INCREMENT PRIMARY KEY;
select*from zepto limit 10;

ALTER TABLE zepto
MODIFY COLUMN sku_id INT FIRST;


											-- Data Exploration --

-- COUNT OF ROWS --

SELECT 
    COUNT(*)
FROM
    zepto; 

-- Sample of Data --

SELECT 
    *
FROM
    zepto
LIMIT 10;

-- Check Null Values --

SELECT 
    *
FROM
    zepto
WHERE
    category IS NULL OR name IS NULL
        OR mrp IS NULL
        OR dicountPercent IS NULL
        OR availableQuantity IS NULL
        OR discountedSellingPrice IS NULL
        OR weightinGms IS NULL
        OR outOfStock IS NULL
        OR quantity IS NULL;

-- Check Duplicate Value --

SELECT 
    name, COUNT(*)
FROM
    zepto
GROUP BY name
HAVING COUNT(*) > 1
order by count(*) desc;

 
-- Check Negative or Invalid values --

SELECT *
FROM zepto
WHERE mrp < 0
   OR discountedSellingPrice < 0
   OR availableQuantity < 0
   OR quantity < 0;
   
-- Product Instock v/s out of stock --
   
select outOfStock, count(sku_id) from zepto
group by outOfStock
order by count(sku_id) desc;

-- Types of category --

select category from zepto
group by category;

                                              -- DATA CLEANING --


-- Products with 0 Mrp --

SELECT 
    *
FROM
    zepto
WHERE
    mrp = 0 OR discountedSellingPrice = 0;

SET SQL_SAFE_UPDATES = 0;

DELETE FROM zepto 
WHERE
    mrp = 0;

select * from zepto limit 10;

-- Convert into Paise into Rupees --

UPDATE zepto 
SET 
    mrp = mrp / 100,
    discountedSellingPrice = discountedSellingPrice / 100;



