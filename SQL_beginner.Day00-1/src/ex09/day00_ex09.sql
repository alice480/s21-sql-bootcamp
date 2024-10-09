SELECT
	(SELECT per.name
		FROM person per
		WHERE per.id = pv.person_id) AS person_name,
	(SELECT piz.name
		FROM pizzeria piz
		WHERE piz.id = pv.pizzeria_id) AS pizzeria_name
FROM
	(SELECT *
		FROM person_visits
		WHERE visit_date BETWEEN '2022-01-07' AND '2022-01-09') AS pv
ORDER BY person_name, pizzeria_name DESC
