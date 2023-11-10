COMMENT ON TABLE person_discounts IS 'This table stores information about personal discounts for customers in different pizzerias.';
COMMENT ON COLUMN person_discounts.id IS 'Primary key';
COMMENT ON COLUMN person_discounts.person_id IS 'The unique identifier of the person for whom the discount is applied.';
COMMENT ON COLUMN person_discounts.pizzeria_id IS 'The unique identifier of the pizzeria where the orders were created.';
COMMENT ON COLUMN person_discounts.discount IS 'The discount value in percent for the person.';