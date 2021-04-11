--------------------------------------------------------------------------------
-- MODULE 7 CHALLENGE
--------------------------------------------------------------------------------

-- Deliverable 1: The Number of Retiring Employees by Title 
--------------------------------------------------------------------------------

SELECT
	em.emp_no,
	em.first_name,
	em.last_name,
	ti.title,
	ti.from_date,
	ti.to_date
INTO retirement_titles
FROM Employees AS em
INNER JOIN Titles AS ti
ON em.emp_no = ti.emp_no
WHERE (em.birth_date BETWEEN '1952-01-01' AND '1955-12-31')
ORDER BY em.emp_no;

-- Use Dictinct with Orderby to remove duplicate rows
SELECT DISTINCT ON (emp_no) emp_no,
	first_name,
	last_name,
	title
INTO unique_titles
FROM retirement_titles
ORDER BY emp_no, to_date DESC;

-- Number of employees by their most recent job title who are about to retire
SELECT count(title),
	title
INTO retiring_titles
FROM unique_titles
GROUP BY title
ORDER BY count(emp_no) DESC;

-- Deliverable 2: The Employees Eligible for the Mentorship Program
--------------------------------------------------------------------------------

-- Mentorship-eligibility table holding current employees born in 1965

SELECT DISTINCT ON (em.emp_no) em.emp_no,
	em.first_name,
	em.last_name,
	em.birth_date,
	de.from_date,
	de.to_date,
	ti.title
INTO mentorship_eligibilty
FROM employees AS em
INNER JOIN dept_emp AS de
ON em.emp_no = de.emp_no
INNER JOIN Titles AS ti
ON em.emp_no = ti.emp_no
WHERE EXTRACT (YEAR FROM em.birth_date) = 1965 AND de.to_date = '9999-01-01'
ORDER BY em.emp_no












