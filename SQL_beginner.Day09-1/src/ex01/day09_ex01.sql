-- trigger function that processes UPDATE
CREATE OR REPLACE FUNCTION fnc_trg_person_update_audit()
	RETURNS trigger AS $trg_person_update_audit$
	BEGIN
		IF (TG_OP = 'UPDATE') THEN
			INSERT INTO person_audit (type_event, row_id, name, age, gender, address)
				VALUES ('U', OLD.id, OLD.name, OLD.age, OLD.gender, OLD.address);
		END IF;
		RETURN NULL;
	END;
$trg_person_update_audit$ LANGUAGE plpgsql;

-- trigger for updates in the "person" table
-- calling the trigger function
CREATE TRIGGER trg_person_update_audit
	AFTER UPDATE ON person
		FOR EACH ROW EXECUTE FUNCTION fnc_trg_person_update_audit();

-- SQL statements for check
UPDATE person SET name = 'Bulat' WHERE id = 10;
UPDATE person SET name = 'Damir' WHERE id = 10;
