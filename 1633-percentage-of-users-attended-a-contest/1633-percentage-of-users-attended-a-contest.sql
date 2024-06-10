# Write your MySQL query statement below
# Write your MySQL query statement below
WITH userscnt AS (
    SELECT contest_id, COUNT(user_id) AS cnt
    FROM Register
    GROUP BY contest_id
),
total_users AS (
    SELECT COUNT(user_id) AS total_cnt
    FROM Users
)
SELECT 
    r.contest_id, 
    round((r.cnt / t.total_cnt) * 100,2) AS percentage
FROM 
    userscnt r
CROSS JOIN 
    total_users t
ORDER BY 
    percentage DESC,r.contest_id;

