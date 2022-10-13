SELECT ep.emp_no,
		ep.first_name,
		ep.last_name,
		tl.title,
		tl.from_date,
		tl.to_date
INTO retirement_titles
FROM employees as ep
INNER JOIN titles as tl
ON (ep.emp_no=tl.emp_no)
WHERE (ep.birth_date BETWEEN '1952-01-01' AND '1955-12-31')
ORDER BY (ep.emp_no);


SELECT DISTINCT ON (emp_no) rt.emp_no,
rt.first_name,
rt.last_name,
rt.title

INTO unique_titles
FROM retirement_titles as rt
WHERE rt.to_date='9999-01-01'
ORDER BY rt.emp_no, rt.to_date DESC;


SELECT COUNT(ut.emp_no),
ut.title
INTO retiring_titles
FROM unique_titles as ut
GROUP BY (ut.title)
ORDER BY count DESC;


SELECT DISTINCT ON (ep.emp_no)
		ep.emp_no,
		ep.first_name,
		ep.last_name,
		ep.birth_date,
		de.from_date,
		de.to_date,
		tl.title
INTO mentorship_eligibilty
FROM employees as ep
INNER JOIN dept_emp as de
ON (ep.emp_no=de.emp_no)
INNER JOIN titles as tl
ON (ep.emp_no=tl.emp_no)
WHERE (de.to_date='9999-01-01')
AND (ep.birth_date BETWEEN '1965-01-01' AND '1965-12-31')
ORDER BY ep.emp_no;