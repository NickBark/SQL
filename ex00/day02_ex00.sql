SELECT name, rating FROM pizzeria
LEFT JOIN person_visits AS po
ON pizzeria.id = po.pizzeria_id
WHERE po.pizzeria_id IS NULL