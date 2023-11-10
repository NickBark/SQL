WITH pizza_and_day(pizzeria_id, visit_date) AS (
    SELECT 
        pizzeria_id,
        visit_date 
    FROM person_visits AS po
    JOIN (
        SELECT id, name FROM person WHERE name = 'Kate'
    ) AS person ON person.id = po.person_id
),
all_pizza(pizza_name, price, pizzeria_name, visit_date) AS (
    SELECT
        menu.pizza_name,
        menu.price,
        pizzeria.name,
        pad.visit_date
    FROM pizza_and_day AS pad
    JOIN pizzeria ON pad.pizzeria_id = pizzeria.id
    JOIN (
        SELECT * FROM menu WHERE price BETWEEN 800 AND 1000
    ) AS menu ON pad.pizzeria_id = menu.pizzeria_id
)

SELECT * FROM all_pizza
ORDER BY pizza_name, price, pizzeria_name

