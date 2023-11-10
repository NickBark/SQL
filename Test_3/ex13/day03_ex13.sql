DELETE FROM person_order
WHERE order_date = '2022-02-25' AND menu_id = 19;

DELETE FROM menu
WHERE pizza_name = 'greek pizza'