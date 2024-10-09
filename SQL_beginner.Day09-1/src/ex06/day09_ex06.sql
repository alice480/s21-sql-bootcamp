CREATE OR REPLACE FUNCTION fnc_person_visits_and_eats_on_date(	pperson in varchar 	default 'Dmitriy', 
																pprice 	in numeric 	default 500,
												 				pdate 	in date 	default '2022-01-08')
	RETURNS TABLE(pizzeria varchar)
		AS $$
		BEGIN
			RETURN QUERY
				SELECT DISTINCT
					piz.name AS pizzeria
					FROM
						pizzeria piz, menu, person_visits pers_vis, person pers
							WHERE
								piz.id = menu.pizzeria_id 
							AND
								pers_vis.pizzeria_id = menu.pizzeria_id
							AND
								pers_vis.person_id = pers.id 
							AND
								pers.name = pperson
							AND
								price < pprice 
							AND
								visit_date = pdate;
		END;
		$$ LANGUAGE plpgsql;

-- operators to check
SELECT *
	FROM fnc_person_visits_and_eats_on_date(pprice := 800);

SELECT *
	FROM fnc_person_visits_and_eats_on_date(pperson := 'Anna',pprice := 1300,pdate := '2022-01-01');
