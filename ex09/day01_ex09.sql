SELECT pizzeria.name
FROM pizzeria
WHERE pizzeria.id NOT IN 
    (
        SELECT pizzeria_id 
        FROM person_visits
        WHERE pizzeria.id = person_visits.pizzeria_id
    );

SELECT pizzeria.name
FROM pizzeria
WHERE NOT EXISTS 
    (
        SELECT pizzeria_id 
        FROM person_visits
        WHERE pizzeria.id = person_visits.pizzeria_id
    );
