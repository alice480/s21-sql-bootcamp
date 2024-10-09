SELECT 	address,
		piz.name,
		COUNT(*) AS count_of_orders
	FROM
		person_order pers_ord
	JOIN
		person pers
	ON
		pers_ord.person_id = pers.id
	JOIN
		menu
	ON
		pers_ord.menu_id = menu.id
	JOIN
		pizzeria piz
	ON
		menu.pizzeria_id = piz.id
GROUP BY address, piz.name
ORDER BY address, piz.name;
