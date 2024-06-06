# Write your MySQL query statement below
SELECT  m.name from EMPLOYEE e
 join employee m on e.managerId = m.id
group by e.managerid
having count(e.id)>=5;