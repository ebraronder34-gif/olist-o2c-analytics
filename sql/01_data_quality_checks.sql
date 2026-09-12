-- Olist O2C Analytics
-- Data Quality Checks

-- Check for missing delivery dates.
-- Some missing dates were stored as empty strings instead of NULL values.

SELECT
    COUNT(*) AS blank_delivery_dates
FROM olist_orders_dataset
WHERE order_delivered_customer_date IS NULL
   OR TRIM(order_delivered_customer_date) = '';
