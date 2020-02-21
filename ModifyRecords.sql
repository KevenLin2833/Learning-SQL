--1)	Change the name of the student with ssn = 746897816 to Scott

update students
set students.name = 'Scott'
where students.ssn = 746897816;

select students.name
from students
where students.name = 'Scott';


--2)	Change the major of the student with ssn = 746897816 to Computer Science, Master. 

update major
set name = 'Computer Science', level = 'MS'
from major
full outer join students
on major.snum = students.snum
where students.ssn = 746897816;


--3)	Delete all registration records that were in “Spring2015”,

declare @snum_num int;
declare @course_num int;
declare @regTime varchar(20);
set @regTime = 'Spring2015';

delete from register
where register.regtime = 'Spring2015';
delete from students where students.snum = @snum_num;

