-- Write your PostgreSQL query statement below
SELECT
    p.product_id,
    COALESCE(
        ROUND((SUM(p.price * us.units))::numeric/ (SUM(us.units)), 2),
        0
    ) AS average_price
FROM
    Prices AS p
    LEFT OUTER JOIN UnitsSold AS us
        ON p.product_id = us.product_id
        AND us.purchase_date BETWEEN p.start_date and p.end_date
GROUP BY
    p.product_id
;