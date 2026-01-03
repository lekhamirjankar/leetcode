SELECT
  name AS Customers
FROM 
  Customers
WHERE 
  id IN 
  (
    SELECT 
      id 
    FROM 
      Customers
    EXCEPT
    SELECT 
      customerId
    FROM  
      Orders
    )
