SELECT	name,
		count_of_visits
	FROM
		(SELECT 	pers.name,
				COUNT(*) AS count_of_visits
			FROM
				person pers
			JOIN
				person_visits pers_vis
			ON
				pers.id = pers_vis.person_id
			GROUP BY name) AS person_visits_info
		WHERE count_of_visits > 3;
