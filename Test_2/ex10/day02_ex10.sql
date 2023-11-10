WITH people(id, name, address) AS (
    SELECT id, name, address FROM person
)

SELECT 
    person.name AS person_name1, 
    people.name AS person_name2,
    people.address AS common_address
FROM person
JOIN people ON person.address = people.address
AND person.id > people.id
ORDER BY person_name1, person_name2, common_address
