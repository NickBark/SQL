-- WITH RECURSIVE tsp AS (
--     SELECT
--         0 AS total_cost,
--         ARRAY[point1] AS tour
--     FROM nodes
--     WHERE point1 = 'a'

--     UNION

--     SELECT
--         total_cost + nodes.cost AS total_cost,
--         tour || point2 AS tour
--     FROM tsp
--     JOIN nodes ON point1 = tour[array_length(tour, 1)]
--     WHERE NOT point2 = ANY (tour) OR
--     (array_length(tour, 1) = 4 AND point2 = 'a')
-- ), count_vertex AS (
--     SELECT *, array_length(tour,1) AS count_arr FROM tsp
-- )

-- SELECT total_cost, tour FROM count_vertex WHERE count_arr = 5
-- ORDER BY total_cost, tour


WITH RECURSIVE tsp AS (
    SELECT
        n.point1::bpchar as tour,
        n.point1,
        n.point2,
        n.cost AS total_cost
    FROM
        nodes n
    WHERE
        n.point1 = 'a'
    UNION
    SELECT
        prev.tour || ',' || prev.point2 AS tour,
        curr.point1,
        curr.point2,
        curr.cost + prev.total_cost AS total_cost
    FROM
        nodes curr
    JOIN
        tsp prev ON curr.point1 = prev.point2
    WHERE prev.tour NOT LIKE '%' || prev.point2 || '%'
), min_cost AS (
    SELECT
        total_cost,
        '{' || tour || ',' || point2 || '}' AS tour
    FROM
        tsp
    WHERE
        point2 = 'a'
        AND total_cost = (SELECT MIN(total_cost) FROM tsp WHERE LENGTH(tour) = 7 AND point2 = 'a')
), max_cost AS (
    SELECT
        total_cost,
        '{' || tour || ',' || point2 || '}' AS tour
    FROM
        tsp
    WHERE
        point2 = 'a'
        AND total_cost = (SELECT MAX(total_cost) FROM tsp WHERE LENGTH(tour) = 7 AND point2 = 'a')
)
SELECT total_cost, tour
FROM min_cost
UNION
SELECT total_cost, tour
FROM max_cost;
