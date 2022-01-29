/*

https://leetcode.com/problems/delete-duplicate-emails/

196. Delete Duplicate Emails

Write an SQL query to delete all the duplicate emails, keeping only one unique email with the smallest id.

*/

WITH A AS(
    SELECT MIN(id)
    FROM person
    GROUP BY email
)

DELETE
FROM person
WHERE id NOT IN (SELECT * FROM A)