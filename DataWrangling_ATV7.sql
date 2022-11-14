-- Do user order multiple things FROM the same category?
SELECT 
  item_category,
  AVG(DISTINCT times_category_ordered) AS avg_times_category_ordered
FROM
  (SELECT
    user_id,
    item_category,
    COUNT(DISTINCT line_item_id) AS times_category_ordered

  FROM dsv1069.orders
  GROUP BY 
    user_id,
    item_category
  ) orders_per_category
GROUP BY item_category
