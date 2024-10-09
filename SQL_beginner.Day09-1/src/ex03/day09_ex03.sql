-- drop 3 old triggers from the person table
DROP TRIGGER IF EXISTS trg_person_insert_audit ON person;
DROP TRIGGER IF EXISTS trg_person_update_audit ON person;
DROP TRIGGER IF EXISTS trg_person_delete_audit ON person;

-- drop 3 old trigger functions
DROP FUNCTION IF EXISTS fnc_trg_person_insert_audit;
DROP FUNCTION IF EXISTS fnc_trg_person_update_audit;
DROP FUNCTION IF EXISTS fnc_trg_person_delete_audit;

TRUNCATE TABLE person_audit;

-- trigger function that processes all DML traffic:
-- INSERT, UPDATE, DELETE
CREATE OR REPLACE FUNCTION fnc_trg_person_audit()
	RETURNS trigger AS $trg_person_audit$
	BEGIN
		IF (TG_OP = 'INSERT') THEN
			INSERT INTO person_audit (type_event, row_id, name, age, gender, address)
				VALUES ('I', NEW.id, NEW.name, NEW.age, NEW.gender, NEW.address);
		ELSEIF (TG_OP = 'UPDATE') THEN
			INSERT INTO person_audit (type_event, row_id, name, age, gender, address)
				VALUES ('U', OLD.id, OLD.name, OLD.age, OLD.gender, OLD.address);
		ELSEIF (TG_OP = 'DELETE') THEN
			INSERT INTO person_audit (type_event, row_id, name, age, gender, address)
				VALUES ('D', OLD.id, OLD.name, OLD.age, OLD.gender, OLD.address);
		END IF;
		RETURN NULL;
	END;
$trg_person_audit$ LANGUAGE plpgsql;
	
-- trigger for all changes in the "person" table 
-- calls the trigger function
CREATE TRIGGER trg_person_audit
	AFTER INSERT OR UPDATE OR DELETE ON person
		FOR EACH ROW EXECUTE FUNCTION fnc_trg_person_audit();

-- SQL statements for check
INSERT INTO person(id, name, age, gender, address)  VALUES (10,'Damir', 22, 'male', 'Irkutsk');
UPDATE person SET name = 'Bulat' WHERE id = 10;
UPDATE person SET name = 'Damir' WHERE id = 10;
DELETE FROM person WHERE id = 10;
