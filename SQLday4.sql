--Q1. https://leetcode.com/problems/tree-node/description/?envType=study-plan&id=sql-i

use practice

create table tree(id integer,p_id integer)
insert into tree (id,p_id)
values (1,null),(2,1),(3,1),(4,2),(5,2)

  SELECT id, 'Root' AS type
  FROM tree
  WHERE p_id IS NULL
union 
 (
  SELECT id, 'Leaf' AS type
  FROM tree
  WHERE id NOT IN (
    SELECT DISTINCT p_id
    FROM tree
    WHERE p_id IS NOT NULL
  ) 
  AND p_id IS NOT NULL
union
  SELECT id, 'Inner' AS type
  FROM tree
  WHERE id IN (
    SELECT DISTINCT p_id
    FROM tree
    WHERE p_id IS NOT NULL
  ) 
  AND p_id IS NOT NULL
)
ORDER BY id;

Q2
--https://leetcode.com/problems/second-highest-salary/?envType=study-plan&id=sql-i
--Write an SQL query to report the second highest salary from the Employee table. If there is no second highest salary, the query should report null.

select max(salary) as SecondHighestSalary
from employee
where salary <(select max(salary) from employee)
