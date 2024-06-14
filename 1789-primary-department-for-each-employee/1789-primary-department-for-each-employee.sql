# Write your MySQL query statement below
SELECT q.employee_id,q.department_id
FROM
(SELECT e.employee_id, e.department_id 
FROM Employee e
WHERE e.primary_flag = 'Y'
union
SELECT e.employee_id, e.department_id 
FROM Employee e
group by e.employee_id
having count(e.department_id) =1) as q
ORDER BY q.employee_id;