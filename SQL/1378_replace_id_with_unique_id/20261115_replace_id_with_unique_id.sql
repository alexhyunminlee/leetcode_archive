-- Write your PostgreSQL query statement below
SELECT
    name,
    unique_id
FROM
    Employees
LEFT OUTER JOIN
    EmployeeUNI USING(id)
;