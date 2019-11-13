use cms;

select faculty.title, lecturers.fname, lecturers.lname
from faculty
inner join lecturers
on faculty.dean_id = lecturers.employee_id; 