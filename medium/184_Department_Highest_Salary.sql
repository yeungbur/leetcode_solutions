/*

https://leetcode.com/problems/department-highest-salary/

184. Department Highest Salary

Write an SQL query to find employees who have the highest salary in each of the departments.

Table: Employee

+--------------+---------+
| Column Name  | Type    |
+--------------+---------+
| id           | int     |
| name         | varchar |
| salary       | int     |
| departmentId | int     |
+--------------+---------+
id is the primary key column for this table.
departmentId is a foreign key of the ID from the Department table.
Each row of this table indicates the ID, name, and salary of an employee. It also contains the ID of their department.
 

Table: Department

+-------------+---------+
| Column Name | Type    |
+-------------+---------+
| id          | int     |
| name        | varchar |
+-------------+---------+
id is the primary key column for this table.
Each row of this table indicates the ID of a department and its name.

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