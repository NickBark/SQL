WITH fav_order AS (
    SELECT pz.name, COUNT(*) AS count, 'order' AS action_type
    FROM person_order po
    JOIN menu m ON po.menu_id = m.id
    JOIN pizzeria pz ON pz.id = m.pizzeria_id
    GROUP BY pz.name
    ORDER BY count DESC, name ASC
), fav_visit AS (
    SELECT pz.name, COUNT(*) AS count, 'visit' AS action_type
    FROM person_visits pv
    JOIN pizzeria pz ON pz.id = pv.pizzeria_id
    GROUP BY pz.name
    ORDER BY count DESC, name ASC
), grouped AS (
    SELECT * FROM fav_order
    UNION
    SELECT * FROM fav_visit
)

SELECT name, SUM(count) AS total_count
FROM grouped
GROUP BY name
ORDER BY total_count DESC, name ASC

