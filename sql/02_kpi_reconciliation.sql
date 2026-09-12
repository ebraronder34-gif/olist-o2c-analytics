- Olist O2C Analytics
-- KPI Reconciliation

-- Validate core Power BI KPIs against SQL.

SELECT
    ROUND(SUM(price), 2) AS total_revenue,
    ROUND(AVG(price), 2) AS avg_item_price,
    ROUND(MIN(price), 2) AS min_item_price,
    ROUND(MAX(price), 2) AS max_item_price,
    ROUND(SUM(freight_value), 2) AS total_freight,
    ROUND(AVG(freight_value), 2) AS avg_freight_per_item
FROM olist_order_items_dataset;

-- Expected validation:
-- Total Revenue ≈ 13.59M
-- Average Freight per Item ≈ 19.99
