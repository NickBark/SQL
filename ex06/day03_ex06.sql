WITH pizza_names AS (
    SELECT
        menu.pizza_name AS pizza_name,
        pizzeria.name AS pizzeria_name,
        menu.price AS price
    FROM menu
    JOIN pizzeria ON pizzeria.id = menu.pizzeria_id
), same_pizza AS (
    SELECT
        ROW_NUMBER() OVER() AS id, -- нумерация строк (в OVER можно указать по какому столбцу)
        p1.pizza_name,
        p1.pizzeria_name AS pizzeria_name_1,
        p2.pizzeria_name AS pizzeria_name_2,
        p1.price
    FROM pizza_names p1
    JOIN pizza_names p2 ON p1.price = p2.price
    AND p1.pizza_name = p2.pizza_name
    AND p1.pizzeria_name <> p2.pizzeria_name
)

SELECT 
    pizza_name,
    pizzeria_name_1,
    pizzeria_name_2,
    price
FROM same_pizza
WHERE MOD(id,2) = 1
ORDER BY pizza_name