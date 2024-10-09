WITH 
	all_dates AS (
		SELECT dates::date AS missing_date
			FROM generate_series('2022-01-01'::timestamp, '2022-01-10', '1 day') AS dates
	),
	person_visits AS (
		SELECT visit_date
			FROM person_visits
				WHERE
					person_id = 1 OR
					person_id = 2
	)
SELECT missing_date
	FROM
			all_dates
		LEFT OUTER JOIN
			person_visits
		ON person_visits.visit_date = all_dates.missing_date
			
			WHERE visit_date IS NULL;
