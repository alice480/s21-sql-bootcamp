COMMENT ON TABLE person_discounts 
	IS 'Table is for connecting people and discounts in pizzerias';

COMMENT ON COLUMN person_discounts.id IS 'Primary key (unique identifier)';
COMMENT ON COLUMN person_discounts.person_id IS 'Foreign key (persons identifier). Refers to the person table';
COMMENT ON COLUMN person_discounts.pizzeria_id IS 'Foreign key (pizzeria identifier). Refers to the pizzeria table';
COMMENT ON COLUMN person_discounts.discount IS 'The discount value in percent for a person (person_id) in a pizzeria (pizzeria_id)';
