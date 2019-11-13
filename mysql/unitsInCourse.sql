use cms;

select units.unit_code, units.title, units.duration, units.cf 
from units
where unit_code in (
	select courses_has_units.unit_code
    from courses_has_units
    where courses_has_units.course_id = 1
);