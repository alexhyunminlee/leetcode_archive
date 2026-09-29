-- Write your PostgreSQL query statement below
SELECT
    p.project_id,
    ROUND(AVG(e.experience_years), 2) AS average_years
FROM
    Project AS p
    INNER JOIN Employee As e USING(employee_id)
GROUP BY
    project_id
ORDER BY
    project_id;