-- Determine the top 3 most ordered pizza types based on revenue for each pizza category.
select category,name,revenue,rn from
(select name,revenue,category,
rank() over(partition by category order by revenue desc) as rn
from
(select pizza_types.category,pizza_types.name,sum(order_details.quantity*pizzas.price) as revenue
from pizzas
join order_details
on pizzas.pizza_id = order_details.pizza_id
join pizza_types
on pizza_types.pizza_type_id = pizzas.pizza_type_id
group by pizza_types.name,pizza_types.category) as a)as b
where rn<=3;