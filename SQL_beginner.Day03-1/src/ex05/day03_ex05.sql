WITH
	andreys_orders AS (
		SELECT piz.name AS pizzeria_name
			FROM
					person_order pers_ord
				JOIN
					menu
				ON pers_ord.menu_id = menu.id
		
				JOIN
					pizzeria piz
				ON	pizzeria_id = piz.id

					WHERE EXISTS
						(SELECT
							FROM person pers
								WHERE 
									pers.id = pers_ord.person_id AND
									pers.name = 'Andrey')
	),
	andreys_visits AS (
		SELECT piz.name AS pizzeria_name
			FROM
					person_visits pers_vis
				JOIN
					pizzeria piz
				ON
					pers_vis.pizzeria_id = piz.id
		
				WHERE EXISTS
						(SELECT
							FROM person pers
								WHERE 
									pers.id = pers_vis.person_id AND
									pers.name = 'Andrey')
	)
SELECT pizzeria_name
	FROM andreys_visits
		EXCEPT
			(SELECT pizzeria_name
				FROM andreys_orders)
ORDER BY pizzeria_name;
