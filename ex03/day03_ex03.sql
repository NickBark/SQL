WITH all_visitors AS (
    SELECT *
    FROM person_visits
    JOIN person ON person.id = person_id
), men AS (
    SELECT pizzeria_id, COUNT(*) AS count_men
    FROM all_visitors
    WHERE gender = 'male'
    GROUP BY pizzeria_id
), women AS (
    SELECT pizzeria_id, COUNT(*) AS count_women
    FROM all_visitors
    WHERE gender = 'female'
    GROUP BY pizzeria_id
)

SELECT pizzeria.name AS pizzeria_name FROM men
JOIN women ON men.pizzeria_id = women.pizzeria_id
JOIN pizzeria ON men.pizzeria_id = pizzeria.id
WHERE men.count_men != women.count_women
ORDER BY pizzeria_name
