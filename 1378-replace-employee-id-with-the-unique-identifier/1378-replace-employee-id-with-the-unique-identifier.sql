# Write your MySQL query statement below
SELECT e.unique_id , em.name
FROM  Employees em
Left Join EmployeeUNI e on  e.id = em.id;