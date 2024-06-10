# Write your MySQL query statement below

with query_cnt as (
SELECT q.query_name, round(sum(q.rating/q.position)/count(q.query_name),2) as quality , count(q.query_name) as cnt
FROM Queries q
Group by q.query_name
)
SELECT q.query_name,q.quality,round(sum(r.rating<3)*100/q.cnt,2) as poor_query_percentage
FROM query_cnt q
Join Queries r on  q.query_name = r.query_name
Group by q.query_name
;
-- note to self : count cannot count all the true and false flags; whereas we can sum them in this cases