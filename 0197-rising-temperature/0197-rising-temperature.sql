/* Write your T-SQL query statement below */
SELECT A.id
FROM Weather AS A
INNER JOIN Weather AS B ON DATEADD(DAY, 1, B.recordDate) = A.recordDate
	AND A.Temperature > B.Temperature