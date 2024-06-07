# Write your MySQL query statement below
SELECT v.customer_id, count(*) as count_no_trans from Visits v 
where v.visit_id in (select x.visit_id from Visits x except 
select t.visit_id from Transactions t)
group by v.customer_id;