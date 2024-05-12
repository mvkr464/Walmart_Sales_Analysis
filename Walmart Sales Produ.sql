# 1.How many unique product lines does the data have? 
SELECT DISTINCT
    product_line
FROM
    sales;
SELECT 
    COUNT(DISTINCT product_line)
FROM
    sales;
# 2.What is the most common payment method? 
SELECT 
    payment, COUNT(payment) AS no_of_payments
FROM
    sales
GROUP BY payment
ORDER BY 2 DESC
LIMIT 1;
# 3.What is the most selling product line? 
SELECT 
    product_line, COUNT(product_line) AS no_of_product_line
FROM
    sales
GROUP BY product_line
ORDER BY 2 DESC
LIMIT 1;
# 4.What is the total revenue by month? 
SELECT 
    month_name AS month, SUM(total) AS revenue
FROM
    sales
GROUP BY 1
ORDER BY revenue DESC;
# 5.What month had the largest COGS? 
SELECT 
    month_name AS month, SUM(cogs) AS cogs
FROM
    sales
GROUP BY month
ORDER BY 2 DESC
LIMIT 1;
# 6.What product line had the largest revenue? 
SELECT 
    product_line, SUM(total) AS revenue
FROM
    sales
GROUP BY product_line
ORDER BY 2 DESC;
# 7.What is the city with the largest revenue? 
SELECT 
    city, SUM(total) AS revenue
FROM
    sales
GROUP BY 1
ORDER BY 2 DESC
LIMIT 1;
# 8. What product line had the largest VAT? 
SELECT 
    product_line, SUM(tax_pct) AS VAT
FROM
    sales
GROUP BY 1
ORDER BY 2 DESC
LIMIT 1;
# 9.Fetch each product line and add a column to those product line showing "Good", "Bad". Good if its greater than average sales 
select avg(total) as avg_sales from sales;
select product_line, (case when total > (select avg(total) as avg_sales from sales) then 'Good'
							else 'Bad' end) as sales_category from sales;
Alter table sales add column sales_category varchar(10);
update sales set sales_category = (case when total > (select avg(total) as avg_sales ) then 'Good'
							else 'Bad' end);
# 10.Which branch sold more products than average product sold? 
SELECT 
    branch, SUM(quantity)
FROM
    sales
GROUP BY branch
HAVING SUM(quantity) > (SELECT 
        AVG(quantity)
    FROM
        sales)
ORDER BY 2 DESC;
# 11.What is the most common product line by gender? 
SELECT 
    gender, product_line, COUNT(gender) AS product_line_sum
FROM
    sales
GROUP BY product_line , gender
ORDER BY 3 DESC;
# 12.What is the average rating of each product line? 
SELECT 
    product_line, ROUND(AVG(rating), 2)
FROM
    sales
GROUP BY product_line
ORDER BY 2 DESC;