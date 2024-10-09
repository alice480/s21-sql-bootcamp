-- disables the query planner's use of sequential scan plan types
SET enable_seqscan = OFF;

EXPLAIN ANALYZE
	SELECT 	menu.pizza_name, 
			piz.name AS pizzeria_name
		FROM
			menu
		JOIN
			pizzeria piz
		ON menu.pizzeria_id = piz.id;
	