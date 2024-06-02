# Write your MySQL query statement below


SELECT t.teacher_id,count(distinct t.subject_id) as cnt
FROM Teacher t
GROUP BY t.teacher_id;
