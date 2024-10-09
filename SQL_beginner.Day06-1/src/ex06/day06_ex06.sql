CREATE SEQUENCE seq_person_discounts
	INCREMENT 1
	START 1
	OWNED BY person_discounts.id;

SELECT setval('seq_person_discounts',
			 (SELECT COUNT(*)
				FROM person_discounts));

ALTER TABLE person_discounts
	ALTER COLUMN id
		SET DEFAULT (nextval('seq_person_discounts'));
