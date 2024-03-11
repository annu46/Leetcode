/* Write your T-SQL query statement below */

SELECT A.SELL_DATE
		, COUNT(DISTINCT A.PRODUCT) AS NUM_SOLD
		, STUFF((
                SELECT DISTINCT ',' + B.PRODUCT
                FROM ACTIVITIES B 
                WHERE A.SELL_DATE = B.SELL_DATE
                FOR XML PATH('')),1,1,'')
                AS PRODUCTS
FROM ACTIVITIES A
GROUP BY SELL_DATE