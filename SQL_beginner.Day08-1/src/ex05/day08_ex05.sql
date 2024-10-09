-- session #1
BEGIN TRANSACTION ISOLATION LEVEL READ COMMITTED;
-- session #2
BEGIN TRANSACTION ISOLATION LEVEL READ COMMITTED;

-- session #1
SELECT sum(rating)
	FROM pizzeria;

-- session #2
UPDATE pizzeria
	SET rating = 1
		WHERE name = 'Pizza Hut';

COMMIT;

-- session #1
SELECT sum(rating)
	FROM pizzeria;

COMMIT;

-- session #1
SELECT sum(rating)
	FROM pizzeria;

-- session #2
SELECT sum(rating)
	FROM pizzeria;

