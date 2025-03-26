--  Generate a report which contains the top 5 customers who received an 
--  average high  pre_invoice_discount_pct  for the  fiscal  year 2021  and in the 
-- Indian  market. The final output contains these fields, 
-- customer_code 
-- customer 
-- average_discount_percentage

select * from dim_customer;

select * from fact_pre_invoice_deductions;

select 
	c.customer_code,
    c.customer,
    round(avg(pi.pre_invoice_discount_pct),4) as average_discount_pct
from dim_customer c
join fact_pre_invoice_deductions pi
using(customer_code)
where fiscal_year = 2021 and market = "India"
group by c.customer
order by average_discount_pct desc
limit 5