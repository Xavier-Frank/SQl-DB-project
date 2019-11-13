use cms;

select d.title as department, l.fname as first_name, l.lname as last_name
from departments as d
inner join lecturers as l on d.department_id = l.department_id;