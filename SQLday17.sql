--Q9 write a SQL query to find those customers with a grade less than 3. Return cust_name, customer city, grade, Salesman, salesmancity. The result should be ordered by ascending customer_id.

select c.cust_name, c.cust_city, c.grade, a.agent_name, a.working_area
from CUSTOMER c
join agents a on c.agent_code=a.agent_code
where grade<3
order by cust_name

--Q10 Write a SQL statement to join the tables salesman, customer and orders so that the same column of each table appears once and only the relational rows are returned. 
select ("which ever column is required will select")
from agents a
inner join customer c on a.agent_code=c.agent_code
inner join orders o on a.agent_code=o.agent_code

--Q11 Write a SQL statement to make a report with customer name, city, order number, order date, and order amount in ascending order according to the order date to determine whether any of the existing customers have placed an order or not
select cust_name, cust_city, ord_num, ord_date,ord_amount
from customer c
left join orders o on c.agent_code=o.agent_code
where c.CUST_CODE=o.cust_code
order by c.CUST_CODE

