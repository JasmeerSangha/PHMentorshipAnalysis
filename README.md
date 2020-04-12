# Pewlett-Hackard-Analysis

## Overview
I have been requested to identify potential mentors approaching retirement for Pewlett Hackard as the bulk of their employees are aging out of the system. Using PostgreSQL, queries were made on the raw csv files located inside the [Data folder](https://github.com/JasmeerSangha/Pewlett-Hackard-Analysis/tree/master/Data). Quick DBD was used to create  an Entity Relationship Diagram (ERD) for said raw csv files:

![picture alt](https://github.com/JasmeerSangha/Pewlett-Hackard-Analysis/blob/master/EmployeeDB.png "Pewlett Hackard ERD")



## Resources
- Data Sources: departments.csv, dept_emp.csv, dept_manager.csv, employees.csv, salaries.csv, titles.csv
- Software/Tools: pgAdmin, Quick DBD
- Databases: PostgreSQL
- Languages: SQL

## Queries
The [queries] SQl file (https://github.com/JasmeerSangha/Pewlett-Hackard-Analysis/blob/master/Queries/queries.sql) was usde during the analysis to produce the tables within the Queries folder, including but not limited to a table of employees eligible to retire based on birth date and hire date, a list of managers sorted by department, and the number of employees per department.



## Challenge
Pewlett-Hackard requested an analysis of employees eligible for retirement in hopes they could serve as mentors before leaving the company.

Pewlett-Hackard's first request was to idnetify all employees eligible for retirement. This analysis entailed identifying employees who are still working at the company, had experience in the position and were approaching retirment age. The list can be found [here.](https://github.com/JasmeerSangha/Pewlett-Hackard-Analysis/blob/master/Challenge/current_retiring_emp.csv) 
__Note:__ Employees who have changed position in the company will appear multiple times within the first queries therefore the date needed to be filtered for their most recent positons:

`SELECT * INTO current_emp
FROM (SELECT *, ROW_NUMBER() OVER (PARTITION BY emp_no ORDER BY from_date DESC) AS title_count
	 From emp_title) withtitle_count
	 where title_count =1;`

The final task was to determine the number of potential mentors per title at the company:
| Title | Number of Employees |
|----------------------------------------|-------|
| Engineer |2711|
| Senior Engineer |13651|
| Manager |2|
| Assistant Engineer |251|
| Staff |2022|
| Senior Staff |12872|
| Technique Leader |1609|

## Conclusion

The company is going to lose a larger portion of its senior roles compared to the intermediate level. The mentorship program should be implimented as soon as possible as a new influx of fresh faces will only lead to a large inexpereinced workforce.
