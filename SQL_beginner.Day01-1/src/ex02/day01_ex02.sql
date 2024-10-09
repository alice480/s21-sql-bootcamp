SELECT 
	menu.pizza_name AS pizza_name
	FROM menu

UNION

SELECT 
	menu.pizza_name AS pizza_name
	FROM menu

ORDER BY pizza_name DESC
