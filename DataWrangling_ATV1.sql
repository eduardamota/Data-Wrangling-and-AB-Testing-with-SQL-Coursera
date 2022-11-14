-- Quero verificar se os pedidos estão dentro da data atual e os 7 dias anteriores

SELECT *
FROM
  dsv1069.dates_rollup
LEFT OUTER JOIN
  (
  SELECT 
    DATE(paid_at)                 AS day,
    COUNT(DISTINCT(invoice_id))   AS orders,
    COUNT(DISTINCT(line_item_id)) AS items_ordered
  FROM dsv1069.orders
  GROUP BY  DATE(paid_at)
  ) daily_orders
  ON
  daily_orders.day <= dates_rollup.date
  AND daily_orders.day > dates_rollup.d7_ago
