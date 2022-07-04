--1)Создать таблицу employees
-- id. serial,  primary key,
-- employee_name. Varchar(50), not null

create table employees(
	id serial primary key,
	employee_name varchar(50) not null
);

select * from employees;

--2)Наполнить таблицу employee 70 строками.
insert into employees(employee_name)
values  ('Bakurin_1'),
		('Bakurin_2'),
		('Bakurin_3'),
		('Bakurin_4'),
		('Bakurin_5'),
		('Bakurin_6'),
		('Bakurin_7'),
		('Bakurin_8'),
		('Bakurin_9'),
		('Bakurin_10'),
		('Bakurin_11'),
		('Bakurin_12'),
		('Bakurin_13'),
		('Bakurin_14'),
		('Bakurin_15'),
		('Bakurin_16'),
		('Bakurin_17'),
		('Bakurin_18'),
		('Bakurin_19'),
		('Bakurin_20'),
		('Bakurin_21'),
		('Bakurin_22'),
		('Bakurin_23'),
		('Bakurin_24'),
		('Bakurin_25'),
		('Bakurin_26'),
		('Bakurin_27'),
		('Bakurin_28'),
		('Bakurin_29'),
		('Bakurin_30'),
		('Bakurin_31'),
		('Bakurin_32'),
		('Bakurin_33'),
		('Bakurin_34'),
		('Bakurin_35'),
		('Bakurin_36'),
		('Bakurin_37'),
		('Bakurin_38'),
		('Bakurin_39'),
		('Bakurin_40'),
		('Bakurin_41'),
		('Bakurin_42'),
		('Bakurin_43'),
		('Bakurin_44'),
		('Bakurin_45'),
		('Bakurin_46'),
		('Bakurin_47'),
		('Bakurin_48'),
		('Bakurin_49'),
		('Bakurin_50'),
		('Bakurin_51'),
		('Bakurin_52'),
		('Bakurin_53'),
		('Bakurin_54'),
		('Bakurin_55'),
		('Bakurin_56'),
		('Bakurin_57'),
		('Bakurin_58'),
		('Bakurin_59'),
		('Bakurin_60'),
		('Bakurin_61'),
		('Bakurin_62'),
		('Bakurin_63'),
		('Bakurin_64'),
		('Bakurin_65'),
		('Bakurin_66'),
		('Bakurin_67'),
		('Bakurin_68'),
		('Bakurin_69'),
		('Bakurin_70');
	
select * from employees;

--3)Создать таблицу salary
-- id. Serial  primary key,
-- monthly_salary. Int, not null

create table salary(
	id serial primary key,
	monthly_salary int not null
);

select * from salary;

--4)Наполнить таблицу salary 16 строками: 1000,1100,1200,1300,1400,1500,1600,1700,1800,1900,2000,2100,2200,2300,2400,2500

insert into salary(monthly_salary)
values  (1000),
		(1100),
		(1200),
		(1300),
		(1400),
		(1500),
		(1600),
		(1700),
		(1800),
		(1900),
		(2000),
		(2100),
		(2200),
		(2300),
		(2400),
		(2500);
	
select * from salary;

--5)Создать таблицу employee_salary
-- id. Serial  primary key,
-- employee_id. Int, not null, unique
-- salary_1_id. Int, not null
create table employee_salary(
	id serial primary key,
	employee_id int not null unique,
	salary_id int not null
);

--6)Наполнить таблицу employee_salary 40 строками:
-- в 10 строк из 40 вставить несуществующие employee_id

insert into employee_salary(employee_id, salary_id)
values  (1,7),
		(2,4),
		(3,9),
		(4,13),
		(5,4),
		(6,2),
		(7,10),
		(8,13),
		(9,4),
		(10,1),
		(11,7),
		(12,7),
		(13,4),
		(14,9),
		(15,13),
		(16,4),
		(17,2),
		(18,10),
		(19,13),
		(20,4),
		(21,1),
		(22,7),
		(23,4),
		(24,9),
		(25,13),
		(26,4),
		(27,2),
		(28,10),
		(29,13),
		(30,4),
		(71,2),
		(72,5),
		(73,14),
		(74,16),
		(75,5),
		(76,12),
		(77,10),
		(78,7),
		(79,11),
		(80,13);
select * from employee_salary;

--7)Создать таблицу roles
-- id. Serial  primary key,
-- role_name. int, not null, unique

create table roles(
	id serial primary key,
	role_name int not null unique
);

select * from roles;

--8)Поменять тип столба role_name с int на varchar(30)

alter table roles
alter column role_name type varchar(30);

--9)Создать таблицу roles_employee
--id. Serial  primary key,
--employee_id. Int, not null, unique (внешний ключ для таблицы employees, поле id)
--role_id. Int, not null (внешний ключ для таблицы roles, поле id)


select * from roles;

--9)Наполнить таблицу roles 20 строками:

insert into roles(role_name)
values ('Junior Python developer'),
	   ('Middle Python developer'),
	   ('Senior Python developer'),
	   ('Junior Java developer'),
	   ('Middle Java developer'),
	   ('Senior Java developer'),
	   ('Junior JavaScript developer'),
	   ('Middle JavaScript developer'),
	   ('Senior JavaScript developer'),
	   ('Junior Manual QA engineer'),
	   ('Middle Manual QA engineer'),
	   ('Senior Manual QA engineer'),
	   ('Project Manager'),
	   ('Designer'),
	   ('HR'),
	   ('CEO'),
	   ('Sales manager'),
	   ('Junior Automation QA engineer'),
	   ('Middle Automation QA engineer'),
	   ('Senior Automation QA engineer');

select * from roles;