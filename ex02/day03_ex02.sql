WITH forgotten_menu(menu_id) AS(
    SELECT id AS menu_id FROM menu
    EXCEPT
    SELECT menu_id FROM person_order
)

SELECT 
    menu.pizza_name AS pizza_name,
    menu.price AS price,
    pizzeria.name AS pizzeria_name
FROM menu 
JOIN forgotten_menu AS fm ON fm.menu_id = menu.id
JOIN pizzeria ON pizzeria.id = menu.pizzeria_id
ORDER BY pizza_name, price