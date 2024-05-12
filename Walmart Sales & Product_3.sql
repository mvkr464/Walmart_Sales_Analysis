# Sales
# 1.Number of sales made in each time of the day per weekday 
SELECT 
    time_of_day, COUNT(*) AS sales_total
FROM
    sales
GROUP BY time_of_day
ORDER BY 2 DESC;
# 2.Which of the customer types brings the most revenue? 
SELECT 
    customer_type, ROUND(SUM(total), 2) AS sales
FROM
    sales
GROUP BY customer_type
ORDER BY 2 DESC;
# 3.Which city has the largest tax percent/ VAT (Value Added Tax)? 
SELECT 
    city, ROUND(SUM(tax_pct), 2) AS VAT
FROM
    sales
GROUP BY city
ORDER BY VAT DESC;
# 4.Which customer type pays the most in VAT? 
SELECT 
    customer_type, ROUND(SUM(tax_pct), 2) AS VAT
FROM
    sales
GROUP BY 1
ORDER BY 2 DESC;
# Customer
# 1.How many unique customer types does the data have? 
SELECT DISTINCT
    customer_type
FROM
    sales;
# 2.How many unique payment methods does the data have? 
SELECT DISTINCT
    payment
FROM
    sales;
# 3.What is the most common customer type? 
SELECT 
    customer_type, COUNT(*) AS no
FROM
    sales
GROUP BY 1
ORDER BY 2 DESC;
# 4.Which customer type buys the most? 
SELECT 
    customer_type, SUM(total) AS sales
FROM
    sales
GROUP BY 1
ORDER BY 2 DESC;
# 5.What is the gender of most of the customers? 
SELECT 
    gender, COUNT(*)
FROM
    sales
GROUP BY gender
ORDER BY 2 DESC;
# 6.What is the gender distribution per branch? 
SELECT 
    branch, gender, COUNT(*)
FROM
    sales
GROUP BY 1 , 2
ORDER BY 1 , 3 DESC;
# 7.Which time of the day do customers give most ratings? 
SELECT 
    time_of_day, SUM(rating) AS ratings
FROM
    sales
GROUP BY 1
ORDER BY 2 DESC;
# 8.Which time of the day do customers give most ratings per branch? 
SELECT 
    branch, time_of_day, COUNT(*)
FROM
    sales
GROUP BY 1 , 2
ORDER BY 1 , 3 DESC;
# 9.Which day fo the week has the best avg ratings? 
SELECT 
    day_name, ROUND(AVG(rating), 2)
FROM
    sales
GROUP BY day_name
ORDER BY 2 DESC;
# 10.Which day of the week has the best average ratings per branch? 
SELECT 
    branch, day_name, ROUND(AVG(rating), 2) AS ratings
FROM
    sales
GROUP BY 2 , 1
ORDER BY 1 , 3 DESC;