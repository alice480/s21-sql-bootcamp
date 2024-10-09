WITH person_discount AS (
	SELECT 	person_id, 
			pizzeria_id,
			CASE
				WHEN COUNT(pizzeria_id) = 1 THEN 10.5
				WHEN COUNT(pizzeria_id) = 2 THEN 22
				ELSE 30
			END discount
				FROM
						person_order pers_ord
					JOIN 
						menu
					ON 
						pers_ord.menu_id = menu.id
					JOIN
						pizzeria piz
					ON
						pizzeria_id = piz.id
				GROUP BY person_id, pizzeria_id
				ORDER BY person_id
)
INSERT INTO person_discounts (id, person_id, pizzeria_id, discount)
	SELECT 	ROW_NUMBER( ) OVER ( ) AS id,
			pers_disc.person_id,
			pers_disc.pizzeria_id,
			pers_disc.discount
	FROM person_discount pers_disc;
		