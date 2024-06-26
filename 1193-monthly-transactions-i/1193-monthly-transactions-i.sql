
# Write your MySQL query statement below
WITH data_1 AS (
    SELECT 
        DATE_FORMAT(t.trans_date, '%Y-%m') AS month,
        t.country,
        COUNT(t.state) AS trans_count,
        SUM(t.state = 'approved') AS approved_count,
        SUM(t.amount) AS trans_total_amount,
        SUM(CASE WHEN t.state = 'approved' THEN t.amount ELSE 0 END) AS approved_total_amount
    FROM 
        Transactions t
    GROUP BY 
        month, t.country
)
SELECT *
FROM data_1;
