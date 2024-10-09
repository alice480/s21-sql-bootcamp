WITH
	kates_visits AS (
		SELECT 	pizzeria_id,
				visit_date
			FROM
					person pers
				JOIN
					person_visits pers_vis
				ON
					pers.id = pers_vis.person_id
					WHERE pers.name = 'Kate'
	),
	kates_pizzerias AS (
		SELECT	pizzeria.id AS pizzeria_id,
				name AS pizzeria_name,
				visit_date
			FROM
					kates_visits
				JOIN
					pizzeria
				ON
					kates_visits.pizzeria_id = pizzeria.id
	)
SELECT 	pizza_name,
		price,
		pizzeria_name,
		visit_date
	FROM 
			kates_pizzerias
		JOIN
			menu
		ON
			kates_pizzerias.pizzeria_id = menu.pizzeria_id
			WHERE menu.price BETWEEN 800 AND 1000
ORDER BY pizza_name, price, pizzeria_name;
