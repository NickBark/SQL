WITH ppp AS (
    SELECT
        COALESCE(u.name, 'not defined') AS name,
        COALESCE(u.lastname, 'not defined') AS lastname,
        b.type AS type,
        SUM(b.money) AS volume,
        COALESCE(c.name, 'not defined') AS currency_name,
        (SELECT(COALESCE((SELECT c.rate_to_usd FROM currency ORDER BY 1 DESC LIMIT 1), 1)))
        AS last_rate_to_usd
    FROM balance b
    FULL JOIN "user" u ON u.id = b.user_id
    FULL JOIN (
        SELECT DISTINCT ON (name) * FROM 
        (SELECT * FROM currency ORDER BY name, id, updated DESC) 
        AS tmp
    ) c ON c.id = b.currency_id
    GROUP BY u.name, u.lastname, b.type, c.name, c.rate_to_usd
    ORDER BY 1 DESC, 2, 3
)

SELECT *, volume * last_rate_to_usd FROM ppp;

-- WITH volume_tab AS (
--     SELECT *
--     FROM balance b
--     FULL JOIN "user" u ON u.id = b.user_id
--     FULL JOIN (
--         SELECT DISTINCT ON (name) FROM currency ORDER BY
--     )c ON c.id = b.currency_id
--     -- GROUP BY b.user_id
--     -- ORDER BY 1
-- )

-- SELECT * FROM volume_tab;

-- SELECT DISTINCT ON (name) * FROM 
--     (SELECT * FROM currency ORDER BY name, id, updated DESC) 
--     AS tmp