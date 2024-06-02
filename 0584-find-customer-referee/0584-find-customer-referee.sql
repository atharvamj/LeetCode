# Write your MySQL query statement below
WITH cte_name  AS (
SELECT c1.name,c1.id FROM Customer c1 EXCEPT SELECT c.name,c.id FROM Customer c where c.referee_id = 2 
    
) 
SELECT name FROM cte_name;