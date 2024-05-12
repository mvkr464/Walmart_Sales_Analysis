# Feature Engineering
# 1. adding column time_of_day based on time i.e morning, afternoon, evening.
Alter table sales add column time_of_day varchar(20);
update sales set time_of_day = ( case when 'time' between '00:00:00' and '12:00:00' then 'morning'
											when 'time' between '12:01:00' and  '16:00:00' then 'afternoon'
                                            else 'evening' end) ;
# 2. adding column day_name in a week i.e mon, tue,wed etc.,
Alter table sales add column day_name varchar(25);
update sales set day_name = (dayname(date));
# 3. adding a column month_name from the date column.
Alter table sales add column month_name varchar(25);
update sales set month_name = (monthname(date));
# Generic Question
# 1.How many unique cities does the data have? 
select distinct city from sales;
# 2.In which city is each branch? 
select distinct city, branch from sales;