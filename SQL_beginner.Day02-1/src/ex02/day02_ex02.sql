SELECT
		COALESCE(pers.name, '-') AS person_name,
		pers_visits.visit_date,
		COALESCE(piz.name, '-') AS pizzeria_name
	FROM
			(SELECT *
				FROM person_visits
					WHERE visit_date BETWEEN '2022-01-01' AND '2022-01-03') AS pers_visits
		FULL OUTER JOIN
			person pers
		ON pers_visits.person_id = pers.id
		
		FULL OUTER JOIN
			pizzeria piz
		ON pers_visits.pizzeria_id = piz.id
ORDER BY person_name, visit_date, pizzeria_name;
