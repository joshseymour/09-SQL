drop table if exists departments
drop table if exists demp_emp
drop table if exists demp_manager
drop table if exists employees
drop table if exists salaries
drop table if exists titles

-- #1. List the following details of each employee: employee number, last name, first name, gender, and salary
select e.emp_no, e.last_name, e.first_name, e.gender, s.salary
from employees as e
join salaries as s on
e.emp_no = s.emp_no

-- #2. List the employees who were hired in 1986
select e.last_name, e.first_name, e.hire_date
from employees as e
where e.hire_date between '1986-01-01' and '1986-12-31';

-- #3. List the manager of each department with the following information: department number, department name,
-- last name, first name, and start and end employment dates.
select d.dept_no, d.dept_name, e.last_name, e.first_name, e.hire_date, m.to_date
from departments as d
join dept_manager as m on d.dept_no = m.dept_no
join employees as e on m.emp_no = e.emp_no

-- #4. List the department of each employee with the following information: employee number, last name, first name, and department
select employees.emp_no, employees.last_name, employees.first_name, departments.dept_name
from employees
join dept_emp on employees.emp_no = dept_emp.emp_no
join departments on dept_emp.dept_no = departments.dept_no

-- #5. List all employees whose first name is "Hercules" and last names begin with "B."
select e.first_name, e.last_name
from employees as e
where e.first_name = 'Hercules' and e.last_name like 'B%'

-- #6. List all employees in the Sales department, including their employee number, last name, first name, and department name.
select employees.emp_no, employees.last_name, employees.first_name, departments.dept_name
from employees
join dept_emp on employees.emp_no = dept_emp.emp_no
join departments on dept_emp.dept_no = departments.dept_no
where departments.dept_name = 'Sales'

-- #7. List all employees in the Sales and Development departments, including their employee number, last name, first name, and department name.
select employees.emp_no, employees.last_name, employees.first_name, departments.dept_name
from employees
join dept_emp on employees.emp_no = dept_emp.emp_no
join departments on dept_emp.dept_no = departments.dept_no
where departments.dept_name = 'Sales' or departments.dept_name = 'Development'

-- #8. In descending order, list the frequency count of employee last names, i.e., how many employees share each last name.
 select employees.last_name, count(*)
 from employees
 group by employees.last_name
 having count(*) > 1
 order by count(*) desc


