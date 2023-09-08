WITH Andrey_visits AS(
    SELECT pv.person_id, pizzeria.name FROM person_visits AS pv
    JOIN person ON person.id = pv.person_id
    JOIN pizzeria ON pizzeria.id = pv.pizzeria_id
    WHERE person.name = 'Andrey'
), Andrey_orders AS(
    SELECT po.person_id, pizzeria.name FROM person_order AS po
    JOIN person ON person.id = po.person_id
    JOIN menu ON po.menu_id = menu.id
    JOIN pizzeria ON menu.pizzeria_id = pizzeria.id
    WHERE person.name = 'Andrey'
)

SELECT av.name AS pizzeria_name
FROM Andrey_visits AS av
EXCEPT
SELECT ao.name AS pizzeria_name
FROM Andrey_orders AS ao
ORDER BY pizzeria_name