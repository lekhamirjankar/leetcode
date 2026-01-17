# Write your MySQL query statement below

select name as Customers
from Customers
where id in (
select id 
from Customers
except
select customerId
from  Orders
)
