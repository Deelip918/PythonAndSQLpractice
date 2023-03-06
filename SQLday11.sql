/* Write your T-SQL query statement below */
--https://leetcode.com/problems/group-sold-products-by-the-date/description/?envType=study-plan&id=sql-i
--Write an SQL query to find for each date the number of different products sold and their names. 
--the sold products names for each date should be sorted lexicographically.--Return the result table ordered by sell_date.

with cte as (
select distinct *
from Activities)
select sell_date,count(product) as num_sold,string_agg(product,',') as products
from cte
group by sell_date
order by sell_date

--practiced basic commands
use data1;
create table newtable (id numeric(5),name varchar(30), age int ,email varchar(50))
insert into newtable (id,name,age,email) values ( 1,'Ram',29,'abc@gmail.com')
insert into newtable values (2, 'Sarah', 30, 'sarah@example.com'),
    (3, 'David', 40, 'david@example.com'),
    (4, 'Emily', 27, 'emily@example.com'),
    (5, 'Michael', 35, 'michael@example.com'),
    (6, 'Jessica', 28, 'jessica@example.com'),
    (7, 'Daniel', 45, 'daniel@example.com'),
    (8, 'Sophia', 31, 'sophia@example.com'),
    (9, 'Matthew', 29, 'matthew@example.com'),
    (10, 'Olivia', 32, 'olivia@example.com');

select * from newtable

insert into newtable values  (8, 'Sophia', 31, null ),
    (9, 'Matthew', null , 'matthew@example.com'),
    (10, null, 32, 'olivia@example.com'),
    (11, 'Anthony', 42,null),
    (12, null, 26, 'ava@example.com'),
    (13, 'William', null, 'william@example.com')
select distinct name
from newtable

select distinct *
from newtable

--altering table drop, modify,add column operation
alter table newtable
add binarycolumn int

alter table newtable
add newCol varchar(20),oldCol int;

select *
from newtable

alter table newtable
drop column oldCol

alter table newtable
alter column binarycolumn binary

--update command 
update newtable set newCol=33

update newtable set binarycolumn=1 where id<7

select *
from newtable

update newtable set newCol=22 , email='ram@gmail.com' where id=1

--case statement
select name ,age, case when newCol=22 then 1 when newcol=33 then 0 else null end as YesNo
from newtable