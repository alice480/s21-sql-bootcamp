INSERT INTO person_order (id, person_id, menu_id, order_date)
	SELECT
		generate_series((SELECT MAX(id) + 1 FROM person_order),
						(SELECT MAX(id) FROM person_order) + (SELECT COUNT(id) FROM person)),
		generate_series((SELECT MIN(pers.id) FROM person pers),
						(SELECT MAX(pers.id) FROM person pers)),
		(SELECT menu.id
			FROM menu
				WHERE pizza_name = 'greek pizza'),
		'2022-02-25';
		