SELECT
    student_id,
    s.student_name,
    subject_name,
    COALESCE(e.attended_exams, 0) AS attended_exams
FROM
    Students AS s
CROSS JOIN
    Subjects AS sub
LEFT OUTER JOIN
    (SELECT student_id, subject_name, COUNT(*) AS attended_exams
        FROM Examinations
        GROUP BY
            student_id,
            subject_name
    ) AS e USING(student_id, subject_name)
ORDER BY
    student_id,
    subject_name;