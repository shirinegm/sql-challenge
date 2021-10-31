-- 1 - List the following details of each employee: employee number, last name, first name, sex, and salary.
select e.emp_no as "Employee Number", last_name as "Last Name", first_name as "First Name", sex as "Sex", s.salary as "Salary" 
from employees e
inner join salaries s on e.emp_no = s.emp_no;

-- 2 - List first name, last name, and hire date for employees who were hired in 1986.
select last_name as "Last Name", first_name as "First Name", hire_date as "Hire Date"
from employees
where extract(year from hire_date) = '1986';

-- 3 - List the manager of each department with the following information: department number, department name, the manager's employee number, last name, first name.
select m.dept_no as "Department No.", d.dept_name as "Department Name", e.emp_no as "Manager Employee No.", e.last_name as "Last Name", e.first_name as "First Name"
from dept_manager m
inner join employees e on m.emp_no = e.emp_no
inner join departments d on m.dept_no = d.dept_no

-- 4 - List the department of each employee with the following information: employee number, last name, first name, and department name.
select e.emp_no as "Employee No.", e.last_name as "Last Name", e.first_name as "First Name", d.dept_name as "Department Name"
from employees e
inner join dept_emp de on e.emp_no = de.emp_no
inner join departments d on de.dept_no = d.dept_no;

-- 5 - List first name, last name, and sex for employees whose first name is "Hercules" and last names begin with "B."
select first_name as "First Name", last_name as "Last Name", sex as "Sex"
from employees
where first_name = 'Hercules'
and last_name LIKE 'B%'

-- 6 - List all employees in the Sales department, including their employee number, last name, first name, and department name.
select emp_no as "Employee No.", last_name as "Last Name", first_name as "First Name", 'Sales' as "Department Name" 
from employees
where emp_no in (
	select emp_no
	from dept_emp
	where dept_no in (
		select dept_no
		from departments
		where dept_name = 'Sales'
	)
);

-- 7 - List all employees in the Sales and Development departments, including their employee number, last name, first name, and department name.
select e.emp_no as "Employee No.", last_name as "Last Name", first_name as "First Name", d.dept_name as "Department Name"
from employees e
inner join dept_emp de on e.emp_no = de.emp_no
inner join departments d on de.dept_no = d.dept_no and dept_name in ('Sales', 'Development')
order by last_name


-- 8 - In descending order, list the frequency count of employee last names, i.e., how many employees share each last name.
select last_name as "Last Name", count(last_name) as "Frequency"
from employees
group by last_name
order by "Frequency" desc
