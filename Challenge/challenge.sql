-- Link employees, titles and salaries

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
ON (e.emp_no = de.emp_no);

--Finding latest titles

SELECT * 
INTO ordered_emp_title
FROM emp_title ORDER BY from_date DESC;

SELECT DISTINCT ON (emp_no) * 
INTO latest_titles
FROM ordered_emp_title;

SELECT title, count(emp_no) 
INTO title_counts
FROM latest_titles
GROUP BY title;

-- Find potential mentors

SELECT l.emp_no, l.first_name, l.last_name, l.title, l.from_date,
	t.to_date
INTO mentors
FROM latest_titles as l
INNER JOIN  employees as e
ON (l.emp_no = e.emp_no)
INNER JOIN titles as t
ON (l.emp_no, l.title)=(t.emp_no, t.title)
WHERE (e.birth_date BETWEEN '1965-01-01' AND '1965-12-31');  
	 AND (t.to_date = '9999-01-01');