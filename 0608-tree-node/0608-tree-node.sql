-- # Write your MySQL query statement below
with root_query as (select id,
    case 
        when p_id is null then 'Root'
    end as type
from tree
where p_id is null),

leaf_query as (
select id, 
    case 
        when id then 'Leaf'
    end as type
from tree 
where id not in (select p_id from tree where p_id is not null) and p_id is not null
), 

inner_query as (
select distinct t1.id, 
    case 
        when t1.id then 'Inner'
    end as type
from tree t1 join tree t2 on t1.id=t2.p_id
where t1.p_id is not null
)

select * 
from (
select * from root_query

union 

select * from leaf_query

union 

select * from inner_query) as final_query
order by id