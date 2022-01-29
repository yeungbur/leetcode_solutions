/*

https://leetcode.com/problems/employees-earning-more-than-their-managers/

181. Employees Earning More Than Their Managers

Write an SQL query to find the employees who earn more than their managers.

Return the result table in any order.

*/

WITH temptable AS(
    SELECT a.id, a.name, a.salary AS emp_salary, a.managerId, b.salary AS mng_salary
    FROM employee a
    JOIN employee b ON a.managerId = b.id
)

SELECT name AS 'Employee'
FROM temptable
WHERE emp_salary > mng_salary
;