INSERT INTO person_visits (id, person_id, pizzeria_id, visit_date)
	VALUES (
		(SELECT MAX(id) + 1
			FROM person_visits),
		
		(SELECT pers.id
			FROM person pers
				WHERE pers.name = 'Denis'),
		
		(SELECT piz.id
			FROM pizzeria piz
				WHERE piz.name = 'Dominos'),
		'2022-02-24'
		),
		((SELECT MAX(id) + 2
			FROM person_visits),
		
		(SELECT pers.id
			FROM person pers
				WHERE pers.name = 'Irina'),
		
		(SELECT piz.id
			FROM pizzeria piz
				WHERE piz.name = 'Dominos'),
		'2022-02-24'
		);
	