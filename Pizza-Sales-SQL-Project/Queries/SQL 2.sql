-- Calculate the total revenue generated from pizza sales.

SELECT 
    ROUND(SUM(o.order_id * p.price), 02) AS totoal_sales
FROM
    order_details AS o
        JOIN
    pizzas AS p ON o.pizza_id = p.pizza_id;