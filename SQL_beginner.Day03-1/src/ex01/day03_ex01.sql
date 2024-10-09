SELECT id AS menu_id 
	FROM menu
		WHERE NOT EXISTS
			(SELECT *
				FROM person_order pers_ord
					WHERE menu.id = pers_ord.menu_id)
ORDER BY menu_id;
