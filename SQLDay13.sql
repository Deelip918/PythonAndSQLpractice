--https://www.w3resource.com/sql-exercises/sql-joins-exercises.php#SQLEDITOR
use data1;
select * from agents
select * from customer
select * from orders

--to find the agents and customer who work in the same city. Return agents, cust_name and city.

select agent_name,cust_name, a.WORKING_AREA 
from agents a inner join customer c on a.agent_code=c.agent_code 
where a.working_area=c.working_area
-
--write a SQL query to find those orders where the order amount exists between 500 and 2000. Return ord_no, purch_amt, cust_name, city.
select ord_num,agent_name,ord_amount,working_area
from agents a 
inner join orders o on a.agent_code=o.agent_code
where ord_amount between 1500 and 2500

--write a SQL query to find the agent(s) and the customer(s) he represents. Return Customer Name, city, agent, working area.
select a.agent_code,cust_code,cust_name,agent_name,a.working_area,commission
from agents a 
left join customer c on a.agent_code=c.agent_code 
order by agent_code
--write a SQL query to find salespeople who received commissions of more than 12 percent from the company. Return Customer Name, customer city, Salesman, commission.
select cust_name,a.AGENT_CODE, a.working_area,agent_name, (a.commission*100) as commission 
from customer c left join agents a on c.AGENT_CODE=a.AGENT_CODE
where (commission*100)>12.00
order by a.agent_code