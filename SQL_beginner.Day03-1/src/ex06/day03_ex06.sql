WITH
	pizzas AS (
		SELECT
				pizza_name,
				price,
				piz.id AS pizzeria_id,
				piz.name AS pizzeria_name
			FROM
					menu
				JOIN
					pizzeria piz
				ON
					menu.pizzeria_id = piz.id
	)
SELECT 	piz1.pizza_name,
		piz1.pizzeria_name AS pizzeria_name_1,
		piz2.pizzeria_name AS pizzeria_name_2,
		piz1.price
	FROM
		pizzas piz1, pizzas piz2
		WHERE
			piz1.pizza_name = piz2.pizza_name AND
			piz1.price = piz2.price AND
			piz1.pizzeria_name <> piz2.pizzeria_name AND
			piz1.pizzeria_id > piz2.pizzeria_id
ORDER BY pizza_name;
