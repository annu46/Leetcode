/* Write your T-SQL query statement below */
Select Product.product_name, Sales.year, Sales.price from Sales 
Left Join Product On Sales.product_id= Product.product_id
Order by product_name asc;