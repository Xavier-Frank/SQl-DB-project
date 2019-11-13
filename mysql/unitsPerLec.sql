select l.employee_id as codes, l.fname
from lecturers as l
where l.employee_id =  1

union

select u.unit_code, u.title
from units as u
where u.unit_code in (
	select ll.unit_code
    from lecturer_lectures_units as ll
    where ll.employee_id = 1
);

-- 
