# Write your MySQL query statement below
with sell as (
SELECT s.product_id,s.year,s.quantity,s.price,
RANK() OVER(PARTITION BY s.product_id ORDER BY s.year) as sellrank
FROM Sales s)
SELECT s.product_id,s.year as first_year ,s.quantity,s.price
FROM sell s
WHERE sellrank = 1 ;