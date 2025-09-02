-- REVENUE BY PRODUCT CATEGORY
SELECT product_category,
    SUM(total_amount) AS total_revenue,
    COUNT(order_id) AS total_orders
FROM online_furniture_retailer
GROUP BY product_category
ORDER BY total_revenue DESC;
-- TOP 10 BRENDS BY REVENUE
SELECT brand,
    SUM(total_amount) AS total_revenue,
    COUNT(order_id) AS total_orders
FROM online_furniture_retailer
WHERE brand IS NOT NULL
GROUP BY brand
ORDER BY total_revenue DESC
LIMIT 10;
-- PAYMENT METHOD PREFERENCES
SELECT payment_method,
    COUNT(order_id) AS total_orders,
    SUM(total_amount) AS total_revenue
FROM online_furniture_retailer
GROUP BY payment_method
ORDER BY total_orders DESC;
-- DELIVERY PERFOMANCE
SELECT delivery_status,
    COUNT(order_id) AS total_orders,
    ROUND(AVG(delivery_window_days), 2) AS avg_delivery_days
FROM online_furniture_retailer
GROUP BY delivery_status;
-- ASSEMBLY SERVICE IMPACT ON REVENUE
SELECT assembly_service_requested,
    COUNT(order_id) AS total_orders,
    SUM(total_amount) AS total_revenue,
    ROUND(AVG(total_amount), 2) AS avg_order_value
FROM online_furniture_retailer
GROUP BY assembly_service_requested;
-- CUSTOMER RATING BY CATEGORY
SELECT product_category,
    ROUND(AVG(customer_rating), 2) AS avg_rating,
    COUNT(customer_id) AS total_reviews
FROM online_furniture_retailer
WHERE customer_rating IS NOT NULL
GROUP BY product_category
ORDER BY avg_rating DESC;