CREATE MATERIALIZED VIEW mv_dmitriy_visits_and_eats AS
	WITH 
		dmitriy_visits AS (
			SELECT pizzeria_id
				FROM person_visits
					WHERE
						visit_date = '2022-01-08' AND
						person_id IN
							(SELECT pers.id
								FROM person pers
									WHERE name = 'Dmitriy')
		),
		pizzeria_list AS (
			SELECT pizzeria_id
				FROM 
						menu
					NATURAL JOIN
						dmitriy_visits
						WHERE
							menu.price < 800
		)
	SELECT name AS pizzeria_name
		FROM
				pizzeria_list
			JOIN
				pizzeria
			ON pizzeria_list.pizzeria_id = pizzeria.id;
