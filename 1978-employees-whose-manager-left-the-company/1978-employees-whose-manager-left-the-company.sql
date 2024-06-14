# Write your MySQL query statement below
SELECT e.employee_id
FROM Employees e
WHERE e.salary < 30000 and e.manager_id not in (SELECT v.employee_id from Employees v)
order by e.employee_id;