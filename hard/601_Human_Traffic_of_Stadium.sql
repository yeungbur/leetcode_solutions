/*

https://leetcode.com/problems/human-traffic-of-stadium/

601. Human Traffic of Stadium

Write an SQL query to display the records with three or more rows with consecutive id's, and the number of people is greater than or equal to 100 for each.

Return the result table ordered by visit_date in ascending order.

*/

WITH A AS(
    SELECT id, visit_date, people,
    LAG(people, 2) OVER (ORDER BY id) AS pre_2,
    LAG(people, 1) OVER (ORDER BY id) AS pre_1,
    LEAD(people, 1) OVER (ORDER BY id) AS next_1,
    LEAD(people, 2) OVER (ORDER BY id) AS next_2
    FROM stadium
)

SELECT id, visit_date, people
FROM A
WHERE (pre_2 >= 100 AND pre_1 >= 100 AND people >=100)
OR (pre_1 >=100 AND people >=100 AND next_1 >=100)
OR (people >=100 AND next_1 >=100 AND next_2 >=100)
;