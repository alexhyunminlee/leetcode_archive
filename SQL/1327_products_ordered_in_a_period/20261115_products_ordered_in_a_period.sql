-- Write your PostgreSQL query statement below
SELECT
    p.product_name,
    SUM(o.unit) AS unit
FROM
    Products AS p
INNER JOIN 
    Orders AS o USING(product_id)
WHERE
    o.order_date >= '2020-02-01'::date AND
    o.order_date < '2020-03-01'::date
GROUP BY
    p.product_id,
    p.product_name
HAVING
    SUM(o.unit) >= 100
;