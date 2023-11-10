WITH tmp AS (
    SELECT person_id, COUNT(*) AS count_of_visits
    FROM person_visits
    GROUP BY person_id
    ORDER BY count_of_visits DESC, person_id ASC
)

SELECT 
    p.name AS name,
    tmp.count_of_visits AS count_of_visits
FROM tmp
JOIN person p ON p.id = tmp.person_id
ORDER BY count_of_visits DESC, name ASC
LIMIT 4