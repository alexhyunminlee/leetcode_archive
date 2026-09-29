# Write your MySQL query statement below
WITH sold_first_quarter AS (
    SELECT DISTINCT
        product_id,
        product_name
    FROM
        Product p
        INNER JOIN Sales s USING(product_id)
    WHERE
        s.sale_date BETWEEN '2019-01-01' AND '2019-03-31'
),
sold_outside_first_quarter AS (
    SELECT DISTINCT
        product_id,
        product_name
    FROM
        Product p
        INNER JOIN Sales s USING(product_id)
    WHERE
        s.sale_date NOT BETWEEN '2019-01-01' AND '2019-03-31'
)

SELECT * FROM sold_first_quarter
EXCEPT
SELECT * FROM sold_outside_first_quarter;