WITH
	pizzerias_orders_info AS (
		SELECT 	piz.name,
				price
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
	)
SELECT 	name,
		COUNT(*) AS count_of_orders,
		round(AVG(price), 2) AS average_price,
		MAX(price) AS max_price,
		MIN(price) AS min_price
	FROM pizzerias_orders_info
GROUP BY name
ORDER BY name;
