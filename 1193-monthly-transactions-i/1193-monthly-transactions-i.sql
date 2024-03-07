/* Write your T-SQL query statement below */
with base_table as (
select *, cast(year(trans_date) as varchar) + '-' + right('0' + cast(month(trans_date) as varchar),2) as month
from transactions ) 


select month, country, count(*) as trans_count, 
                       sum(case when state = 'approved' then 1 else 0 end) as approved_count,
                       sum(amount) as trans_total_amount,
                       sum(case when state = 'approved' then 1*amount  else 0 end) as approved_total_amount 
from base_table
group by month, country