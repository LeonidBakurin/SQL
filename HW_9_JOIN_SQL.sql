--1. Наполнить таблицу roles_employee 40 строками:

select employees.employee_name, salary.monthly_salary from employee_salary
join employees on  employee_id = employees.id
join salary on salary_id  = salary.id; 

--2. Вывести всех работников у которых ЗП меньше 2000.

select employees.employee_name from employee_salary es 
join employees on employee_id = employees.id
join salary on salary_id = salary.id 
where salary.monthly_salary < 2000;

--3. Вывести все зарплатные позиции, но работник по ним не назначен. (ЗП есть, но не понятно кто её получает.)

--Первый вариант(эта зп никому не назначена)
select  salary.monthly_salary  from salary
left join  employee_salary on salary.id = employee_salary.salary_id
where employee_salary.employee_id is null ;

--Второй вариант(эта зп назначена, но не понятно кому)
select salary.monthly_salary  from employee_salary
left join employees on employee_salary.employee_id  = employees.id 
join salary on employee_salary.salary_id = salary.id
where employee_name is null;

--Треттий вариант зп не назначена никому и зп назначено но непонятно кто её получает 
select salary.monthly_salary from employee_salary
left join employees on employee_id = employees.id 
right join salary on salary_id = salary.id 
where employees.employee_name is null;

--4. Вывести все зарплатные позиции  меньше 2000 но работник по ним не назначен. (ЗП есть, но не понятно кто её получает.)

--Первый вариант(эта зп никому не назначена)
select  salary.monthly_salary  from salary
left join  employee_salary on salary.id = employee_salary.salary_id
where employee_salary.employee_id is null and salary.monthly_salary < 2000 ;

--Второй вариант(эта зп назначена, но не понятно кому)
select salary.monthly_salary  from employee_salary
left join employees on employee_salary.employee_id  = employees.id 
join salary on employee_salary.salary_id = salary.id
where employee_name is null and salary.monthly_salary < 2000;

--Треттий вариант зп не назначена никому и зп назначено но непонятно кто её получает
select salary.monthly_salary from employee_salary
left join employees on employee_id = employees.id 
right join salary on salary_id = salary.id 
where employees.employee_name is null and salary.monthly_salary < 2000; 

--5. Найти всех работников кому не начислена ЗП..

select employees.employee_name from employees
left join employee_salary on employees.id = employee_salary.employee_id 
where employee_salary.salary_id is null group by employees.id;

--6. Вывести всех работников с названиями их должности.

select employees.employee_name, roles.role_name from roles_employee
join employees on roles_employee.employee_id = employees.id 
join roles on roles_employee.role_id = roles.id;

--7. Вывести имена и должность только Java разработчиков.

select employees.employee_name, roles.role_name from roles_employee
join employees on roles_employee.employee_id = employees.id 
join roles on roles_employee.role_id = roles.id
where roles.role_name like '%Java dev%';

--8. Вывести имена и должность только Python разработчиков.

select employees.employee_name, roles.role_name from roles_employee
join employees on roles_employee.employee_id = employees.id 
join roles on roles_employee.role_id = roles.id
where roles.role_name like '%Python dev%';

--9. Вывести имена и должность всех QA инженеров.

select employees.employee_name, roles.role_name from roles_employee
join employees on roles_employee.employee_id = employees.id 
join roles on roles_employee.role_id = roles.id
where roles.role_name like '%QA%';

--10. Вывести имена и должность ручных QA инженеров.

select employees.employee_name, roles.role_name from roles_employee
join employees on roles_employee.employee_id = employees.id 
join roles on roles_employee.role_id = roles.id
where roles.role_name like '%Manual%QA%';

--11. Вывести имена и должность автоматизаторов QA

select employees.employee_name, roles.role_name from roles_employee
join employees on roles_employee.employee_id = employees.id 
join roles on roles_employee.role_id = roles.id
where roles.role_name like '%Automat%QA%';

--12. Вывести имена и зарплаты Junior специалистов

select employees.employee_name, salary.monthly_salary from employee_salary
full join roles_employee on employee_salary.employee_id = roles_employee.employee_id
full join employees on employee_salary.employee_id = employees.id
full join salary on salary.id = employee_salary.salary_id 
full join roles on roles.id = roles_employee.role_id
where roles.role_name like '%Junior%';

--13. Вывести имена и зарплаты Middle специалистов

select employees.employee_name, salary.monthly_salary from employee_salary
full join roles_employee on employee_salary.employee_id = roles_employee.employee_id
full join employees on employee_salary.employee_id = employees.id
full join salary on salary.id = employee_salary.salary_id 
full join roles on roles.id = roles_employee.role_id
where roles.role_name like '%Middle%';

--14. Вывести имена и зарплаты Senior специалистов

select employees.employee_name, salary.monthly_salary from employee_salary
full join roles_employee on employee_salary.employee_id = roles_employee.employee_id
full join employees on employee_salary.employee_id = employees.id
full join salary on salary.id = employee_salary.salary_id 
full join roles on roles.id = roles_employee.role_id
where roles.role_name like '%Senior%';

--15. Вывести зарплаты Java разработчиков

select distinct salary.monthly_salary from employee_salary
full join roles_employee on employee_salary.employee_id = roles_employee.employee_id
full join salary on salary.id = employee_salary.salary_id 
full join roles on roles.id = roles_employee.role_id
where roles.role_name like '%Java dev%';

--16. Вывести зарплаты Python разработчиков

select distinct salary.monthly_salary from employee_salary
full join roles_employee on employee_salary.employee_id = roles_employee.employee_id
full join salary on salary.id = employee_salary.salary_id 
full join roles on roles.id = roles_employee.role_id
where roles.role_name like '%Python dev%';

--17. Вывести имена и зарплаты Junior Python разработчиков

select  employees.employee_name, salary.monthly_salary from employee_salary
full join roles_employee on employee_salary.employee_id = roles_employee.employee_id
full join employees on employee_salary.employee_id = employees.id
full join salary on salary.id = employee_salary.salary_id 
full join roles on roles.id = roles_employee.role_id
where roles.role_name like '%Junior Python dev%';

--18. Вывести имена и зарплаты Middle JS разработчиков

select  employees.employee_name, salary.monthly_salary from employee_salary
full join roles_employee on employee_salary.employee_id = roles_employee.employee_id
full join employees on employee_salary.employee_id = employees.id
full join salary on salary.id = employee_salary.salary_id 
full join roles on roles.id = roles_employee.role_id
where roles.role_name like '%Middle JavaS% dev%';

--19. Вывести имена и зарплаты Senior Java разработчиков

select  employees.employee_name, salary.monthly_salary from employee_salary
full join roles_employee on employee_salary.employee_id = roles_employee.employee_id
full join employees on employee_salary.employee_id = employees.id
full join salary on salary.id = employee_salary.salary_id 
full join roles on roles.id = roles_employee.role_id
where roles.role_name like 'Senior Java dev%';

--20. Вывести зарплаты Junior QA инженеров

select  employees.employee_name, salary.monthly_salary from employee_salary
full join roles_employee on employee_salary.employee_id = roles_employee.employee_id
full join salary on salary.id = employee_salary.salary_id 
full join roles on roles.id = roles_employee.role_id
where roles.role_name like '%Middle JavaS% dev%';

--21. Вывести среднюю зарплату всех Junior специалистов

select avg(salary.monthly_salary) from employee_salary
full join roles_employee on employee_salary.employee_id = roles_employee.employee_id
full join salary on salary.id = employee_salary.salary_id 
full join roles on roles.id = roles_employee.role_id
where roles.role_name like '%Junior%';

--22. Вывести сумму зарплат JS разработчиков

select sum(salary.monthly_salary) from employee_salary
full join roles_employee on employee_salary.employee_id = roles_employee.employee_id
full join salary on salary.id = employee_salary.salary_id 
full join roles on roles.id = roles_employee.role_id
where roles.role_name like '%JavaS% dev%';

--23. Вывести минимальную ЗП QA инженеров

select min(salary.monthly_salary) from employee_salary
full join roles_employee on employee_salary.employee_id = roles_employee.employee_id
full join salary on salary.id = employee_salary.salary_id 
full join roles on roles.id = roles_employee.role_id
where roles.role_name like '%QA%';

--24. Вывести максимальную ЗП QA инженеров

select max(salary.monthly_salary) from employee_salary
full join roles_employee on employee_salary.employee_id = roles_employee.employee_id
full join salary on salary.id = employee_salary.salary_id 
full join roles on roles.id = roles_employee.role_id
where roles.role_name like '%QA%';

--25. Вывести количество QA инженеров

select count(roles.role_name) from roles_employee
join roles on roles_employee.role_id = roles.id 
where roles.role_name like '%QA%';

--26. Вывести количество Middle специалистов.

select count(roles.role_name) from roles_employee
join roles on roles_employee.role_id = roles.id 
where roles.role_name like '%Middle%';

--27. Вывести количество разработчиков

select count(roles.role_name) from roles_employee
join roles on roles_employee.role_id = roles.id 
where roles.role_name like '%dev%';

--28. Вывести фонд (сумму) зарплаты разработчиков.

select sum(salary.monthly_salary) from employee_salary
full join roles_employee on employee_salary.employee_id = roles_employee.employee_id
full join salary on salary.id = employee_salary.salary_id 
full join roles on roles.id = roles_employee.role_id
where roles.role_name like '%dev%';

--29. Вывести имена, должности и ЗП всех специалистов по возрастанию

select employees.employee_name, roles.role_name, salary.monthly_salary from employee_salary
full join roles_employee on employee_salary.employee_id = roles_employee.employee_id
full join employees on employee_salary.employee_id = employees.id
full join salary on salary.id = employee_salary.salary_id 
full join roles on roles.id = roles_employee.role_id
where not employee_salary.salary_id is null
order by salary.monthly_salary;

--30. Вывести имена, должности и ЗП всех специалистов по возрастанию у специалистов у которых ЗП от 1700 до 2300

select employees.employee_name, roles.role_name, salary.monthly_salary from employee_salary
full join roles_employee on employee_salary.employee_id = roles_employee.employee_id
full join employees on employee_salary.employee_id = employees.id
full join salary on salary.id = employee_salary.salary_id 
full join roles on roles.id = roles_employee.role_id
where not employee_salary.salary_id is null and salary.monthly_salary >= 1700 and salary.monthly_salary < 2300
order by salary.monthly_salary;

--31. Вывести имена, должности и ЗП всех специалистов по возрастанию у специалистов у которых ЗП меньше 2300

select employees.employee_name, roles.role_name, salary.monthly_salary from employee_salary
full join roles_employee on employee_salary.employee_id = roles_employee.employee_id
full join employees on employee_salary.employee_id = employees.id
full join salary on salary.id = employee_salary.salary_id 
full join roles on roles.id = roles_employee.role_id
where not employee_salary.salary_id is null and salary.monthly_salary < 2300
order by salary.monthly_salary desc;

--32. Вывести имена, должности и ЗП всех специалистов по возрастанию у специалистов у которых ЗП равна 1100, 1500, 2000

select employees.employee_name, roles.role_name, salary.monthly_salary from employee_salary
full join roles_employee on employee_salary.employee_id = roles_employee.employee_id
full join employees on employee_salary.employee_id = employees.id
full join salary on salary.id = employee_salary.salary_id 
full join roles on roles.id = roles_employee.role_id
where not employee_salary.salary_id is null and salary.monthly_salary in (1100, 1500, 2000)
order by salary.monthly_salary;
