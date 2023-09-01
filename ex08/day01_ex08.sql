SELECT
    person_order.order_date AS order_date,
    CONCAT(person.name, '(age:', person.age,')')
        AS person_information
FROM person_order
NATURAL JOIN 
    (
        SELECT 
            person.id AS person_id,
            name,
            age,
            gender,
            address
        FROM person
    ) AS person
ORDER BY order_date, person_information