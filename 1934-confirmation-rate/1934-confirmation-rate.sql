/* Write your T-SQL query statement below */

with CTE as
(
select s.user_id, c.action from signups s left join confirmations c
On s.user_id = c.user_id
),

all_users as
(
    select user_id, count(user_id) as cnt_all
    from cte
    group by user_id
),
conf as
(
    select user_id, count(user_id) as cnt_cnf
    from cte
    where action = 'confirmed'
    group by user_id
)
select a1.user_id, round(cast(coalesce(cnt_cnf,0) as decimal)/cnt_all,2) as confirmation_rate
from all_users a1 left join conf c1
on a1.user_id = c1.user_id
