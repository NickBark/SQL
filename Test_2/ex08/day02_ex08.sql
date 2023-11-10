WITH males(id, name) AS (
    SELECT id, name FROM person
    WHERE gender = 'male' AND address IN ('Samara', 'Moscow')
)

SELECT males.name FROM person_order AS po
JOIN menu ON po.menu_id = menu.id
JOIN males ON males.id = po.person_id
WHERE menu.pizza_name IN ('pepperoni pizza', 'mushroom pizza')
ORDER BY males.name DESC