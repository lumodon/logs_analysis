create or replace view error_list as
select count(*) as error_request_count, DATE(time) as e_date
from log
where status not like '%2__%'
group by e_date
order by error_request_count desc;

create or replace view accept_list as
select count(*) as accept_request_count, DATE(time) as a_date
from log
where status like '%2__%'
group by a_date
order by accept_request_count desc;

create or replace view error_percents as
select
  CAST(
    ROUND(
      cast(error_request_count as FLOAT) / cast(accept_request_count as FLOAT)
      * 10000.0
    ) / 100.0 as VARCHAR(8)
  ) || '%' as percentage_error,
  e_date as date
from error_list join accept_list
on e_date = a_date;

select TO_CHAR(date :: DATE, 'Mon dd, yyyy'), CAST(percentage_error as VARCHAR(16)) || ' errors'
from error_percents
where CAST(substring(percentage_error, 1, length(percentage_error) - 1) as FLOAT) > 1.0;
