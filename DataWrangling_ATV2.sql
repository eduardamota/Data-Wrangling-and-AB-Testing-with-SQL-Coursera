SELECT 
 user_id,
 item_id,
 event_time,
 ROW_NUMBER ( ) OVER (PARTITION BY user_id ORDER BY event_time DESC) 
  AS view_number
-- RANK ( ) OVER (PARTITION BY user_id ORDER BY event_time DESC)
--  AS rank,
-- DENSE_RANK ( ) OVER (PARTITION BY user_id ORDER BY event_time DESC) 
--  AS dense_rank
 
FROM 
  dsv1069.view_item_events