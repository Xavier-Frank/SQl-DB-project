select d.title as department, count(u.unit_code) as units
from departments as d
inner join units as u
on d.department_id = u.department_id
group by d.title;