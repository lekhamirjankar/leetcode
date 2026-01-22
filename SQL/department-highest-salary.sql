SELECT 
  Department, 
  Employee, 
  Salary
FROM
(
  SELECT 
    D.name AS Department, 
    E.name AS Employee, 
    E.Salary AS Salary,
    rank() over(partition by D.name order by Salary desc) AS rk
  FROM 
    Employee E
  JOIN 
    Department D
  ON 
    E.departmentId = D.id
) HS
WHERE 
  rk = 1
