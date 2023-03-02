Q1
--https://leetcode.com/problems/sales-person/description/?envType=study-plan&id=sql-i
--Write an SQL query to report the names of all the salespersons who did not have any orders related to the company with the name "RED".

select name
from SalesPerson
where sales_id not in (select sales_id
    from Company
    inner join Orders on company.com_id=Orders.com_id
    where Company.name='RED'
)

Q2--https://leetcode.com/problems/game-play-analysis-i/?envType=study-plan&id=sql-i
--Write an SQL query to report the first login date for each player.

select player_id,min(event_date) as first_login
from Activity
group by player_id

Q3
--https://leetcode.com/problems/the-latest-login-in-2020/description/?envType=study-plan&id=sql-i
--Write an SQL query to report the latest login for all users in the year 2020. Do not include the users who did not login in 2020.

select user_id ,max(time_stamp) as last_stamp
from Logins
where year(time_stamp) in ('2020')
group by user_id