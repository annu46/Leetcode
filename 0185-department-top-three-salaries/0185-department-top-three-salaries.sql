/* Write your T-SQL query statement below */
with base_table as 
    (
        select b.name as Department,
               a.name as Employee,
               a.salary as Salary,
               dense_rank() over (partition by b.name order by a.salary DESC) as ranking
        from employee a join department b on a.departmentid = b.id
    )
select Department, Employee, Salary
from base_table
where ranking in (1,2,3);