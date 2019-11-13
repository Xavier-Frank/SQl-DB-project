use cms;

delete from faculty;
delete from specs;
delete from courses;
delete from units;
delete from departments;
delete from lecturers;
delete from lecturer_lectures_units;
delete from courses_has_units;

insert into cms.faculty
values (1, 'Science', null, null),
	   (2, 'Agriculture', null, null),
	   (3, 'FEDCOS', null, null),
       (4,'Horticulture',null ,null),
       (5,'FASS', null, null),
       (6, 'Health Science', null, null),
       (7, 'Enginering', null, null);
       
 insert into cms.specs
 values( 1, 'Maths', 'Phyc', 'Eng/Kis', 69),
	   ( 2, 'Math', 'Phyc', 'Chem', 59),
       ( 3, 'Bio', 'Chem', 'Phyc', 74),
       ( 4, 'Bio', 'Chem', 'Phyc', 70);
       
insert into cms.courses 
values(1, 'Computer Science', 4, 650000.00, 1, 1),
	  (2, 'Medicine and Surgery', 6, 750000.00, 6, 3),
      (3, 'Education Science', 4, 120000.50, 3, 2),
      (4, 'Acturial Science', 4, 350000.00, 1, 1),
      (5, 'Nursing', 6, 700000.00, 6, 4);

insert into cms.departments
values(1, 'Computer Science', 4 ,null, 1),
	  (2, 'Nursing', null, null, 6 ),
	  (3, 'Education Science', null, null, 3),
      (4, 'Mathematics', null, null, 1),
      (5, 'Geography', null, null, 1);

      
insert into cms.units
values(1 , 'Basic Circuit', 45, 7, 1),
	  (2, 'Anatomy' , 70, 5, 2),
      (3, 'Psychology', 15, 3, 3),
	  (361, 'Login Design', 50, 4, 1),
      (381, 'OOSAD', 45, 4, 1),
      (281, 'OOP', 45, 4, 1),
      (101, 'Philosophy', 30, 3, 3);      
insert into cms.lecturers
values (1, 'Jones', 'kioko', 'Katiku', 1),
	   (2, 'Mary', 'Atieno','Okumu', 3),
       (3, 'Colins', 'Kirui', 'Korir', 2),
       (4, 'Pheobe', 'Ongallo','S', 1),
       (5, 'Oloo', 'Owino', 'Puga', 5),
       (6, 'Benja', 'Odiyo', 'O.', 1),
       (7, 'Dancun', 'Ayemba', 'Petro', 2);

insert into lecturer_lectures_units 
values(1,361),
	  (6,381),
      (6, 281);
      
insert into courses_has_units 
values (1, 381),
	   (1, 281),
       (1, 101),
       (2, 2),
       (2, 3),
       (2, 101),
       (5, 2),
       (5, 3),
       (5, 101);