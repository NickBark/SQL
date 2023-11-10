CREATE TABLE IF NOT EXISTS person_discounts (
    id BIGINT PRIMARY KEY,
    person_id BIGINT NOT NULL,
    pizzeria_id BIGINT NOT NULL,
    CONSTRAINT fk_person_discounts_person_id
    FOREIGN KEY (person_id) REFERENCES person(id),
    CONSTRAINT fk_person_discounts_pizzeria_id
    FOREIGN KEY (person_id) REFERENCES person(id),
    discount NUMERIC NOT NULL
);

-- ALTER TABLE person_discounts ADD CONSTRAINT ch_discount 
-- CHECK (discount BETWEEN 0 AND 100);