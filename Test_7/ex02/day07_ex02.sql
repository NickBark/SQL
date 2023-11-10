WITH fav_order AS (
    SELECT pz.name, COUNT(*) AS count, 'order' AS action_type
    FROM person_order po
    JOIN menu m ON po.menu_id = m.id
    JOIN pizzeria pz ON pz.id = m.pizzeria_id
    GROUP BY pz.name
    ORDER BY count DESC, name ASC
    LIMIT 3
), fav_visit AS (
    SELECT pz.name, COUNT(*) AS count, 'visit' AS action_type
    FROM person_visits pv
    JOIN pizzeria pz ON pz.id = pv.pizzeria_id
    GROUP BY pz.name
    ORDER BY count DESC, name ASC
    LIMIT 3
)
SELECT * FROM fav_order
UNION
SELECT * FROM fav_visit
ORDER BY action_type ASC, count DESC