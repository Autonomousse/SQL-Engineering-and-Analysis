-- Create titles table and import data from CSV
CREATE TABLE titles (
	-- Use title_id as primary key
	title_id VARCHAR PRIMARY KEY NOT NULL,
	title VARCHAR
);

-- Create employees table and import data from CSV
CREATE TABLE employees (
	-- Use employee_number as primary key
	employee_number INT PRIMARY KEY NOT NULL,
	employee_title_id VARCHAR,
	FOREIGN KEY (employee_title_id) REFERENCES titles,
	birth_date DATE,
	first_name VARCHAR,
	last_name VARCHAR,
	sex VARCHAR,
	hire_date DATE
);

-- Create departments table and import data from CSV
CREATE TABLE departments (
	department_number VARCHAR PRIMARY KEY NOT NULL,
	department_name VARCHAR
);

-- Create department managers table and import data from CSV
CREATE TABLE department_managers (
	department_number VARCHAR NOT NULL,
	FOREIGN KEY (department_number) REFERENCES departments,
	employee_number INT NOT NULL,
	FOREIGN KEY (employee_number) REFERENCES employees,
	PRIMARY KEY (department_number, employee_number)
);

-- Create department employees table and import data from CSV
CREATE TABLE department_employees (
	employee_number INT NOT NULL,
	FOREIGN KEY (employee_number) REFERENCES employees,
	department_number VARCHAR NOT NULL,
	FOREIGN KEY (department_number) REFERENCES departments,
	PRIMARY KEY (employee_number, department_number)
);

-- Create salaries table and import data from CSV
CREATE TABLE salaries (
	employee_number INT,
	FOREIGN KEY (employee_number) REFERENCES employees,
	salary INT,
	PRIMARY KEY (employee_number, salary)
);

-- Create a view that joins the tables
CREATE VIEW company_employee_data AS 
SELECT emp.employee_number, titles.title, emp.birth_date, emp.first_name, emp.last_name, emp.sex, emp.hire_date, dn.department_name, de.department_number, sal.salary
FROM employees AS emp
JOIN titles ON emp.employee_title_id = titles.title_id
JOIN department_employees AS de ON emp.employee_number = de.employee_number
JOIN salaries AS sal ON emp.employee_number = sal.employee_number
JOIN departments as dn ON de.department_number = dn.department_number;