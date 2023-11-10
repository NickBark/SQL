select 
	(select name from person
	where person.id = pv.person_id) 
	as person_name,
	(select name from pizzeria
	where pizzeria.id = pv.pizzeria_id) 
	as pizzeria_name
from (select person_id, pizzeria_id 
	from person_visits 
	where visit_date 
	between '2022_01_07' and '2022_01_09') 
	as pv
order by person_name asc, pizzeria_name desc;
