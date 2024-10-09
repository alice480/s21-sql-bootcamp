CREATE INDEX idx_person_name ON person (upper(name));

SET enable_seqscan = OFF;

-- SQL with proof that index idx_person_name is working
EXPLAIN ANALYZE
	SELECT *
		FROM person
			WHERE upper(name) = 'IRINA'

