(SELECT 
	 pers.name AS object_name
	FROM person pers
ORDER BY object_name)

UNION ALL

(SELECT
	 menu.pizza_name AS object_name
	FROM menu
ORDER BY object_name)
