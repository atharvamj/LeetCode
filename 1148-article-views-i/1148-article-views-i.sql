# Write your MySQL query statement below
SELECT DISTINCT v.author_id as id FROM Views v where  v.author_id =  viewer_id order by v.author_id;