create view earnings as

select f.title as faculty, sum(c.fee) as earnings
from faculty as f
inner join courses as c 
on f.faculty_id = c.faculty_id
group by f.title;

