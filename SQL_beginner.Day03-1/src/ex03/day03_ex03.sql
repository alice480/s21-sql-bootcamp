WITH
	persons_visits AS (
		SELECT
				pers.gender,
				piz.name AS pizzeria_name
			FROM 
				person_visits pers_vis, 
				person pers, 
				pizzeria piz
				WHERE 	
					pers_vis.pizzeria_id = piz.id AND
					pers_vis.person_id = pers.id
	),
	womens_visits AS (
		SELECT pizzeria_name
			FROM persons_visits
				WHERE gender = 'female'
	),
	mens_visits AS (
		SELECT pizzeria_name
			FROM persons_visits
				WHERE gender = 'male'
	),
	only_womens_visits AS (
		(SELECT pizzeria_name
			FROM womens_visits)
		EXCEPT ALL
		(SELECT pizzeria_name
			FROM mens_visits)
	),
	only_mens_visits AS (
		(SELECT pizzeria_name
			FROM mens_visits)
		EXCEPT ALL
		(SELECT pizzeria_name
			FROM womens_visits)
	)
(SELECT pizzeria_name
	FROM only_womens_visits)
UNION ALL
(SELECT pizzeria_name
	FROM only_mens_visits)
ORDER BY pizzeria_name;
