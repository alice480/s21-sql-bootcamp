SELECT piz.name
	FROM pizzeria piz
		WHERE piz.id NOT IN
			(SELECT pizzeria_id
				FROM person_visits);

SELECT piz.name
	FROM pizzeria piz
		WHERE NOT EXISTS
			(SELECT
				FROM person_visits pers_vis
					WHERE pers_vis.pizzeria_id = piz.id)
					