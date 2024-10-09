-- table with records of changes in the "person" table
CREATE TABLE IF NOT EXISTS person_audit (
	created timestamp with time zone NOT NULL DEFAULT current_timestamp,
	type_event char(1) NOT NULL DEFAULT 'I',
	row_id bigint NOT NULL,
	name varchar,
	age integer,
	gender varchar,
	address varchar,
	CONSTRAINT ch_type_event CHECK (type_event IN ('I', 'D', 'U'))
);

-- trigger function that processes INSERT
CREATE OR REPLACE FUNCTION fnc_trg_person_insert_audit() 
	RETURNS trigger AS $trg_person_insert_audit$
	BEGIN
		IF (TG_OP = 'INSERT') THEN
			INSERT INTO person_audit (type_event, row_id, name, age, gender, address)
				VALUES ('I', NEW.id, NEW.name, NEW.age, NEW.gender, NEW.address);
		END IF;
        RETURN NULL;
	END;
$trg_person_insert_audit$ LANGUAGE plpgsql;

-- trigger for inserts into the "person" table 
-- calls the trigger function
CREATE TRIGGER trg_person_insert_audit
	AFTER INSERT ON person
		FOR EACH ROW EXECUTE FUNCTION fnc_trg_person_insert_audit();

-- SQL statement for check
INSERT INTO person(id, name, age, gender, address) VALUES (10,'Damir', 22, 'male', 'Irkutsk');

