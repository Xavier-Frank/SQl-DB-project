select d.title as department, count(l.employee_id) as lecturers
from departments as d
inner join lecturers as l
on d.department_id = l.department_id
group by d.title;