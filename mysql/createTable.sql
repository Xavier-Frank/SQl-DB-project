-- create and use a db
create database course_management_system;
use course_management_system;

-- courses table
create table courses(
	course_id int not null primary key,
    title varchar(40) unique not null,
    duration int ,
    fee decimal(10, 2) not null
); 
 
-- units table
create table units (
	unit_code int not null primary key,
	title varchar(40) unique not null,
    duration int not null,
    cf int not null
); 

-- faculty table, dean is created later
create table faculty (
	faculty_id int not null primary key,
    title varchar(40) unique not null,
    date_since date
); 

-- department , hod is created later
create table departments(
	department_id int not null primary key,
    title varchar(40) unique not null,
    date_since date
);

-- lecturers table 
 create table lecturers(
	employee_id int not null primary key,
    fname varchar(40) not null,
    mname varchar(40) ,
    lname varchar(40) not null
 );
 
 -- specs table 
 create table specs (
	spec_id int not null primary key,
    sub1 varchar(20) not null,
    sub2 varchar(20) not null,
    sub3 varchar(20) not null,
    cp int not null
 );
 
 -- course contains some units 
 create table course_has_units(
	course_id int references courses(course_id) on delete cascade,
    unit_id int references units(unit_code) on delete cascade,
    primary key(course_id, unit_id)
 );
 
 -- lecturer lectures a unit
 create table lecturer_lectures_unit(
	lecturer_id int references lecturers(employee_id) on delete cascade,
    unit_code int references units(unite_code) on delete cascade,
    primary key(lecturer_id, unit_code)
 );
 
 -- altering tables to add the foreign keys 
alter table courses add column faculty_id int references faculty(faculty_id) on delete cascade;
alter table courses add column specs_id int references specs(specs_id) on delete set null; 
alter table units add column department_id int references departments(department_id) on delete cascade;
alter table departments add column faculty_id int references faculty(faculty_id) on delete cascade;
alter table lecturers add column department_id int references departments(department_id) on delete cascade;
alter table faculty add column dean_id int references lectures(employe_id) on delete set null;
alter table departments add column hod_id int references lecturers(employee_id) on delete set null;