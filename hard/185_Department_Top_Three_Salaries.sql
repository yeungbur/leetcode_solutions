/*

https://leetcode.com/problems/department-top-three-salaries/

185. Department Top Three Salaries

A company's executives are interested in seeing who earns the most money in each of the company's departments. A high earner in a department is an employee who has a salary in the top three unique salaries for that department.

Write an SQL query to find the employees who are high earners in each of the departments.

*/

WITH A AS(
    SELECT a.name AS 'employee', salary, b.name AS 'department', DENSE_RANK() OVER (PARTITION BY departmentId ORDER BY salary DESC) AS 'dept_rank'
    FROM employee a
    JOIN department b on a.departmentId = b.id)

SELECT department, employee, salary
FROM A
WHERE dept_rank <= 3
;