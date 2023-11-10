WITH denis_and_annda_menu(menu_id) AS (
    SELECT po.menu_id FROM person 
    JOIN person_order AS po ON po.person_id = person.id
    WHERE person.name = 'Denis' OR person.name = 'Anna'
),
pizza_name_list AS (
    SELECT pizzeria_id, pizza_name FROM menu
    JOIN denis_and_annda_menu AS dam ON dam.menu_id = menu.id
)

SELECT
    pnl.pizza_name AS pizza_name,
    pizzeria.name AS pizzeria_name
FROM pizza_name_list AS pnl
JOIN pizzeria ON pizzeria.id = pnl.pizzeria_id
ORDER BY pizza_name, pizzeria_name