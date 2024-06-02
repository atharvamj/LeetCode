# Write your MySQL query statement below
with ctename as (
    SELECT CHAR_LENGTH(T.CONTENT) AS COUNTL,T.tweet_id FROM Tweets T
)
SELECT T.tweet_iD FROM ctename T WHERE T.COUNTL > 15;