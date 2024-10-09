WITH
	person_count_of_visits AS (
		SELECT 	person_id,
				COUNT(pizzeria_id) AS count_of_visits
			FROM person_visits
				GROUP BY person_id
	)
SELECT	pers.name,
		pers_count_vis.count_of_visits
	FROM
		person_count_of_visits pers_count_vis
	JOIN
		person pers 
	ON
		pers.id = pers_count_vis.person_id
ORDER BY count_of_visits DESC, name
LIMIT 4;
