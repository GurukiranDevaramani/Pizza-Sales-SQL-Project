-- Identify the highest-priced pizza.

SELECT 
    n.name, p.price
FROM
    pizza_types AS n
        JOIN
    pizzas AS p ON n.pizza_type_id = p.pizza_type_id
ORDER BY p.price DESC
LIMIT 1; 