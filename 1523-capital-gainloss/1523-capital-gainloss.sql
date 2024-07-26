# Write your MySQL query statement below
with impact_table as (select stock_name, operation,
    case 
        when operation = 'Buy' then (0-price)
        when operation = 'Sell' then price
    end as price_impact
from stocks)

select stock_name, sum(price_impact) as capital_gain_loss
from impact_table
group by stock_name