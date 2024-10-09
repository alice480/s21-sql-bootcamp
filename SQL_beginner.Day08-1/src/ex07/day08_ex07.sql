-- session #1
 BEGIN;
-- session #2
BEGIN;

-- session #1
UPDATE pizzeria
	SET rating = 1.4
		WHERE id = 1;
		
-- session #2
UPDATE pizzeria
	SET rating = 2.4
		WHERE id = 2;

-- session #1
UPDATE pizzeria
	SET rating = 3.4
		WHERE id = 2;
		
-- session #2
UPDATE pizzeria
	SET rating = 4.4
		WHERE id = 1;

-- session #1
COMMIT;
-- session #2
COMMIT;

