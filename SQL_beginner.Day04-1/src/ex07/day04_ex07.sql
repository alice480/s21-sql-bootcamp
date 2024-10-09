INSERT INTO person_visits (id, person_id, pizzeria_id, visit_date)
	SELECT
		(SELECT MAX(id)
			FROM person_visits) + 1,
		
		(SELECT id
			FROM person pers
				WHERE pers.name = 'Dmitriy'),
		
		((SELECT pizzeria_id
			FROM menu
				WHERE price < 800)
		EXCEPT
		(SELECT id
			FROM pizzeria
				WHERE pizzeria.name = 'Papa Johns') 
		LIMIT 1),
		
		'2022-01-08';

REFRESH MATERIALIZED VIEW mv_dmitriy_visits_and_eats;
	