WITH female(id, name) AS (
    SELECT id, name FROM person
    WHERE gender = 'female'
),
fem_piz(id, name, pizza) AS (
    SELECT female.id, female.name, menu.pizza_name FROM female
    JOIN person_order AS po ON po.person_id = female.id
    JOIN menu ON menu.id = po.menu_id
),
peppe(id, name, pizza) AS (
    SELECT id, name, pizza FROM fem_piz
    WHERE pizza = 'pepperoni pizza'
),
cheese(id, name, pizza) AS (
    SELECT id, name, pizza FROM fem_piz
    WHERE pizza = 'cheese pizza'
)

SELECT name FROM peppe
INTERSECT
SELECT name FROM cheese
ORDER BY name