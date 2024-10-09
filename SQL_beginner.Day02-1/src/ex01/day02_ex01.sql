SELECT missing_date::date
	FROM
			generate_series('2022-01-01'::timestamp, '2022-01-10', '1 day') AS missing_date
		LEFT OUTER JOIN
			(SELECT visit_date
				FROM person_visits
					WHERE 
						person_id = 1 OR
						person_id = 2) AS person_visits
		ON person_visits.visit_date = missing_date
			WHERE person_visits.visit_date IS NULL;
