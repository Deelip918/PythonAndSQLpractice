--Q1  
https://leetcode.com/problems/customer-placing-the-largest-number-of-orders/description/?envType=study-plan&id=sql-i

--Write an SQL query to find the customer_number for the customer who has placed the largest number of orders.

select top 1 customer_number
from
(select customer_number, count(order_number) as cout
from Orders
group by customer_number
) as subquery
order by cout desc

--Q2
--Write an SQL query to calculate the total time in minutes spent by each employee on each day at the office. Note that within one day, an employee can enter and leave more than once. The time spent in the office for a single entry is out_time - in_time.

select event_day as day,emp_id,(sum(out_time)-sum(in_time)) as total_time
from Employees
group by event_day,emp_id

--Q3--https://leetcode.com/problems/capital-gainloss/description/?envType=study-plan&id=sql-i

--Write an SQL query to report the Capital gain/loss for each stock. The Capital gain/loss of a stock is the total gain or loss after buying and selling the stock one or many times.

select stock_name ,sum(case when operation='Buy' then (-1*price) when operation='Sell' then price end) as capital_gain_loss
from Stocks
group by stock_name