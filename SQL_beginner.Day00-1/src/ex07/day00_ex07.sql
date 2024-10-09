SELECT id, name,
	CASE
		WHEN (10 <= age AND age <= 20) THEN 'interval #1'
		WHEN (20 < age AND age < 24) THEN 'interval #2'
		ELSE 'interval #3'
	END interval_info
FROM person
ORDER BY interval_info