🛒 Zepto Inventory Management – SQL Data Analysis Project
--------------------------------------------------------------
📌 Project Overview

This project performs end-to-end SQL analysis on a Zepto-style inventory dataset containing product pricing, discounts, stock levels, and sales quantity.

The objective is to extract business insights related to:

* Revenue performance

* Category contribution

* Product ranking

* Discount analysis

* Stock optimization


📂 Dataset Description
----------------------------------
The dataset contains product-level inventory and sales information.

Column Name	                            -                      Description

Category	        -                            Product category (e.g., Fruits & Vegetables)

name	                    -                                    Product name

mrp                -                                       	Maximum Retail Price

discountPercentage             -                        	Discount percentage applied

availableQuantity                 -                       	Current stock available

discountedSellingPrice	   -                      Final selling price after discount

weightInGms                          -                 	Product weight in grams

outOfStock	                          -                  Stock status (TRUE/FALSE)

quantity                                                       	Units sold


🎯 Business Objectives
---------------------------------
* Identify top-selling products

* Calculate total revenue per product

* Rank products within categories

* Detect high stock but low sales products

* Find above-average revenue contributors

* Analyze discount impact on revenue

* Calculate percentage contribution of each product

* Identify highest revenue generating category

🛠 SQL Concepts Used
---------------------------
* SELECT, WHERE, ORDER BY

* GROUP BY & HAVING

* Aggregate Functions (SUM, AVG, COUNT)

* Subqueries

* Window Functions:

* RANK()

* DENSE_RANK()

* ROW_NUMBER()

* Revenue Calculation

* Percentage Contribution

* Case Classification

📊 Key SQL Analysis Performed
-------------------------------------
🔹 1. Data Exploration

* Total number of products

* Unique categories

* Out-of-stock products

🔹 2. Revenue Analysis

SELECT name,
       SUM(discountedSellingPrice * quantity) AS total_revenue
FROM zepto_inventory
GROUP BY name;

🔹 3. Top 3 Products Per Category

SELECT *
FROM (
    SELECT 
        Category,
        name,
        SUM(discountedSellingPrice * quantity) AS total_revenue,
        ROW_NUMBER() OVER (
            PARTITION BY Category
            ORDER BY SUM(discountedSellingPrice * quantity) DESC
        ) AS rank_no
    FROM zepto_inventory
    GROUP BY Category, name
) ranked
WHERE rank_no <= 3;


🔹 4. Category with Highest Revenue

SELECT Category,
       SUM(discountedSellingPrice * quantity) AS total_revenue
FROM zepto_inventory
GROUP BY Category
ORDER BY total_revenue DESC
LIMIT 1;

🚀 How to Run This Project
------------------------------------
* Import CSV file into MySQL / PostgreSQL

* Create table using appropriate schema

* Run SQL queries from the project folder

* Analyze results


👤 Author
-----------------
Rahul Kumar

GitHub: https://github.com/rahulvisuals-insights
LinkedIn: https://www.linkedin.com/in/profilerahul/
