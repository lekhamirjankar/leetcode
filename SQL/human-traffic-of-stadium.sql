WITH cons_id AS
(
    SELECT 
      *,
      id-ROW_NUMBER() OVER() rn
    FROM 
      stadium s1
    WHERE 
      people >=100
) 
SELECT 
  id, 
  visit_date, 
  people
FROM 
  cons_id
WHERE 
  rn IN 
  (
    SELECT 
      rn
    FROM 
      cons_id 
    GROUP BY 
      rn
    HAVING 
      count(1) >=3
)
