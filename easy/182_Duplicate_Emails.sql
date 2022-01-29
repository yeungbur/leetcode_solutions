/*

https://leetcode.com/problems/duplicate-emails/

182. Duplicate Emails

Write an SQL query to report all the duplicate emails.

Return the result table in any order.

*/

WITH A AS (    
    SELECT email, COUNT(email) AS appearances
    FROM person
    GROUP BY email
    HAVING appearances > 1)

SELECT email
FROM A
;