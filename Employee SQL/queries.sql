SELECT * FROM departments
SELECT * FROM dept_emp
SELECT * FROM dept_manager
SELECT * FROM employees
SELECT * FROM salaries
SELECT * FROM titles

--List the following details of each employee: employee number, last name, first name, sex, and salary.
SELECT e.first_name, e.last_name, e.hire_date, e.sex, s.salary
FROM employees e
INNER JOIN salaries s on e.emp_no=s.emp_no;

--List first name, last name, and hire date for employees who were hired in 1986.
SELECT e.first_name, e.last_name, e.hire_date
FROM employees e
WHERE EXTRACT(YEAR FROM hire_date)= '1986' ;

--List the manager of each department with the following information: department number, department name, the manager's employee number, last name, first name.
SELECT dm.dept_no,d.dept_name,dm.emp_no,e.first_name, e.last_name
FROM employees e
INNER JOIN dept_manager dm on e.emp_no=dm.emp_no
INNER JOIN departments d on dm.dept_no=d.dept_no;

--List the department of each employee with the following information: employee number, last name, first name, and department name.
SELECT e.first_name, e.last_name, e.emp_no, d.dept_name
FROM employees e
INNER JOIN dept_emp de on e.emp_no=de.emp_no
INNER JOIN departments d on d.dept_no=de.dept_no;

--List first name, last name, and sex for employees whose first name is "Hercules" and last names begin with "B."
SELECT first_name, last_name, sex
FROM employees e
WHERE first_name = 'Hercules' and last_name LIKE 'B%';

--List all employees in the Sales department, including their employee number, last name, first name, and department name.

SELECT e.first_name, e.last_name, nbr.emp_no, nbr.dept_name
FROM employees e
INNER JOIN (
SELECT de.emp_no,d.dept_name
FROM departments d
LEFT JOIN dept_emp de on de.dept_no=d.dept_no
WHERE d.dept_name= 'Sales') AS nbr ON e.emp_no = nbr.emp_no

--List all employees in the Sales and Development departments, including their employee number, last name, first name, and department name.

SELECT e.first_name, e.last_name, nbr.emp_no, nbr.dept_name
FROM employees e
INNER JOIN (
SELECT de.emp_no,d.dept_name
FROM departments d
LEFT JOIN dept_emp de on de.dept_no=d.dept_no
WHERE d.dept_name= 'Sales' or d.dept_name ='Development') AS nbr ON e.emp_no = nbr.emp_no

--List the frequency count of employee last names (i.e., how many employees share each last name) in descending order.
SELECT COUNT(last_name), last_name
FROM employees
GROUP BY last_name
ORDER BY COUNT(last_name) DESC

