--List the following details of each employee: employee number, last name, first name, gender, and salary.
select a.emp_no, a.last_name, a.first_name, a.gender, b.salary
from employees as a
left join salaries as b on a.emp_no = b.emp_no;

--List employees who were hired in 1986.
select emp_no, last_name, first_name, hire_date 
from employees
where date_part('year', hire_date) = 1986;

--List the manager of each department with the following information: department number, department name, the manager's employee number, last name, first name, and start and end employment dates.
select dm.dept_no, d.dept_name, dm.emp_no, e.last_name, e.first_name, e.hire_date, s.to_date as termination_date
from dept_manager as dm
	left join departments as d on dm.dept_no = d. dept_no
		left join employees as e on dm.emp_no = e.emp_no
			left join salaries as s on dm.emp_no = s.emp_no;

--List the department of each employee with the following information: employee number, last name, first name, and department name.
select de.emp_no, e.last_name, e.first_name, d.dept_name
from dept_emp as de
	left join employees as e on de.emp_no = e.emp_no
		left join departments as d on de.dept_no = d.dept_no;

--List all employees whose first name is "Hercules" and last names begin with "B."
select first_name, last_name
from employees
where first_name = 'Hercules'
	and last_name LIKE 'B%';

--List all employees in the Sales department, including their employee number, last name, first name, and department name.
select de.emp_no, e.last_name, e.first_name, d.dept_name
from employees as e
	left join dept_emp as de on e.emp_no = de.emp_no
		left join departments as d on de.dept_no = d.dept_no
where d.dept_name = 'Sales';

--List all employees in the Sales and Development departments, including their employee number, last name, first name, and department name.
select de.emp_no, e.last_name, e.first_name, d.dept_name
from employees as e
	left join dept_emp as de on e.emp_no = de.emp_no
		left join departments as d on de.dept_no = d.dept_no
where d.dept_name IN ('Sales', 'Development');

--In descending order, list the frequency count of employee last names, i.e., how many employees share each last name.
select last_name, count(last_name) as total_count
from employees
group by last_name
order by total_count desc;
