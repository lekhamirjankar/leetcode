SELECT 
    name
FROM 
    SalesPerson S
WHERE NOT EXISTS 
(
    SELECT 
        1
    FROM 
        Orders O
    JOIN 
        Company C
      ON O.com_id = C.com_id
    WHERE 
        C.name = 'RED'
        AND O.sales_id = S.sales_id
);
