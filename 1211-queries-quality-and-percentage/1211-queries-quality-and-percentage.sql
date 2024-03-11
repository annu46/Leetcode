/* Write your T-SQL query statement below */
 

select query_name, 
		round(avg((rating*1.00)/position),2) quality, 
		round(avg(case when rating<3 then 1.00 else 0.00 end)*100,2) poor_query_percentage 
from Queries
WHERE query_name is not null 
group by query_name;