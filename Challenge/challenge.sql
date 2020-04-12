-- Find positions and salaries of all current employees

SELECT e.emp_no, e.first_name, e.last_name,
	t.title, t.from_date,
	s.salary
INTO emp_title
FROM employees as e
INNER JOIN titles as t
	ON (e.emp_no = t.emp_no)
INNER JOIN salaries as s
	ON (e.emp_no = s.emp_no)
INNER JOIN dept_emp as de
	ON (e.emp_no = de.emp_no)
WHERE (de.to_date = '9999-01-01')
	AND (e.birth_date BETWEEN '1952-01-01' AND '1955-12-31')
	AND (e.hire_date BETWEEN '1985-01-01' AND '1988-12-31');
	 

-- Ensure these are most recent titles
SELECT * INTO current_retiring_emp
FROM (SELECT *, ROW_NUMBER() OVER (PARTITION BY emp_no ORDER BY from_date DESC) AS title_count
	 From emp_title) withtitle_count
	 where title_count =1;


-- Count the number of retiring employees in each position
SELECT title as "Title", count(current_retiring_emp) as "Number of Employees" 
INTO retiring_count
FROM current_retiring_emp
GROUP BY title;