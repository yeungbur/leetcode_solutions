/*

https://leetcode.com/problems/nth-highest-salary/

Write an SQL query to report the nth highest salary from the Employee table. If there is no nth highest salary, the query should report null.

*/

CREATE FUNCTION getNthHighestSalary(N INT) RETURNS INT
BEGIN
  RETURN (
      WITH A AS
      (SELECT DISTINCT salary, DENSE_RANK() OVER (ORDER BY salary DESC) AS top
      FROM employee)
      
      SELECT salary
      FROM A
      WHERE top = N
  );
END