create view expensiveCourses as

select faculty, courses
from (
	select f.title as faculty, c.fee ,count(c.fee) as courses
	from faculty as f
	inner join courses as c
	on f.faculty_id = c.faculty_id
	group by f.title
	having (fee > 500000) 
) as aliasTable;