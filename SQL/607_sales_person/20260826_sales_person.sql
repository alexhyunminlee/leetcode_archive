SELECT
    name
FROM
    SalesPerson AS s
WHERE
    NOT EXISTS (SELECT 1
    FROM
        Orders AS o
        INNER JOIN Company AS c USING(com_id)
    WHERE
        o.sales_id = s.sales_id
        AND c.name = 'RED')
;