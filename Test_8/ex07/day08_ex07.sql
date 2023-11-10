-- Session #1
BEGIN;
UPDATE pizzeria SET rating = 2 WHERE name = 'Best Pizza';
UPDATE pizzeria SET rating = 3 WHERE name = 'Dominos';
COMMIT;


-- Session #2
BEGIN;
UPDATE pizzeria SET rating = 3 WHERE name = 'Dominos';
UPDATE pizzeria SET rating = 2 WHERE name = 'Best Pizza';
COMMIT;

