DROP FUNCTION IF EXISTS fnc_persons_female;
DROP FUNCTION IF EXISTS fnc_persons_male;

-- functions from exercise 04 with generic approach
CREATE OR REPLACE FUNCTION fnc_persons(pgender in varchar DEFAULT 'female')
	RETURNS TABLE (
		id bigint,
		name varchar,
  		age integer,
		gender varchar,
 		address varchar
	)
	AS $$
		SELECT *
			FROM person
				WHERE gender = pgender;
	$$ LANGUAGE SQL;

-- returns female persons
CREATE OR REPLACE FUNCTION fnc_persons_female()
	RETURNS TABLE (
		id bigint,
		name varchar,
  		age integer,
		gender varchar,
 		address varchar
	) 
	AS $$
		SELECT *
			FROM person
				WHERE gender = 'female';
	$$ LANGUAGE SQL;
	
	-- returns male persons
CREATE OR REPLACE FUNCTION fnc_persons_male()
	RETURNS TABLE (
		id bigint,
		name varchar,
  		age integer,
		gender varchar,
 		address varchar
	) 
	AS $$
		SELECT *
			FROM person
				WHERE gender = 'male'; 
	$$ LANGUAGE SQL;

-- operators to check
SELECT *
	FROM fnc_persons(pgender := 'male');

SELECT *
	FROM fnc_persons();
