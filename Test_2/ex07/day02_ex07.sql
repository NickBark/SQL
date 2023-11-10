SELECT pizzeria.name FROM person_visits AS pv
JOIN person ON person.id = pv.person_id
JOIN pizzeria ON pizzeria.id = pv.pizzeria_id
JOIN menu ON menu.pizzeria_id = pv.pizzeria_id
WHERE person.name = 'Dmitriy' 
AND visit_date = '2022-01-08'
AND menu.price < 800

