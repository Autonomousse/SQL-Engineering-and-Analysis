-- List the following details of each employee: employee number, last name, first name, sex, and salary.
SELECT employee_number, last_name, first_name, sex, salary 
FROM company_employee_data

-- List first name, last name, and hire date for employees who were hired in 1986.
SELECT first_name, last_name, hire_date 
FROM company_employee_data
WHERE hire_date BETWEEN '1986-01-01' AND '1986-12-31'

-- List the manager of each department with the following information: department number, department name, the manager's employee number, last name, first name.
SELECT department_number, department_name, employee_number, last_name, first_name 
FROM company_employee_data
WHERE title = 'Manager'

-- List the department of each employee with the following information: employee number, last name, first name, and department name.
SELECT employee_number, last_name, first_name, department_name 
FROM company_employee_data

-- List first name, last name, and sex for employees whose first name is "Hercules" and last names begin with "B."
SELECT first_name, last_name, sex
FROM company_employee_data
WHERE first_name = 'Hercules' AND last_name LIKE 'B%'

-- List all employees in the Sales department, including their employee number, last name, first name, and department name.
SELECT employee_number, last_name, first_name, department_name
FROM company_employee_data
WHERE department_name = 'Sales'

-- List all employees in the Sales and Development departments, including their employee number, last name, first name, and department name.
SELECT employee_number, last_name, first_name, department_name
FROM company_employee_data
WHERE department_name = 'Sales' OR department_name = 'Development'

-- In descending order, list the frequency count of employee last names, i.e., how many employees share each last name.
SELECT last_name, COUNT(last_name) AS "name frequency"
FROM company_employee_data
GROUP BY last_name
ORDER BY "name frequency" DESC