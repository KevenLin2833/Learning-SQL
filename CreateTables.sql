create table students
(
	snum integer unique, 
	ssn integer primary key, 
	name varchar(10), 
	gender varchar(1), 
	dob datetime, 
	c_addr varchar(20), 
	c_phone varchar(10), 
	p_addr varchar(20), 
	p_phone varchar(10)
);

create table departments
(
	code integer primary key, 
	name varchar(50) unique, 
	phone varchar(10), 
	college varchar(20)
);

create table degrees
(
	name varchar(50), 
	level varchar(5), 
	department_code integer,
	PRIMARY KEY(name, level)
);

alter table degrees 
add FOREIGN KEY (department_code) references departments(code);

create table courses
(
	number integer PRIMARY KEY, 
	name varchar(50) UNIQUE, 
	description varchar(50), 
	credithours integer, 
	level varchar(20), 
	department_code integer
);

alter table courses 
add FOREIGN KEY (department_code) references departments (code);




create table register
(
	snum integer, 
	course_number integer, 
	regtime varchar(20), 
	grade integer,
	PRIMARY KEY(snum, course_number)
);

alter table register
add FOREIGN KEY (snum) references students(snum);

alter table register
add FOREIGN KEY (course_number) references courses (number);

create table major
(
	snum integer, 
	name varchar(50), 
	level varchar(5),
	PRIMARY KEY (snum, name, level)
);

alter table major 
add FOREIGN KEY (snum) references students(snum);
alter table major 
add FOREIGN KEY (name, level) references degrees(name, level);

create table minor
(
	snum integer, 
	name varchar(50), 
	level varchar(5)
	PRIMARY KEY (snum, name, level)
);

alter table minor 
add FOREIGN KEY (snum) references students(snum);
alter table minor 
add FOREIGN KEY (name, level) references degrees(name, level);