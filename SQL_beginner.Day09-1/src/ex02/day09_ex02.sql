-- trigger function that processes DELETE
CREATE OR REPLACE FUNCTION fnc_trg_person_delete_audit()
	RETURNS trigger AS $trg_person_delete_audit$
	BEGIN
		IF (TG_OP = 'DELETE') THEN
			INSERT INTO person_audit (type_event, row_id, name, age, gender, address)
				VALUES ('D', OLD.id, OLD.name, OLD.age, OLD.gender, OLD.address);
		END IF;
		RETURN NULL;
	END;
$trg_person_delete_audit$ LANGUAGE plpgsql;

-- trigger for deletions from the "person" table 
-- calls the trigger function
CREATE TRIGGER trg_person_delete_audit
	AFTER DELETE ON person
		FOR EACH ROW EXECUTE FUNCTION fnc_trg_person_delete_audit();

-- SQL statement for check
DELETE FROM person WHERE id = 10;
