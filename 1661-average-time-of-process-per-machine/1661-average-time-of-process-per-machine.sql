WITH start_cte AS (
    SELECT machine_id, timestamp AS stime, process_id
    FROM Activity 
    WHERE activity_type = 'start'
),
end_cte AS (
    SELECT machine_id, timestamp AS etime, process_id
    FROM Activity 
    WHERE activity_type = 'end'
),
final_cte AS (
    SELECT st.machine_id, (et.etime - st.stime) AS processing_time, st.process_id
    FROM start_cte st
    JOIN end_cte et ON st.machine_id = et.machine_id AND st.process_id = et.process_id
),
processing_summary AS (
    SELECT 
        machine_id, 
        SUM(processing_time) AS total_processing_time,
        COUNT(process_id) AS process_count
    FROM final_cte
    GROUP BY machine_id
)
SELECT 
    machine_id, 
    ROUND(total_processing_time / process_count, 3) AS processing_time
FROM processing_summary
ORDER BY machine_id;
