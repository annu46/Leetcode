/* Write your T-SQL query statement below */
with cte1 as (
    select requester_id as id, count(accepter_id) as num
    from RequestAccepted
    group by requester_id
    union all
    select accepter_id as id, count(requester_id) as num
    from RequestAccepted
    group by accepter_id
)

select top 1 id, sum(num) as num 
from cte1
group by id
order by num desc