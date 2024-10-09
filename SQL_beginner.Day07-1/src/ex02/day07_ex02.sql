WITH
	orders_info AS (
		SELECT 	piz.name,
				COUNT(*) AS count,
				'order' AS action_type
			FROM
				person_order pers_ord
			JOIN
				menu
			ON
				pers_ord.menu_id = menu.id
			JOIN
				pizzeria piz
			ON
				menu.pizzeria_id = piz.id
		GROUP BY name
	),
	visits_info AS (
		SELECT	piz.name,
				COUNT(*),
				'visit' AS action_type
			FROM
				person_visits pers_vis
			JOIN
				pizzeria piz
			ON
				pers_vis.pizzeria_id = piz.id
		GROUP BY name
	)
(SELECT *
	FROM orders_info
		ORDER BY count DESC
		LIMIT 3)	
UNION
(SELECT *
	FROM visits_info
		ORDER BY count DESC
		LIMIT 3)
ORDER BY action_type, count DESC;

