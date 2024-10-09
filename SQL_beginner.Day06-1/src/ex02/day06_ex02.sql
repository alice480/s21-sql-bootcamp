SELECT	pers.name,
		pizza_name,
		price,
		round((1 - discount / 100) * price) AS discount_price,
		piz.name AS pizzeria_name
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
		JOIN
			person_discounts pers_disc
		ON
			pers_ord.person_id = pers_disc.person_id AND
			menu.pizzeria_id = pers_disc.pizzeria_id
	ORDER BY name, pizza_name;
