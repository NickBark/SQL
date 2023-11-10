SELECT address, pz.name, COUNT(*) AS count_of_orders
FROM person_order po
JOIN person p ON po.person_id = p.id
JOIN menu m ON m.id = po.menu_id
JOIN pizzeria pz ON pz.id = m.pizzeria_id
GROUP BY address, pz.name
ORDER BY address, pz.name