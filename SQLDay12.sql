use data1;

select * from newtable

select * from newtable 
where name like 'd%' --name start from d

select * from newtable 
where name like '%d'  --name end from d

select * from newtable 
where name like '%a%'   -- name consist d any where

select * from newtable 
where name like '[a-d]%'-- name start with a to d

select * from newtable 
where name like '%[a-d]'-- name ends with a-d

select * from newtable 
where name like '_am'   --name considt am in last and have 1 char at starting can be any char

select * from newtable 
where name like '______'--we can use while selecting any perticular length like 6

select * from newtable
where name like '%[^d]' ---name not ends with d

select * from newtable
where age between 25 and 29  -- age between 25 t0 29

select * from newtable
where age between 29 and 29 --only  age = 29

select * from newtable
where age in (23,30,32,31,3) -- age in values

select * from newtable
where name in ('Sarah','Sophia','Olivia') ---name in these name