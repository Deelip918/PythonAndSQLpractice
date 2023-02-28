--Q1. https://leetcode.com/problems/user-activity-for-the-past-30-days-i/description/?envType=study-plan&id=sql-i

Write an SQL query to find the daily active user count for a period of 30 days ending 2019-07-27 inclusively. A user was active on someday if they made at least one activity on that day

select activity_date as day, 
count(distinct user_id) as active_users
from Activity
group by activity_date
having activity_date between '2019-06-28' and '2019-07-27'

--Q2. https://leetcode.com/problems/daily-leads-and-partners/description/?envType=study-plan&id=sql-i

Write an SQL query that will, for each date_id and make_name, return the number of distinct lead_id's and distinct partner_id's.


select  date_id,make_name, count(distinct(lead_id)) as unique_leads ,count(distinct(partner_id)) as unique_partners
from DailySales
group by date_id,make_name

--Q3 --https://leetcode.com/problems/find-followers-count/?envType=study-plan&id=sql-i

--Write an SQL query that will, for each user, return the number of followers. Return the result table ordered by user_id in ascending order.

select user_id,count(follower_id) as followers_count
from Followers
group by user_id
