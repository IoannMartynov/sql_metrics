select
    date_trunc('month', date) :: date as time,
    mode,
    (cast(sum(case when status = 'Success' then 1 else 0 end) as float) / count(*)) * 100 as success_rate
from
    new_payments
where
    mode != 'Не определено'
group by
    date_trunc('month', date),
    mode
order by
    time, mode
