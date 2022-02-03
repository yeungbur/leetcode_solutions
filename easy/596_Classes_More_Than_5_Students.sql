/*

https://leetcode.com/problems/classes-more-than-5-students/

Write an SQL query to report all the classes that have at least five students.

Return the result table in any order.

*/

SELECT class
FROM courses
GROUP BY 1
HAVING COUNT(student) >= 5
;