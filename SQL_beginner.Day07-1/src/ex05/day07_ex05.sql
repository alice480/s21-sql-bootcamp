SELECT DISTINCT name
	FROM 
		person_order pers_ord
	JOIN
		person pers
	ON
		pers_ord.person_id = pers.id
ORDER BY name;