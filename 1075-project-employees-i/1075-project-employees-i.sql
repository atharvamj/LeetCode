# Write your MySQL query statement below
SELECT p.project_id,round(sum(e.experience_years)/count(e.employee_id),2) as average_years
FROM Project p
Join Employee e on p.employee_id = e.employee_id
group by p.project_id;