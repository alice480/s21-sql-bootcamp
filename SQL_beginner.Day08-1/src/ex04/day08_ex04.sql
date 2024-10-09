-- session #1
BEGIN TRANSACTION ISOLATION LEVEL SERIALIZABLE;
-- session #2
BEGIN TRANSACTION ISOLATION LEVEL SERIALIZABLE;

-- session #1
SELECT *
	FROM pizzeria
		WHERE name = 'Pizza Hut';

-- session #2
UPDATE pizzeria
	SET rating = 3
		WHERE name = 'Pizza Hut';

COMMIT;

-- session #1
SELECT *
	FROM pizzeria
		WHERE name = 'Pizza Hut';
COMMIT;

-- session #1
SELECT *
	FROM pizzeria
		WHERE name = 'Pizza Hut';

-- session #2
SELECT *
	FROM pizzeria
		WHERE name = 'Pizza Hut';

