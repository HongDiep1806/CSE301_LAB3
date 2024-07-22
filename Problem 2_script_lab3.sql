create database if not exists HRManagement222;
use hrmanagement222;
create table if not exists employees(
employeeID varchar(3),
lastName varchar(20) not null,
middleName varchar(20),
firstName varchar(20) not null,
dateOfBirth date not null,
gender varchar(5) not null,
salary decimal not null,
address varchar(100) not null,
managerID varchar(3),
departmentID int
);
create table if not exists department(
departmentID int primary key,
departmentName varchar(10) not null,
managerID varchar(3),
dateOfEmployment date not null

);

insert into employees
values ('123', 'Dinh', 'Ba', 'Tien', '1995-1-9', 'Nam', 30000, '731 Tran Hung Dao Q1 TPHCM', '333', 5),
('333', 'Nguyen', 'Thanh', 'Tung', '1945-12-8', 'Nam', 40000, '638 Nguyen Van Cu Q5 TPHCM', '888', 5),
('453', 'Tran', 'Thanh', 'Tam', '1962-7-31', 'Nam', 25000, '543 Mai Thi Luu Ba Dinh Ha Noi', '333', 5),
('666', 'Nguyen', 'Manh', 'Hung', '1952-9-15', 'Nam', 38000, '975 Le Lai P3 Vung Tau', '333', 5),
('777', 'Tran', 'Hong', 'Quang', '1959-3-29', 'Nam', 25000, '980 Le Hong Phong Vung Tau', '987', 4),
('888', 'Vuong', 'Ngoc', 'Quyen', '1931-6-20', 'Nu', 55000, '450 Trung Vuong My Tho TG', NULL, 1),
('987', 'Le', 'Thi', 'Nhan', '1931-6-20', 'Nu', 43000, '291 Ho Van Hue Q.PN TPHCM', '888', 4),
('999', 'Bui', 'Thuy', 'Vu', '1958-7-19', 'Nam', 25000, '332 Nguyen Thai Hoc Quy Nhon', '987', 4);
insert into department
values
(1,'Quan ly','888','1971-06-19'),
(4,'Dieu hanh','777','1985-01-01'),
(5,'Nghien cuu','333','1978-05-22');
alter table employees
add primary key (employeeID);
alter table employees
add foreign key (departmentID) references department(departmentID);
alter table employees
add foreign key(managerID) references employees(employeeID);
select * from employees;
select * from department;
create table if not exists departmentaddress(
departmentID int,
address varchar(30)
);
insert into departmentaddress
values
(1,'TP HCM'),
(4,'HA NOI'),
(5,'NHA TRANG'),
(5,'TP HCM'),
(5,'VUNG TAU');
alter table departmentaddress
add primary key(departmentID,address);
alter table departmentaddress
add foreign key (departmentID) references department(departmentID);
create table if not exists projects(
projectID int primary key,
projectName varchar(30) not null,
projectAddress varchar(100) not null,
departmentID int,
foreign key (departmentID) references department(departmentID)

);
insert into projects
values
(1,'San pham X','VUNG TAU',5),
(2,'San pham Y','NHA TRANG',5),
(3,'San pham Z','TP HCM',5),
(10,'Tin hoc hoa','HA NOI',4),
(20,'Cap Quang','TP HCM',1),
(30,'Dao tao','HA NOI',4);

create table if not exists assignments(
employeeID varchar(3),
projectID int,
workingHour float null,
primary key(employeeID,projectID),
foreign key(employeeID) references employees(employeeID),
foreign key(projectID) references projects(projectID)
);
insert into assignments
values ('123', 1, 22.5),
('123', 2, 7.5),
('123', 3, 10),
('333', 10, 10),
('333', 20, 10),
('453', 1, 20),
('453', 2, 20),
('666', 3, 40),
('888', 20, 0),
('987', 20, 15);

create table if not exists relative(
employeeID varchar(3),
relativeName varchar(50),
gender varchar(5) not null,
dateOfBirth date,
relationship varchar(30) not null,
primary key(employeeID,relativeName),
foreign key(employeeID) references employees(employeeID)

);
insert into relative
values ('123', 'Chau', 'Nu', '1978-12-31', 'Con gai'),
('123', 'Duy', 'Nam', '1978-1-1', 'Con trai'),
('123', 'Phuong', 'Nu', '1957-5-5', 'Vo chong'),
('333', 'Duong', 'Nu', '1948-5-3', 'Vo chong'),
('333', 'Quang', 'Nu', '1976-4-5', 'Con gai'),
('333', 'Tung', 'Nam', '1973-10-25', 'Con trai'),
('987', 'Dang', 'Nam', '1932-2-29', 'Vo chong');


