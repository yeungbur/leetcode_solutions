/*

https://leetcode.com/problems/department-highest-salary/

184. Department Highest Salary

Write an SQL query to find employees who have the highest salary in each of the departments.

*/

WITH temp_table AS(
    SELECT a.id, a.name AS 'employee', a.salary AS 'salary', b.name AS 'department', MAX(salary) OVER (PARTITION BY b.name) AS 'max_salary'
    FROM employee a
    JOIN department b ON a.departmentId = b.id
)

SELECT department, employee, salary
FROM temp_table
WHERE salary = max_salary
;