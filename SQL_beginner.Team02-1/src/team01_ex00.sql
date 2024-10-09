WITH 
	person_info AS (
		SELECT *
			FROM public.user
	), 
	balance_info AS (
		SELECT	user_id,
				type,
				SUM(money) AS volume,
				currency_id
			FROM balance
				GROUP BY (user_id, type, currency_id)
	), 
	currency_info AS (
		SELECT *
			FROM currency
				WHERE updated IN
								(SELECT	MAX(updated)
									FROM currency
										GROUP BY (id))
	)
SELECT
		COALESCE(person_info.name, 'not defined') AS name,
		COALESCE(person_info.lastname, 'not defined') AS lastname,
		balance_info.type,
		balance_info.volume,
		COALESCE(currency_info.name, 'not defined') AS currency_name,
		COALESCE(currency_info.rate_to_usd, 1) AS last_rate_to_usd,
		volume * COALESCE(currency_info.rate_to_usd, 1) AS total_volume_in_usd
	FROM
			person_info
		FULL JOIN
			balance_info
		ON
			person_info.id = balance_info.user_id
		FULL JOIN
			currency_info
		ON
			currency_info.id = balance_info.currency_id
	ORDER BY name DESC, lastname, type
	
