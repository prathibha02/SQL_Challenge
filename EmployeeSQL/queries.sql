-- 1. List the following details of each employee: employee number, last name, first name, sex, and salary.
select e.emp_no, e.last_name, e.first_name, e.sex, s.salary
from "Employees" as e
inner join "Salaries" as s on e.emp_no = s.emp_no;

-- 2. List first name, last name, and hire date for employees who were hired in 1986.
select e.first_name, e.last_name, e.hire_date 
from "Employees" as e
where  date_part('year', e.hire_date) = 1986;

--3. List the manager of each department with the following information: department number, department name, 
-- the manager's employee number, last name, first name.
select dm.dept_no, dp.dept_name,dm.emp_no,e.last_name, e.first_name  
from "Dept_manager" as dm
inner join "Departments" as dp on dm.dept_no = dp.dept_no
inner join "Employees" as e on dm.emp_no = e.emp_no;

--4. List the department of each employee with the following information: employee number, last name, first name, and department name.
select e.emp_no, e.last_name, e.first_name, dp.dept_name
from "Employees" as e
inner join "Dept_Emp" as de on e.emp_no = de.emp_no
inner join "Departments" as dp on de.dept_no = dp.dept_no;

--5. List first name, last name, and sex for employees whose first name is "Hercules" and last names begin with "B."
select e.first_name, e.last_name, e.sex  
from "Employees" as e
where e.first_name = 'Hercules' and e.last_name like 'B%';

-- 6. List all employees in the Sales department, including their employee number, last name, first name, and department name.
select e.emp_no, e.last_name, e.first_name, dp.dept_name
from "Employees" as e
inner join "Dept_Emp" as de on e.emp_no = de.emp_no
inner join "Departments" as dp on de.dept_no = dp.dept_no
where dp.dept_name like '%Sales%';

-- 7. List all employees in the Sales and Development departments, including their employee number, last name, first name, and department name.
select e.emp_no, e.last_name, e.first_name, dp.dept_name
from "Employees" as e
inner join "Dept_Emp" as de on e.emp_no = de.emp_no
inner join "Departments" as dp on de.dept_no = dp.dept_no
where dp.dept_name like '%Sales%' or dp.dept_name like '%Development%';

-- 8. List the frequency count of employee last names (i.e., how many employees share each last name) in descending order.
SELECT e.last_name, COUNT(e.last_name)
FROM "Employees" as e
group by e.last_name 
order by e.last_name DESC;