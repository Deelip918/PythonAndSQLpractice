--Q12 Write a SQL statement to generate a list in ascending order of salespersons who work either for one or more customers or have not yet joined any of the customers.
SELECT c.cust_name,c.cust_city,c.grade, 
a.agent_name AS "Salesman", a.working_area 
FROM customer c
RIGHT OUTER JOIN agents a ON c.agent_code=a.agent_code 
ORDER BY c.agent_code;

--Q13 write a SQL query to list all salespersons along with customer name, city, grade, order number, date, and amount. 
select a.agent_code, c.cust_name, c.cust_city, c.grade, o.ord_num, ord_date, ord_amount
from agents a
left join customer c on a.agent_code=c.agent_code
left join orders o on c.CUST_CODE=o.cust_code
order by  a.agent_code

--Q14 Write a SQL statement to make a list for the salesmen who either work for one or more customers or yet to join any of the customer. The customer may have placed, either one or more orders on or above order amount 2000 and must have a grade, or he may not have placed any order to the associated supplier
SELECT c.cust_name,c.cust_city,c.grade, 
a.agent_name AS "Salesman", 
o.ord_num, o.ord_date, o.ord_amount
FROM agents a 
left JOIN customer c on a.agent_code=c.agent_code 
left JOIN orders o on c.cust_code=o.cust_code
WHERE o.ord_amount>=2000 
AND c.grade!=0;