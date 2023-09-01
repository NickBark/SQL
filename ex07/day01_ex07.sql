SELECT
    po.order_date AS order_date,
    CONCAT(person.name, '(age:', person.age,')')
        AS person_information
FROM person_order AS po
JOIN person ON po.person_id = person.id
ORDER BY order_date, person_information