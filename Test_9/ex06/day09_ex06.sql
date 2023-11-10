CREATE OR REPLACE FUNCTION fnc_person_visits_and_eats_on_date (
    pperson VARCHAR(255) DEFAULT 'Dmitriy',
    pprice NUMERIC DEFAULT 500,
    pdate DATE DEFAULT '2022-01-08'
)
RETURNS TABLE (name VARCHAR) AS
$$
BEGIN
RETURN QUERY
    SELECT pz.name FROM person_visits pv
    JOIN person p ON pv.person_id = p.id
    JOIN pizzeria pz ON pv.pizzeria_id = pz.id
    JOIN menu m ON m.pizzeria_id = pz.id
    WHERE 
        p.name = pperson 
        AND m.price < pprice
        AND pv.visit_date = pdate;
END;
$$
LANGUAGE plpgsql;