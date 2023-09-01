SELECT  COALESCE(p.name, '-') AS person_name,
        COALESCE(po.visit_date::text, 'null') AS visit_date,
        COALESCE(piz.name, '-') AS pizzeria_name
FROM
    (
        SELECT person_id, pizzeria_id, visit_date
        FROM person_visits
        WHERE visit_date BETWEEN '2022-01-01' AND '2022-01-03'
    ) AS po
FULL JOIN person AS p ON po.person_id = p.id
FULL JOIN pizzeria AS piz ON po.pizzeria_id = piz.id
ORDER BY person_name, visit_date, pizzeria_name