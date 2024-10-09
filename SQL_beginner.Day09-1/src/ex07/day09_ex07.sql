CREATE OR REPLACE FUNCTION func_minimum(VARIADIC arr numeric[])
	RETURNS numeric
	AS
	$$
		SELECT min(arr[i])
			FROM generate_subscripts(arr, 1) AS i;
	$$ LANGUAGE SQL;

-- operator to check
SELECT func_minimum(VARIADIC arr => ARRAY[10.0, -1.0, 5.0, 4.4]);
