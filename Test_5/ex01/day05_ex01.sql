set Enable_seqscan =off;
EXPLAIN ANALYZE
SELECT 
    pizza_name,
    pizzeria.name AS pizzeria_name
FROM menu
JOIN pizzeria ON menu.pizzeria_id = pizzeria.id;
set Enable_seqscan =on;