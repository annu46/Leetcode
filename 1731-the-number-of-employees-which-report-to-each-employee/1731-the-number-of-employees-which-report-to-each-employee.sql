/* Write your T-SQL query statement below */

SELECT
    m.employee_id,
    m.name,
    COUNT(e.reports_to) [reports_count],
    ROUND(AVG(e.age * 1.0), 0) [average_age]
FROM Employees e JOIN Employees m ON e.reports_to = m.employee_id
GROUP BY
    m.employee_id,
    m.name
ORDER BY m.employee_id