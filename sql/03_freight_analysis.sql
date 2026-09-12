-- Olist O2C Analytics
-- Freight Analysis by Customer State

-- Step 1:
-- Aggregate freight from item level to order level.

WITH order_freight AS (
    SELECT
        order_id,
        SUM(freight_value) AS freight_per_order
    FROM olist_order_items_dataset
    GROUP BY order_id
)

-- Step 2:
-- Compare average freight per order by customer state.

SELECT
    c.customer_state,
    COUNT(*) AS total_orders,
    ROUND(AVG(ofr.freight_per_order), 2) AS avg_freight_per_order
FROM order_freight ofr
JOIN olist_orders_dataset o
    ON ofr.order_id = o.order_id
JOIN olist_customers_dataset c
    ON o.customer_id = c.customer_id
GROUP BY c.customer_state
ORDER BY avg_freight_per_order DESC;

-- Business insight:
-- RR has the highest overall average freight per order.
-- PB becomes the highest-cost state when applying a minimum order-volume threshold.
