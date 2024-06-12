# Write your MySQL query statement below
with nume as (
SELECT num
FROM MyNumbers
group by num
having count(*) = 1)
SELECT n.num
FROM nume n
right join MyNumbers m on m.num = n.num 
Order By num desc
Limit 1;