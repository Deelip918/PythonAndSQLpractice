--Q4 SQL query to locate those salespeople who do not live in the same city where their customers live and have received a commission of more than 12% from the company. Return Customer Name, customer city, Salesman, salesman city, commission.
select c.Cust_Name, c.cust_city, a.agent_name, a.working_area, a.commission
from agents a
inner join customer c on a.AGENT_CODE=c.agent_code
where (commission*100)>12 and a.working_area!=c.working_area
order by a.agent_name

--From the following tables write a SQL query to find the details of an order. Return ord_no, ord_date, purch_amt, Customer Name, grade, Salesman, commission
select o.ord_no, o.ord_date, o.purch_amt, c.Cust_Name, c.grade, a.agent_name
from agents a
inner join customer c on a.agent_code=c.agent_code
inner join orders o on a.agent_code=o.agent_code



--Q8 From the following tables write a SQL query to display the customer name, customer city, grade, salesman, salesman city. The results should be sorted by ascending customer_id.
select c.cust_code,c.cust_name, c.cust_city, c.grade, a.agent_name, a.working_area
from CUSTOMER c
inner join agents a on a.agent_code=c.agent_code
order by cust_code asc