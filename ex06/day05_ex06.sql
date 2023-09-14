DROP INDEX IF EXISTS idx_1;

CREATE UNIQUE INDEX IF NOT EXISTS idx_1 ON menu USING BTREE (pizzeria_id, pizza_name);

set Enable_seqscan =off;
EXPLAIN ANALYZE
SELECT
    m.pizza_name AS pizza_name,
    max(rating) OVER (PARTITION BY rating
    ORDER BY rating ROWS BETWEEN UNBOUNDED PRECEDING
    AND UNBOUNDED FOLLOWING) AS k
FROM  menu m
INNER JOIN pizzeria pz ON m.pizzeria_id = pz.id
ORDER BY 1,2;
set Enable_seqscan =on;