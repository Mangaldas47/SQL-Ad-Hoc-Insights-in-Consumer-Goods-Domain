-- Which channel helped to bring more gross sales in the fiscal year 2021 
-- and the percentage of contribution?  The final output  contains these fields, 
-- channel 
-- gross_sales_mln 
-- percentage

select * from fact_sales_monthly;

select * from dim_customer;

select * from fact_gross_price;

with cte1 as (
select 
	c.channel,
    round(sum(gp.gross_price * s.sold_quantity)/1000000,2) as gross_sales_mln
from fact_sales_monthly s
join dim_customer c
using (customer_code)

join fact_gross_price gp
using (product_code)
where s.fiscal_year = 2021
group by c.channel
)
select 
	*,
    round(gross_sales_mln*100/sum(gross_sales_mln) over(),2) as pct_of_contribution
from cte1