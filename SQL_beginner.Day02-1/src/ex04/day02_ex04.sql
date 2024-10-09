WITH 
	pizza_data AS (
		SELECT *
			FROM menu
				WHERE
					pizza_name = 'mushroom pizza' OR
					pizza_name = 'pepperoni pizza'
	)
SELECT
		pizza_name, 
		pizzeria.name AS pizzeria_name, 
		price
	FROM
			pizza_data
		JOIN
			pizzeria
		ON pizza_data.pizzeria_id = pizzeria.id
ORDER BY pizza_name, pizzeria_name;
