DROP TABLE IF EXISTS nodes;
CREATE TABLE nodes (
    id SERIAL PRIMARY KEY,
    point1 VARCHAR,
    point2 VARCHAR,
    cost INT
);

INSERT INTO nodes(point1, point2, cost)
VALUES 
    ('a', 'b', 10),
    ('b', 'a', 10),
    ('a', 'd', 20),
    ('d', 'a', 20),
    ('a', 'c', 15),
    ('c', 'a', 15),
    ('b', 'd', 25),
    ('d', 'b', 25),
    ('b', 'c', 35),
    ('c', 'b', 35),
    ('d', 'c', 30),
    ('c', 'd', 30)
;

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
AND total_cost = (
    SELECT MIN(total_cost) FROM count_vertex WHERE count_arr = 5
)
ORDER BY total_cost, tour