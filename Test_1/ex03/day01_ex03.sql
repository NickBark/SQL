SELECT action_date, person_id FROM 
    (
        SELECT order_date as action_date, person_id FROM person_order
        INTERSECT
        SELECT visit_date, person_id FROM person_visits
    ) AS tmp_table
ORDER BY action_date, person_id DESC; 