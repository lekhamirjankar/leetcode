SELECT 
    MAX(num) as num
FROM 
    MyNumbers n
where 
    num IN 
    (
      SELECT 
        num
      FROM 
        MyNumbers
      GROUP BY 
        num
      HAVING 
        COUNT(*)=1
    )
