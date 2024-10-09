-- session #1
BEGIN TRANSACTION ISOLATION LEVEL READ COMMITTED;
-- session #2
BEGIN TRANSACTION ISOLATION LEVEL READ COMMITTED;

-- session #1
SELECT *
	FROM pizzeria
		WHERE name = 'Pizza Hut';

-- session #2
UPDATE pizzeria
	SET rating = 3.6
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

