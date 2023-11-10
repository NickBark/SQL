WITH person_pizzeria_table AS (
SELECT person_id, pizzeria_id
FROM person_order po
JOIN menu m ON m.id = po.menu_id
), order_count AS (
SELECT person_id, pizzeria_id, COUNT(*) AS count_of_orders
FROM person_pizzeria_table
GROUP BY person_id, pizzeria_id
ORDER BY person_id, pizzeria_id
)

INSERT INTO person_discounts (id, person_id, pizzeria_id, discount)
SELECT 
    ROW_NUMBER() OVER() AS id,
    person_id,
    pizzeria_id,
    CASE
        WHEN count_of_orders = 1 THEN 10.5
        WHEN count_of_orders = 2 THEN 22
        ELSE 30
    END AS discount
FROM order_count