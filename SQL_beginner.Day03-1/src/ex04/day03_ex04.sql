WITH
	womens_pizzerias AS (
		SELECT
				piz.name AS pizzeria_name
			FROM
					person_order pers_ord
				JOIN
					menu
				ON menu_id = menu.id
				
				JOIN
					pizzeria piz
				ON pizzeria_id = piz.id
					WHERE EXISTS
						(SELECT
							FROM person pers
								WHERE 
									pers_ord.person_id = pers.id AND
									gender = 'female')
	),
	mens_pizzerias AS (
		SELECT DISTINCT
				piz.name AS pizzeria_name
			FROM
					person_order pers_ord
				JOIN
					menu
				ON menu_id = menu.id
				
				JOIN
					pizzeria piz
				ON pizzeria_id = piz.id
					WHERE EXISTS
							(SELECT
								FROM person pers
									WHERE 
										pers_ord.person_id = pers.id AND
										gender = 'male')
	),
	only_womens_pizzerias AS (
		SELECT pizzeria_name
			FROM womens_pizzerias wom_piz
				 WHERE NOT EXISTS
					(SELECT *
						FROM mens_pizzerias men_piz
							WHERE wom_piz.pizzeria_name = men_piz.pizzeria_name)
	),
	only_mens_pizzerias AS (
		SELECT pizzeria_name
			FROM mens_pizzerias men_piz
				 WHERE NOT EXISTS
					(SELECT *
						FROM womens_pizzerias wom_piz
							WHERE men_piz.pizzeria_name = wom_piz.pizzeria_name)
	)
(SELECT pizzeria_name
	FROM only_womens_pizzerias)
UNION
(SELECT pizzeria_name
	FROM only_mens_pizzerias)
ORDER BY pizzeria_name;
