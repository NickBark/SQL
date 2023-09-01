WITH day_generator(all_days) 
AS 
(
    SELECT generate_series('2022-01-01'::date,'2022-01-10'::date,'1 day'::interval)::date
)

SELECT day_generator.all_days AS missing_date
FROM day_generator
LEFT JOIN
    (
        SELECT DISTINCT visit_date
        FROM person_visits
        WHERE person_id = 1 OR person_id = 2
    ) AS tmp
ON tmp.visit_date = day_generator.all_days
WHERE tmp.visit_date IS NULL
ORDER BY day_generator.all_days ASC