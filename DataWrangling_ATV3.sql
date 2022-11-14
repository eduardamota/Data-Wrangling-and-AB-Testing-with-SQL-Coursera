-- Join your tables together recent_views, users, items

SELECT * 
FROM
   (
   SELECT 
   user_id,
   item_id,
   event_time,
   ROW_NUMBER ( ) OVER (PARTITION BY user_id ORDER BY event_time DESC) 
    AS view_number
  FROM 
    dsv1069.view_item_events
 ) recent_views
JOIN  
  dsv1069.users
  ON 
  users.id = recent_views.user_id