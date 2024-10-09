INSERT INTO person_order (id, person_id, menu_id, order_date)
	VALUES (
		(SELECT MAX(id) + 1
			FROM person_order),
		
		(SELECT pers.id
			FROM person pers
				WHERE pers.name = 'Denis'),
		
		(SELECT id
			FROM menu
				WHERE pizza_name = 'sicilian pizza'),
		'2022-02-24'
		),
		((SELECT MAX(id) + 2
			FROM person_order),
		
		(SELECT pers.id
			FROM person pers
				WHERE pers.name = 'Irina'),
		
		(SELECT id
			FROM menu
				WHERE pizza_name = 'sicilian pizza'),
		'2022-02-24'
		);
		