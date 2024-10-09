SELECT 
	order_date, 
	CONCAT(pers.name, ' (age:', pers.age, ')') AS person_information
	
	FROM 
		person pers
		JOIN
		person_order
		ON person_order.person_id = pers.id
	
ORDER BY order_date, person_information
