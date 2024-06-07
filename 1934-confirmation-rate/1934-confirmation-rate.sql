WITH count_conf AS (
    SELECT s.user_id AS user_id, COUNT(c.action) AS act_cnt
    FROM Signups s
    JOIN Confirmations c ON s.user_id = c.user_id
    WHERE c.action = 'confirmed' 
    GROUP BY s.user_id
),
count_tot AS (
    SELECT s.user_id AS user_id, COUNT(c.user_id) AS Full_cnt
    FROM Signups s
    LEFT JOIN Confirmations c ON s.user_id = c.user_id
    GROUP BY s.user_id
)

SELECT 
    ct.user_id, 
    CASE 
        WHEN COALESCE(ct.Full_cnt, 0) = 0 THEN 0 
        ELSE round(COALESCE(cc.act_cnt, 0) * 1.0 / COALESCE(ct.Full_cnt, 0),2)
    END AS confirmation_rate
FROM count_tot ct
LEFT JOIN count_conf cc ON ct.user_id = cc.user_id
ORDER BY ct.user_id;

