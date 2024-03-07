/* Write your T-SQL query statement below */
select round(sum(case when dateadd(day,1,a.event_date) = b.event_date THEN 1 ELSE 0 END)*1.00/COUNT(DISTINCT a.player_id), 2) as fraction 
from (select player_id, min(event_date) as event_date
      from activity 
      group by player_id) as a join activity as b 
on a.player_id = b.player_id