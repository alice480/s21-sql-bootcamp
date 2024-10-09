SELECT
	pers.id AS person_id,
	pers.name AS person_name,
	pers.age,
	pers.gender,
	pers.address,
	piz.id AS pizzeria_id, 
	piz.name AS pizzeria_name,
	piz.rating
	FROM person pers, pizzeria piz
ORDER BY person_id, pizzeria_id
