WITH RECURSIVE tsp AS (
    SELECT
        0 AS total_cost,
        ARRAY[point1] AS tour
    FROM nodes
    WHERE point1 = 'a'

    UNION

    SELECT
        total_cost + nodes.cost AS total_cost,
        tour || point2 AS tour
    FROM tsp
    JOIN nodes ON point1 = tour[array_length(tour, 1)]
    WHERE NOT point2 = ANY (tour) OR
    (array_length(tour, 1) = 4 AND point2 = 'a')
), count_vertex AS (
    SELECT *, array_length(tour,1) AS count_arr FROM tsp
)

SELECT total_cost, tour FROM count_vertex WHERE count_arr = 5
ORDER BY total_cost, tour