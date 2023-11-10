DROP FUNCTION IF EXISTS fnc_persons_male();
DROP FUNCTION IF EXISTS fnc_persons_female();

CREATE FUNCTION fnc_persons (
    pgender VARCHAR(255) DEFAULT 'female'
)
RETURNS TABLE (
    id person.id%TYPE,
    name person.name%TYPE,
    age person.age%TYPE,
    gender person.gender%TYPE,
    address person.address%TYPE
) AS
$$
SELECT * FROM person WHERE gender = pgender;
$$
LANGUAGE sql;