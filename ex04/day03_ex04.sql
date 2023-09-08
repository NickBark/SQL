WITH all_orders AS (
    SELECT pizzeria.name, person.gender
    FROM person_order AS po
    JOIN person ON person.id = po.person_id
    JOIN menu ON po.menu_id = menu.id
    JOIN pizzeria ON pizzeria.id = menu.pizzeria_id
)

SELECT name AS pizzeria_name
FROM all_orders
GROUP BY pizzeria_name
HAVING COUNT(DISTINCT gender) = 1