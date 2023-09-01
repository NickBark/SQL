WITH piz_list(piz_id, pizza_name, price) 
AS
(
    SELECT pizzeria_id, pizza_name, price 
    FROM menu
    WHERE pizza_name = 'pepperoni pizza'
    OR pizza_name = 'mushroom pizza'
)

SELECT
    pl.pizza_name AS pizza_name,
    pz.name AS pizzeria_name,
    pl.price AS price
FROM pizzeria AS pz
JOIN piz_list AS pl ON pl.piz_id = pz.id
ORDER BY pizza_name, pizzeria_name
