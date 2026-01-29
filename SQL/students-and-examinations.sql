SELECT 
    ST.student_id, 
    ST.student_name, 
    SB.subject_name,
    count(E.student_id) AS attended_exams
FROM 
  Students ST
CROSS JOIN 
  Subjects SB
LEFT JOIN 
  Examinations E 
ON 
  E.subject_name = SB.subject_name
AND 
  ST.student_id = E.student_id
GROUP BY 
  ST.student_id, SB.subject_name
ORDER BY 
  student_id, subject_name
