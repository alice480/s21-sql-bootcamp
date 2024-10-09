SELECT
		piz.name,
		piz.rating
	FROM
			pizzeria piz
		LEFT OUTER JOIN
			person_visits pers_visits
		ON piz.id = pers_visits.pizzeria_id
			WHERE pers_visits.visit_date IS NULL;
