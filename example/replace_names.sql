CREATE OR REPLACE VIEW tem AS
SELECT
email AS "Client email",
total_spent AS "Client total spents",
days_since_last_order AS "Days from the last order",
segment AS "Category"
FROM test