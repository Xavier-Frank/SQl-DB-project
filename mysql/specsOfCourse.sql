use cms;

select c.title as course, s.sub1 as subject_1, s.sub2 as subject_2, s.sub3 as subject_3, s.cp as cluster_points
from specs as s
inner join courses as c on s.spec_id = c.spec_id;