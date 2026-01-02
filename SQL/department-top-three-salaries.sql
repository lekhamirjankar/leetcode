SELECT 
  Department,  Employee, Salary
FROM 
(
  SELECT 
    D.name AS Department, 
    E.name AS Employee, 
    E.Salary AS Salary,
    DENSE_RANK() OVER (PARTITION BY D.name ORDER BY Salary DESC) AS rk
  FROM 
    Department D
  JOIN Employee E
  ON D.id = E.departmentId
  ) HS
WHERE 
  rk IN (1,2,3)
