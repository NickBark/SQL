WITH pizzeria_of_dmitry(piz_id) AS (
    SELECT pizzeria_id FROM person_visits AS po
    JOIN person ON person.id = po.person_id
    WHERE person.name = 'Dmitriy' AND po.visit_date = '2022-01-08'
)

SELECT pizza_name FROM menu
JOIN pizzeria_of_dmitry AS pod 
ON pod.piz_id = menu.pizzeria_id AND menu.price < 800

