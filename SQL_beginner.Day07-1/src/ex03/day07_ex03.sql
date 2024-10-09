WITH
	orders_info AS (
		SELECT 	piz.name
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
	),
	visits_info AS (
		SELECT	piz.name
			FROM
				person_visits pers_vis
			JOIN
				pizzeria piz
			ON
				pers_vis.pizzeria_id = piz.id
	)
SELECT 	name,
		COUNT(*) AS total_count
		FROM
			((SELECT *
				FROM
					orders_info)
			UNION ALL
			(SELECT *
				FROM
					visits_info)) AS pizzerias_info
GROUP BY name
ORDER BY total_count DESC, name;
	