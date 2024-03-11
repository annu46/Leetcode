/* Write your T-SQL query statement below */

SELECT *
FROM Users
WHERE mail LIKE '[A-Za-z]%@leetcode.com'
    AND PATINDEX('%[^A-Za-z0-9\-\_\.\-]%@leetcode.com', mail) = 0;