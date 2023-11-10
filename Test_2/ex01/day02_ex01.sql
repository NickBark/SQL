SELECT dates.missing_date
FROM
(
    SELECT generate_series(
        '2022-01-01'::date,'2022-01-10'::date,'1 day'::interval)::date
    AS missing_date
) AS dates
LEFT JOIN
    (
        SELECT DISTINCT visit_date
        FROM person_visits
        WHERE person_id = 1 OR person_id = 2
    ) AS tmp
ON tmp.visit_date = dates.missing_date
WHERE tmp.visit_date IS NULL
ORDER BY dates.missing_date ASC