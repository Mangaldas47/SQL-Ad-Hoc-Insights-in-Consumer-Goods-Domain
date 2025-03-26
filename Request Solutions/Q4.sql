-- Follow-up: Which segment had the most increase in unique products in 
-- 2021 vs 2020? The final output contains these fields, 
-- segment 
-- product_count_2020 
-- product_count_2021 
-- difference 

create temporary table a 
	select 
		p.segment as segment,
        count(distinct s.product_code) as product_count_2020
	from fact_sales_monthly s
    join dim_product p
    on p.product_code = s.product_code
    where fiscal_year=2020
    group by segment;
    
create temporary table b
	select 
		p.segment as segment,
        count(distinct s.product_code) as product_count_2021
	from fact_sales_monthly s
    join dim_product p
    on p.product_code = s.product_code
    where fiscal_year=2021
    group by segment;
    
select
	a.segment,
    a.product_count_2020,
    b.product_count_2021,
    (b.product_count_2021-a.product_count_2020) as difference
from a
join b
using(segment)