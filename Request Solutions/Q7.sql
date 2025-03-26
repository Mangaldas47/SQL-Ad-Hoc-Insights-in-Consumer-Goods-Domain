-- Get the complete report of the Gross sales amount for the customer  “Atliq Exclusive”  for each month.
-- This analysis helps to  get an idea of low and 
-- high-performing months and take strategic decisions. 
-- The final report contains these columns: 
-- Month 
-- Year 
-- Gross sales Amount

select * from fact_sales_monthly;

select * from dim_customer;

select * from fact_gross_price;

select
	monthname(s.date) as month,
    s.fiscal_year as year,
    sum(gp.gross_price * s.sold_quantity) as gross_sales_amount
from fact_sales_monthly s
join fact_gross_price gp
using (product_code)

join dim_customer c 
using(customer_code)
where c.customer = "Atliq Exclusive"
group by month, year
order by year asc