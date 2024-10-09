CREATE TABLE IF NOT EXISTS route (
	node1 varchar NOT NULL,
	node2 varchar NOT NULL,
	cost numeric NOT NULL
);

INSERT INTO route 
	VALUES
		('a', 'b', 10), ('a', 'c', 15), ('a', 'd', 20),
		('b', 'a', 10), ('b', 'c', 35), ('b', 'd', 25),
		('c', 'a', 15), ('c', 'b', 35), ('c', 'd', 30),
		('d', 'a', 20), ('d', 'b', 25), ('d', 'c', 30);

WITH RECURSIVE all_routes AS (
	-- нерекурсивная часть запроса
	-- получение маршрутов из 'a'
	SELECT 
		node1,
		node2,
		cost AS total_cost,
		node1 AS tour
		FROM route
			WHERE node1 = 'a'
	
	UNION
	-- рекурсивная часть запроса
	-- на каждой итерации:
	---- к total_cost готового маршрута добавляется стоимость маршрута;
	---- к tour прибавляется узел.
	SELECT 
		route.node1,
		route.node2,
		ready_route.total_cost + route.cost,
		concat(ready_route.tour, ',', route.node1)
		FROM
			route
		JOIN
			all_routes AS ready_route
		ON
			ready_route.node2 = route.node1
			WHERE tour NOT LIKE concat('%', route.node1, '%')
		
), suitable_tours AS (
	-- выбираем из временной таблицы данные последней итерации
	-- с путями, ведущими в 'a'
	SELECT
		total_cost,
		concat('{', tour, ',a}') AS tour
		FROM all_routes
			WHERE
				length(tour) = 7 AND
				node2 = 'a'
			
)
-- выбираем кротчайшие пути
SELECT 	total_cost,
		tour
	FROM suitable_tours
		WHERE
			total_cost = (SELECT min(total_cost) FROM suitable_tours)
ORDER BY total_cost, tour

