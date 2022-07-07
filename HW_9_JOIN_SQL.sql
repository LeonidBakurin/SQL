--1. ������� ���� ���������� ��� �������� ���� � ����, ������ � ����������.

select employees.employee_name, salary.monthly_salary from employee_salary
join employees on  employee_id = employees.id
join salary on salary_id  = salary.id; 

--2. ������� ���� ���������� � ������� �� ������ 2000.

select employees.employee_name from employee_salary es 
join employees on employee_id = employees.id
join salary on salary_id = salary.id 
where salary.monthly_salary < 2000;

--3. ������� ��� ���������� �������, �� �������� �� ��� �� ��������. (�� ����, �� �� ������� ��� � ��������.)
--employees.employee_name, salary.monthly_salary

--������ �������(��� �� ������ �� ���������)
select  salary.monthly_salary  from salary
left join  employee_salary on salary.id = employee_salary.salary_id
where employee_salary.employee_id is null ;

--������ �������(��� �� ���������, �� �� ������� ����)
select salary.monthly_salary  from employee_salary
left join employees on employee_salary.employee_id  = employees.id 
join salary on employee_salary.salary_id = salary.id
where employee_name is null;

--������� ������� �� �� ��������� ������ � �� ��������� �� ��������� ��� � �������� 
select salary.monthly_salary from employee_salary
left join employees on employee_id = employees.id 
right join salary on salary_id = salary.id 
where employees.employee_name is null;

--4. ������� ��� ���������� �������  ������ 2000 �� �������� �� ��� �� ��������. (�� ����, �� �� ������� ��� � ��������.)

--������ �������(��� �� ������ �� ���������)
select  salary.monthly_salary  from salary
left join  employee_salary on salary.id = employee_salary.salary_id
where employee_salary.employee_id is null and salary.monthly_salary < 2000 ;

--������ �������(��� �� ���������, �� �� ������� ����)
select salary.monthly_salary  from employee_salary
left join employees on employee_salary.employee_id  = employees.id 
join salary on employee_salary.salary_id = salary.id
where employee_name is null and salary.monthly_salary < 2000;

--������� ������� �� �� ��������� ������ � �� ��������� �� ��������� ��� � �������� 
select salary.monthly_salary from employee_salary
left join employees on employee_id = employees.id 
right join salary on salary_id = salary.id 
where employees.employee_name is null and salary.monthly_salary < 2000; 

--5. ����� ���� ���������� ���� �� ��������� ��.

select employees.employee_name from employees
left join employee_salary on employees.id = employee_salary.employee_id 
where employee_salary.salary_id is null group by employees.id;

--6. ������� ���� ���������� � ���������� �� ���������.

select employees.employee_name, roles.role_name from roles_employee
join employees on roles_employee.employee_id = employees.id 
join roles on roles_employee.role_id = roles.id;

--7. ������� ����� � ��������� ������ Java �������������.

select employees.employee_name, roles.role_name from roles_employee
join employees on roles_employee.employee_id = employees.id 
join roles on roles_employee.role_id = roles.id
where roles.role_name like '%Java dev%';

--8. ������� ����� � ��������� ������ Python �������������.

select employees.employee_name, roles.role_name from roles_employee
join employees on roles_employee.employee_id = employees.id 
join roles on roles_employee.role_id = roles.id
where roles.role_name like '%Python dev%';

--9. ������� ����� � ��������� ���� QA ���������.

select employees.employee_name, roles.role_name from roles_employee
join employees on roles_employee.employee_id = employees.id 
join roles on roles_employee.role_id = roles.id
where roles.role_name like '%QA%';

--10. ������� ����� � ��������� ������ QA ���������.

select employees.employee_name, roles.role_name from roles_employee
join employees on roles_employee.employee_id = employees.id 
join roles on roles_employee.role_id = roles.id
where roles.role_name like '%Manual%QA%';

--11. ������� ����� � ��������� ��������������� QA

select employees.employee_name, roles.role_name from roles_employee
join employees on roles_employee.employee_id = employees.id 
join roles on roles_employee.role_id = roles.id
where roles.role_name like '%Automat%QA%';

--12. ������� ����� � �������� Junior ������������

select employees.employee_name, salary.monthly_salary from employee_salary
full join roles_employee on employee_salary.employee_id = roles_employee.employee_id
full join employees on employee_salary.employee_id = employees.id
full join salary on salary.id = employee_salary.salary_id 
full join roles on roles.id = roles_employee.role_id
where roles.role_name like '%Junior%';

--13. ������� ����� � �������� Middle ������������

select employees.employee_name, salary.monthly_salary from employee_salary
full join roles_employee on employee_salary.employee_id = roles_employee.employee_id
full join employees on employee_salary.employee_id = employees.id
full join salary on salary.id = employee_salary.salary_id 
full join roles on roles.id = roles_employee.role_id
where roles.role_name like '%Middle%';

--14. ������� ����� � �������� Senior ������������

select employees.employee_name, salary.monthly_salary from employee_salary
full join roles_employee on employee_salary.employee_id = roles_employee.employee_id
full join employees on employee_salary.employee_id = employees.id
full join salary on salary.id = employee_salary.salary_id 
full join roles on roles.id = roles_employee.role_id
where roles.role_name like '%Senior%';

--15. ������� �������� Java �������������

select distinct salary.monthly_salary from employee_salary
full join roles_employee on employee_salary.employee_id = roles_employee.employee_id
full join salary on salary.id = employee_salary.salary_id 
full join roles on roles.id = roles_employee.role_id
where roles.role_name like '%Java dev%';

--16. ������� �������� Python �������������

select distinct salary.monthly_salary from employee_salary
full join roles_employee on employee_salary.employee_id = roles_employee.employee_id
full join salary on salary.id = employee_salary.salary_id 
full join roles on roles.id = roles_employee.role_id
where roles.role_name like '%Python dev%';

--17. ������� ����� � �������� Junior Python �������������

select  employees.employee_name, salary.monthly_salary from employee_salary
full join roles_employee on employee_salary.employee_id = roles_employee.employee_id
full join employees on employee_salary.employee_id = employees.id
full join salary on salary.id = employee_salary.salary_id 
full join roles on roles.id = roles_employee.role_id
where roles.role_name like '%Junior Python dev%';

--18. ������� ����� � �������� Middle JS �������������

select  employees.employee_name, salary.monthly_salary from employee_salary
full join roles_employee on employee_salary.employee_id = roles_employee.employee_id
full join employees on employee_salary.employee_id = employees.id
full join salary on salary.id = employee_salary.salary_id 
full join roles on roles.id = roles_employee.role_id
where roles.role_name like '%Middle JavaS% dev%';

--19. ������� ����� � �������� Senior Java �������������

select  employees.employee_name, salary.monthly_salary from employee_salary
full join roles_employee on employee_salary.employee_id = roles_employee.employee_id
full join employees on employee_salary.employee_id = employees.id
full join salary on salary.id = employee_salary.salary_id 
full join roles on roles.id = roles_employee.role_id
where roles.role_name like 'Senior Java dev%';

--20. ������� �������� Junior QA ���������

select  employees.employee_name, salary.monthly_salary from employee_salary
full join roles_employee on employee_salary.employee_id = roles_employee.employee_id
full join salary on salary.id = employee_salary.salary_id 
full join roles on roles.id = roles_employee.role_id
where roles.role_name like '%Middle JavaS% dev%';

--21. ������� ������� �������� ���� Junior ������������

select avg(salary.monthly_salary) from employee_salary
full join roles_employee on employee_salary.employee_id = roles_employee.employee_id
full join salary on salary.id = employee_salary.salary_id 
full join roles on roles.id = roles_employee.role_id
where roles.role_name like '%Junior%';

--22. ������� ����� ������� JS �������������

select sum(salary.monthly_salary) from employee_salary
full join roles_employee on employee_salary.employee_id = roles_employee.employee_id
full join salary on salary.id = employee_salary.salary_id 
full join roles on roles.id = roles_employee.role_id
where roles.role_name like '%JavaS% dev%';

--23. ������� ����������� �� QA ���������

select min(salary.monthly_salary) from employee_salary
full join roles_employee on employee_salary.employee_id = roles_employee.employee_id
full join salary on salary.id = employee_salary.salary_id 
full join roles on roles.id = roles_employee.role_id
where roles.role_name like '%QA%';

--24. ������� ������������ �� QA ���������

select max(salary.monthly_salary) from employee_salary
full join roles_employee on employee_salary.employee_id = roles_employee.employee_id
full join salary on salary.id = employee_salary.salary_id 
full join roles on roles.id = roles_employee.role_id
where roles.role_name like '%QA%';

--25. ������� ���������� QA ���������

select count(roles.role_name) from roles_employee
join roles on roles_employee.role_id = roles.id 
where roles.role_name like '%QA%';

--26. ������� ���������� Middle ������������.

select count(roles.role_name) from roles_employee
join roles on roles_employee.role_id = roles.id 
where roles.role_name like '%Middle%';

--27. ������� ���������� �������������

select count(roles.role_name) from roles_employee
join roles on roles_employee.role_id = roles.id 
where roles.role_name like '%dev%';

--28. ������� ���� (�����) �������� �������������.

select sum(salary.monthly_salary) from employee_salary
full join roles_employee on employee_salary.employee_id = roles_employee.employee_id
full join salary on salary.id = employee_salary.salary_id 
full join roles on roles.id = roles_employee.role_id
where roles.role_name like '%dev%';

--29. ������� �����, ��������� � �� ���� ������������ �� �����������

select employees.employee_name, roles.role_name, salary.monthly_salary from employee_salary
full join roles_employee on employee_salary.employee_id = roles_employee.employee_id
full join employees on employee_salary.employee_id = employees.id
full join salary on salary.id = employee_salary.salary_id 
full join roles on roles.id = roles_employee.role_id
where not employee_salary.salary_id is null
order by salary.monthly_salary;

--30. ������� �����, ��������� � �� ���� ������������ �� ����������� � ������������ � ������� �� �� 1700 �� 2300

select employees.employee_name, roles.role_name, salary.monthly_salary from employee_salary
full join roles_employee on employee_salary.employee_id = roles_employee.employee_id
full join employees on employee_salary.employee_id = employees.id
full join salary on salary.id = employee_salary.salary_id 
full join roles on roles.id = roles_employee.role_id
where not employee_salary.salary_id is null and salary.monthly_salary >= 1700 and salary.monthly_salary < 2300
order by salary.monthly_salary;

--31. ������� �����, ��������� � �� ���� ������������ �� ����������� � ������������ � ������� �� ������ 2300

select employees.employee_name, roles.role_name, salary.monthly_salary from employee_salary
full join roles_employee on employee_salary.employee_id = roles_employee.employee_id
full join employees on employee_salary.employee_id = employees.id
full join salary on salary.id = employee_salary.salary_id 
full join roles on roles.id = roles_employee.role_id
where not employee_salary.salary_id is null and salary.monthly_salary < 2300
order by salary.monthly_salary desc;

--32. ������� �����, ��������� � �� ���� ������������ �� ����������� � ������������ � ������� �� ����� 1100, 1500, 2000

select employees.employee_name, roles.role_name, salary.monthly_salary from employee_salary
full join roles_employee on employee_salary.employee_id = roles_employee.employee_id
full join employees on employee_salary.employee_id = employees.id
full join salary on salary.id = employee_salary.salary_id 
full join roles on roles.id = roles_employee.role_id
where not employee_salary.salary_id is null and salary.monthly_salary in (1100, 1500, 2000)
order by salary.monthly_salary;
