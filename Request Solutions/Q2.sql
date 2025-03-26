--  What is the percentage of unique product increase in 2021 vs. 2020? The final output contains these fields, 
-- unique_products_2020 
-- unique_products_2021 
-- percentage_chg 

select count(distinct(product_code)) as unique_products_2020 from fact_sales_monthly where fiscal_year=2020;

select count(distinct(product_code)) as unique_products_2021 from fact_sales_monthly where fiscal_year=2021;

select a.x as unique_products_2020, b.y as unique_products_2021, ((b.y-a.x)/a.x *100) as percentage_chg 
from
	(
		(select count(distinct(product_code)) as x from fact_sales_monthly where fiscal_year=2020) a,
		(select count(distinct(product_code)) as y from fact_sales_monthly where fiscal_year=2021) b
	)