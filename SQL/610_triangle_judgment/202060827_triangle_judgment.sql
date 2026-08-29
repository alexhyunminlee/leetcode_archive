-- Write your PostgreSQL query statement below
SELECT
    *,
    CASE
        WHEN 2*GREATEST(x,y,z) < x + y + z THEN 'Yes'
        ELSE 'No'
    END AS Triangle
FROM
    Triangle
;
