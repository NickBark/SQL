CREATE UNIQUE INDEX IF NOT EXISTS idx_person_discounts_unique
ON person_discounts USING BTREE (person_id, pizzeria_id);
set Enable_seqscan =off;
EXPLAIN ANALYZE
SELECT * FROM person_discounts WHERE person_id = 4;
set Enable_seqscan =on;
