select distinct id from person_visits 
where (visit_date between '2022-01-06' and '2022-01-09') or id = 2
order by id desc;
