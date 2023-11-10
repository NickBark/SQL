select object_name from 
	(select name as object_name 
	from person order by object_name) as person
union all
select pizza_name from 
	(select pizza_name from menu 
	order by pizza_name) as menu;

