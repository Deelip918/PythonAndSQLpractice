--Q1 Calculate Matches played by character during first 30 days from install date of a player


select character, count(distinct match_id) AS matches
from (
    select m.character, m.match_id, i.Install_dt
    from Matches_data m
    join (
        select player_id, min(cast(event_dt as date)) as Install_dt 
        from Players_daily_data
        where cast(event_dt as date) >= '2019-04-22'
        group by player_id
    ) i on m._platform_account_id = i.player_id
    where cast(m._event_time_utc as date) BETWEEN i.Install_dt AND DATEADD(DAY, 30, i.Install_dt)
) a

group by character
having count(distinct match_id)>0
order by matches desc;

--Q2 Most played character in United states at week level


create view install_date as
select player_id, min(cast(event_dt as date)) Install_dt
from Players_daily_data
where cast(event_dt as date)>='2019-04-22'and Lower(country_name)= 'united states'
group by player_id

select weekStartdate,character
from(
select cast(weekStartdate as date) as weekStartdate,character,sum(total_match) as total,
rank() over (partition by WeekStartDate order by count(total_match) desc) AS Rank
from (
select DATEADD(DAY, 1 - DATEPART(WEEKDAY, cast(_event_time_utc as date)),cast(_event_time_utc as date)) as weekStartdate,i.player_id,character,count(match_id) as total_match
from Matches_data m
left join install_date i on m._platform_account_id=i.player_id
where cast(_event_time_utc as date)>'2019-04-22'
group by DATEADD(DAY, 1 - DATEPART(WEEKDAY, cast(_event_time_utc as date)),cast(_event_time_utc as date)),character,i.player_id
) as a
group by weekStartdate,character) as d
where rank=1
