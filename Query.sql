--1)	The student number and ssn of the student whose name is "Becky"
select snum, ssn
from students
where name = 'Becky';

--2)	The major name and major level of the student whose ssn is 123097834

select major.name, major.level
From major
Full outer join students
on major.snum = students.snum
where students.ssn = 123097834;

--3)	The names of all courses offered by the department of Computer Science

select courses.name 
from courses
full outer join departments
on courses.department_code = departments.code
where departments.name = 'Computer Science';

--4)	All degree names and levels offered by the department Computer Science

select degrees.name, degrees.level
from degrees
full outer join departments
on degrees.department_code = departments.code
where departments.name = 'Computer Science';

--5)	The names of all students who have a minor

select students.name 
from students full outer join minor 
on students.snum = minor.snum 
where minor.snum = students.snum;

--6)	The number of students who have a minor

select COUNT (students.name) 
from students full outer join minor
on students.snum = minor.snum
where minor.snum = students.snum;

--7)	The names and numbers of all students enrolled in course “Algorithm”
	
select students.name, students.snum
from students
full outer join register 
on students.snum = register.snum
full outer join courses
on register.course_number = courses.number
where courses.name = 'Algorithm';

--8)	The name and snum of the oldest student

select top 1 students.name, students.snum
from students
order by students.dob;

--9)	The name and snum of the youngest student

select top 1 students.name, students.snum
from students
where students.dob = (select MAX (students.dob) from students);

--10)	The name, snum and SSN of the students whose name contains letter “n” or “N”

select students.name, students.snum, students.ssn
from students
where students.name like '%n%' or students.name like '%N%';

--11)	The name, snum and SSN of the students whose name does not contain letter “n” or “N”

select students.name, students.snum, students.ssn
from students
where students.name not like '%n%' or students.name not like '%N%';

--12)	The course number, name and the number of students registered for each course

select courses.number, courses.name, COUNT(students.name) 
from courses
full outer join register
on courses.number = register.course_number
full outer join students
on register.snum = students.snum
where courses.name <> ''
group by courses.number, courses.name, students.name;

--13)	The name of the students enrolled in Fall2015 semester.

select students.name
from students
full outer join register
on students.snum = register.snum
where register.regtime = 'Fall2015';

--14)	The course numbers and names of all courses offered by Department of Computer Science

select courses.number, courses.name
from courses
full outer join departments
on courses.department_code = departments.code
where departments.name = 'Computer Science';

--15)	The course numbers and names of all courses offered by either Department of Computer Science or Department of Landscape Architect.

select courses.number, courses.name
from courses
full outer join departments
on courses.department_code = departments.code
where departments.name = 'Computer Science' or departments.name = 'Landscape Architect';