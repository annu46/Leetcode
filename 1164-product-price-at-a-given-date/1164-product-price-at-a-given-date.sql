/* Write your T-SQL query statement below */
with base_table as (
    select *, rank() over(partition by product_id order by change_date desc) as ranking
    from products
    where change_date <= '2019-08-16'
    )

select A.product_id, isnull(new_price, 10) as price
from (select distinct product_id from products) A 
left join (select * from base_table where ranking = 1) B on A.product_id = B.product_id

