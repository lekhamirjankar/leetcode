SELECT 
  S.user_id, 
  COALESCE(ROUND(SUM(CASE WHEN C.action = 'confirmed' THEN 1 ELSE 0 END)/COUNT(C.user_id),2),0) AS confirmation_rate
FROM 
    Signups S
LEFT JOIN 
    Confirmations C
ON 
    S.user_id = C.user_id
GROUP BY 
    S.user_id
