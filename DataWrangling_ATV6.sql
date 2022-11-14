-- Goal find how many users have reordered the same item
SELECT
 COUNT(DISTINCT user_id) AS users_who_reordered
FROM
 (
  SELECT
   user_id,
   item_id,
   COUNT(DISTINCT line_item_id) AS times_user_ordered
  FROM dsv1069.orders
  GROUP BY
   user_id,
   item_id
  ) user_level_ordered
  
WHERE times_user_ordered > 1
