use cms;

select dep.department_id, dep.title, dep.faculty_id
from departments as dep
where dep.faculty_id = 1;