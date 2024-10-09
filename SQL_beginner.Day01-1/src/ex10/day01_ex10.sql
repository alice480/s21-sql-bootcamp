SELECT 
	pers.name AS person_name,
	pizza_name, 
	piz.name AS pizzeria_name
	
	FROM 
		person_order pers_order
	JOIN
		person pers
	ON pers_order.person_id = pers.id
	
	JOIN
		menu
	ON menu_id = menu.id
	
	JOIN 
		pizzeria piz
	ON pizzeria_id = piz.id

ORDER BY person_name, pizza_name, pizzeria_name
