# Write your MySQL query statement below
with managers as(
    SELECT employee_id,name,age
    FROM Employees
    WHERE  employee_id in (SELECT reports_to from Employees)
)
SELECT m.employee_id,m.name,count(e.reports_to) as reports_count, round(sum(e.age)/count(e.reports_to),0) as average_age
FROM managers m
Join Employees e on m.employee_id = e.reports_to
group by m.employee_id
order by m.employee_id ASC;