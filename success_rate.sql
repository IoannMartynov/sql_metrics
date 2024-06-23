select
    date_trunc('month', date) :: date as time,
    card_type,
    (cast(sum(case when status = 'Success' then 1 else 0 end) as float) / count(*)) * 100 as success_rate
from
    new_payments
where
    mode != 'Undefined'
group by
    date_trunc('month', date),
    mode
order by
    time, mode
