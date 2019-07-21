select e.emp_no, t.title, e.first_name, e.last_name, s.salary as my_salary, e.hire_date, s.to_date as final_day
from titles as t
	left join salaries as s on t.emp_no = s.emp_no
		left join employees as e on e.emp_no = t.emp_no
where e.emp_no = 499942;
	


