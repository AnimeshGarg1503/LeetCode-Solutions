# Write your MySQL query statement below
select u.name as NAME, sum(amount) as BALANCE
from transactions t join users u on t.account = u.account
group by t.account, u.name
having sum(t.amount) > 10000