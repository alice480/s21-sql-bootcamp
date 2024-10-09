WITH
	women_orders AS (
		SELECT 
				menu_id,
				name
			FROM
					person_order pers_ord
				JOIN
					(SELECT 
							pers.id, 
							pers.name
						FROM person pers
							WHERE gender = 'female') AS women
				ON women.id = pers_ord.person_id
	),
	menu AS (
		SELECT DISTINCT 
				menu_id, 
				pizza_name
			FROM
					person_order pers_ord
				JOIN
					(SELECT 
							menu.id, 
							pizza_name
						FROM menu
							WHERE pizza_name IN ('pepperoni pizza', 'cheese pizza')) AS pizzas
				ON pizzas.id = pers_ord.menu_id
	)
SELECT name
	FROM
			women_orders
		JOIN
			menu
		ON women_orders.menu_id = menu.menu_id
GROUP BY name
	HAVING COUNT(menu.menu_id) = 2
ORDER BY name;
