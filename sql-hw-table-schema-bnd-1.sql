DROP TABLE IF EXISTS departments;
CREATE TABLE departments (
    dept_no varchar(10)   PRIMARY KEY,
    dept_name varchar(255)   NOT NULL
);

SELECT * FROM departments;

DROP TABLE IF EXISTS employees;
CREATE TABLE employees (
    emp_no integer   PRIMARY KEY,
    birth_date date   NOT NULL,
    first_name varchar(255)   NOT NULL,
    last_name varchar(255)   NOT NULL,
    gender varchar(10)   NOT NULL,
    hire_date date   NOT NULL
);

SELECT * FROM employees;

DROP TABLE IF EXISTS dept_emp;
CREATE TABLE dept_emp (
    emp_no integer   NOT NULL,
    dept_no varchar(10)   NOT NULL,
    from_date date   NOT NULL,
    to_date date   NOT NULL,
	FOREIGN KEY (dept_no) REFERENCES departments (dept_no),
	FOREIGN KEY (emp_no) REFERENCES employees (emp_no)
);

SELECT * FROM dept_emp;

DROP TABLE IF EXISTS dept_manager;
CREATE TABLE dept_manager (
	dept_no varchar(10)   NOT NULL,
    emp_no integer   NOT NULL,
    from_date date   NOT NULL,
    to_date date   NOT NULL,
	FOREIGN KEY (dept_no) REFERENCES departments (dept_no),
	FOREIGN KEY (emp_no) REFERENCES employees (emp_no)
);

SELECT * FROM dept_manager;

DROP TABLE IF EXISTS salaries;
CREATE TABLE salaries (
    emp_no integer   NOT NULL,
    salary numeric   NOT NULL,
    from_date date   NOT NULL,
    to_date date   NOT NULL,
	FOREIGN KEY (emp_no) REFERENCES employees (emp_no)
);

SELECT * FROM salaries;

DROP TABLE IF EXISTS titles;
CREATE TABLE titles (
    emp_no integer   NOT NULL,
    title varchar(255)   NOT NULL,
    from_date date   NOT NULL,
    to_date date   NOT NULL,
	FOREIGN KEY (emp_no) REFERENCES employees (emp_no)
);

SELECT * FROM titles;
