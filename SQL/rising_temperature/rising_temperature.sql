-- Write your PostgreSQL query statement below
SELECT
    w2.id
FROM
    Weather AS w1
JOIN
    Weather As w2 ON w2.recordDate = (w1.recordDate + 1)
    AND w2.temperature > w1.temperature
ORDER BY
    w2.id;