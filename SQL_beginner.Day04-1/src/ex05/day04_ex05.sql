CREATE VIEW v_price_with_discount AS
	SELECT 	pers.name, 
			menu.pizza_name, 
			menu.price,
			round(menu.price * 0.9) AS discount_price
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
	ORDER BY name, pizza_name
