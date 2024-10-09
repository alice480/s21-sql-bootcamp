SELECT
	action_date, 
	name AS person_name
	FROM person pers,
	
	(SELECT 
	 	order_date AS action_date, 
	 	person_id AS person_id
		FROM person_order

	INTERSECT

	SELECT
	 	visit_date AS action_date,
	 	person_id AS person_id
		FROM person_visits) AS pers_data
		
WHERE pers_data.person_id = pers.id
ORDER BY action_date, person_name DESC
