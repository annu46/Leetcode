/* Write your T-SQL query statement below */
with cte as (
    select id, num, lead(num, 1) over(order by id) as leading,
                    lag(num, 1) over(order by id) as lagging
    from logs
)

select distinct num as consecutivenums
from cte
where num = leading and num = lagging