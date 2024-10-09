CREATE OR REPLACE FUNCTION fnc_fibonacci(pstop integer default 10)
	RETURNS TABLE(fibonacci integer)
	AS
	$$
		WITH RECURSIVE r AS (
			SELECT
				0 AS a,
				1 AS b
			
			UNION ALL
			
			SELECT
				greatest(a, b) AS b,
				a + b AS a
				FROM r
					WHERE b < pstop
		)
		SELECT a AS fibonacci
			FROM r
	$$ LANGUAGE SQL;
	
-- operators to check
SELECT * 
	FROM fnc_fibonacci(100);

SELECT * 
	FROM fnc_fibonacci();
