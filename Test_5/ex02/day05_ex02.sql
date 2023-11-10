CREATE INDEX IF NOT EXISTS idx_person_name ON person USING BTREE (UPPER(name));
set Enable_seqscan =off;
EXPLAIN ANALYZE
SELECT * FROM person WHERE UPPER(name) = 'ANNA';
set Enable_seqscan =on;