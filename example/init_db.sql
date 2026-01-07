CREATE VIEW test AS
SELECT

o.user_id,

u.email,

COALESCE(SUM(o.amount), 0) AS total_spent,

CURRENT_DATE - MAX(o.order_date) AS days_since_last_order,

CASE

WHEN CURRENT_DATE - MAX(o.order_date) > 180 THEN 'Churned'

WHEN CURRENT_DATE - MAX(o.order_date) < 180 AND SUM(amount) > 10000 THEN 'VIP'

WHEN CURRENT_DATE - MAX(o.order_date) < 180 AND SUM(amount) < 10000 THEN 'Active'

END AS segment

FROM

Users as u

LEFT JOIN Orders as o ON u.id = o.user_id

GROUP BY o.user_id, u.email