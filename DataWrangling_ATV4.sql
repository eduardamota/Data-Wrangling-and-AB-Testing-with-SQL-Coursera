-- Clean up this query outline and pull only the columns you need

SELECT 
  users.id       AS users_id,
  users.email_address,
  items.id       AS item_id,
  items.name      AS item_name,
  items.category  AS item_category
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
JOIN
  dsv1069.items
  ON
  items.id = recent_views.item_id