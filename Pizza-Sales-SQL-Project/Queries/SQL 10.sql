-- Calculate the percentage contribution of each pizza type to total revenue.
 
SELECT 
    pizza_types.category,
    round(SUM(order_details.quantity * pizzas.price) /(SELECT 
    SUM(o.quantity * p.price) AS totoal_sales
FROM
    order_details AS o
        JOIN
    pizzas AS p ON o.pizza_id = p.pizza_id)*100 , 02) as percentage 
FROM
    pizza_types
        JOIN
    pizzas ON pizza_types.pizza_type_id = pizzas.pizza_type_id
        JOIN
    order_details ON order_details.pizza_id = pizzas.pizza_id
GROUP BY pizza_types.category
ORDER BY percentage desc;
