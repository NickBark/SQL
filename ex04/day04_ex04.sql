CREATE VIEW v_symmetric_union AS

WITH R AS (
    SELECT person_id FROM person_visits
    WHERE visit_date = '2022-01-02'
), S AS (
    SELECT person_id FROM person_visits
    WHERE visit_date = '2022-01-06'
), U AS (
    SELECT person_id FROM R
    EXCEPT ALL
    SELECT person_id FROM S
), I AS (
    SELECT person_id FROM S
    EXCEPT ALL
    SELECT person_id FROM R
)

SELECT person_id FROM U
UNION ALL
SELECT person_id FROM I
ORDER BY person_id

-- (R u S) - (R i S)
-- (R - S) u (S - R)



