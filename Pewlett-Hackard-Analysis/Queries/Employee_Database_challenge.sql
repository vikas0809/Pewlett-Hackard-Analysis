--DELIVERABLE 1 
-- Creating table retirement_titles
SELECT  e.emp_no,
		e.first_name,
		e.last_name,
		ts.title,
		ts.from_date,
		ts.to_date
INTO retirement_titles
FROM employees AS e
INNER JOIN titles as ts
ON e.emp_no = ts.emp_no
WHERE (e.birth_date BETWEEN '1952-01-01' AND '1955-12-31')
ORDER BY e.emp_no ASC;


-- Use Dictinct with Orderby to remove duplicate rows
-- 
SELECT DISTINCT ON (emp_no) emp_no,
							first_name,
							last_name,
							title
INTO unique_titles
FROM retirement_titles
WHERE (to_date = '9999-01-01')
ORDER BY emp_no ASC,
		to_date DESC;

		-- COUNT of retiring employees by title.
SELECT COUNT(title) as "count",title
INTO retiring_titles
FROM unique_titles
GROUP BY title
ORDER BY COUNT(title) DESC;



--Deliverable 2

--Employees eligible to participate in a Mentorship Program
SELECT DISTINCT ON (e.emp_no)
		e.emp_no,
		e.first_name,
		e.last_name,
		e.birth_date,
		de.from_date,
		de.to_date,
		ts.title
INTO mentorship_eligibilty
FROM employees AS e
INNER JOIN dept_emp AS de
	ON e.emp_no=de.emp_no
INNER JOIN titles AS ts
	ON e.emp_no=ts.emp_no
WHERE (e.birth_date BETWEEN '1965-01-01' AND '1965-12-31')
	AND (de.to_date = '9999-01-01')
ORDER BY e.emp_no ASC;

-- Analysis count to find employees available for mentorship program
-- group by titles.
SELECT COUNT(title), title
FROM mentorship_eligibility
GROUP BY title
ORDER BY COUNT(title) DESC;

-- Creating table of retiring employees by department for analysis
SELECT DISTINCT ON (r.emp_no) r.emp_no,
                            r.first_name,
                            r.last_name,
                            r.title,
                            d.dept_name
INTO retiring_by_dept
FROM retirement_titles AS r
INNER JOIN dept_emp AS de
ON (r.emp_no=de.emp_no)
INNER JOIN departments AS d
ON (de.dept_no=d.dept_no)
WHERE r.to_date=('9999-01-01')
ORDER BY r.emp_no ASC, r.to_date DESC;

-- Analysis count to find employees retiring by department
-- group by department name.
SELECT COUNT(dept_name), dept_name
FROM retiring_by_dept
GROUP BY dept_name
ORDER BY COUNT(dept_name) DESC;

-- Creating table of mentor employees by department for analysis
SELECT DISTINCT ON (me.emp_no) me.emp_no,
                            me.first_name,
                            me.last_name,
                            me.title,
                            d.dept_name
INTO mentors_by_dept
FROM mentorship_eligibility AS me
INNER JOIN dept_emp AS de
ON (me.emp_no=de.emp_no)
INNER JOIN departments AS d
ON (de.dept_no=d.dept_no)
ORDER BY me.emp_no ASC;

-- Analysis count to find mentors available by department
-- group by department name.
SELECT COUNT(dept_name), dept_name
FROM mentors_by_dept
GROUP BY dept_name
ORDER BY COUNT(dept_name) DESC;