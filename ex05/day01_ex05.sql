SELECT
    person.id as "person.id", 
    person.name as "person.name",
    age,
    gender,
    address,
    pizzeria.id as "pizzeria.id",
    pizzeria.name as "pizzeria.name",
    rating
FROM
    person -- или можно просто написать таблицы через запятую (декартово произведение)
CROSS JOIN
    pizzeria
ORDER BY person.id, pizzeria.id ASC