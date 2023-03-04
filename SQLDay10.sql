Q1 --https://leetcode.com/problems/actors-and-directors-who-cooperated-at-least-three-times/?envType=study-plan&id=sql-i
--Write a SQL query for a report that provides the pairs (actor_id, director_id) where the actor has cooperated with the director at least three times.

select actor_id,director_id
from ActorDirector
group by actor_id,director_id
having count(director_id)>=3

Q2 --https://leetcode.com/problems/bank-account-summary-ii/description/?envType=study-plan&id=sql-i
--Write an SQL query to report the name and balance of users with a balance higher than 10000. The balance of an account is equal to the sum of the amounts of all transactions involving that account.

select u.name,sum(amount) as balance
from Users u
left join Transactions t on u.account=t.account
group by u.account
having balance>10000

Q3--https://leetcode.com/problems/sales-analysis-iii/description/?envType=study-plan&id=sql-i
--Write an SQL query that reports the products that were only sold in the first quarter of 2019. That is, between 2019-01-01 and 2019-03-31 inclusive.
select s.product_id, p.product_name
from sales s
join product p on s.product_id = p.product_id
group by s.product_id, p.product_name
having min(s.sale_date) >= '2019-01-01' and max(s.sale_date) <= '2019-03-31'