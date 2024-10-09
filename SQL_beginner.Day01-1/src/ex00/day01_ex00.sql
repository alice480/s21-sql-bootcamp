SELECT 
	pers.id AS object_id, 
	pers.name AS object_name
	FROM person pers
UNION
SELECT 
	menu.id AS object_id,	
	menu.pizza_name AS object_name
	FROM menu
ORDER BY object_id, object_name
