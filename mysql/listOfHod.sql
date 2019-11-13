use cms;

select departments.title, lecturers.fname, lecturers.lname
from departments
inner join lecturers
on departments.hod_id = lecturers.employee_id; 