/*

176. Second Highest Salary

https://leetcode.com/problems/second-highest-salary/

Write an SQL query to report the second highest salary from the Employee table. If there is no second highest salary, the query should report null.

*/

-- Solution 1, Simple

SELECT MAX(salary) AS SecondHighestSalary
FROM employee
WHERE salary NOT IN (SELECT MAX(Salary) FROM employee)
;