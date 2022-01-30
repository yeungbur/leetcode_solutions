/*

https://leetcode.com/problems/consecutive-numbers/

180. Consecutive Numbers

Write an SQL query to find all numbers that appear at least three times consecutively.

Return the result table in any order.

*/

WITH A AS(
    SELECT id, num,
    LAG(num, 2) OVER (ORDER BY id) AS pre_2,
    LAG(num, 1) OVER (ORDER BY id) AS pre_1,
    LEAD(num, 1) OVER (ORDER BY id) AS next_1,
    LEAD(num, 2) OVER (ORDER BY id) AS next_2
    FROM logs
)

SELECT DISTINCT num AS 'ConsecutiveNums'
FROM A
WHERE (pre_2 = pre_1 AND pre_1 = num)
OR (pre_1 = num AND num = next_1)
OR (num = next_1 AND next_1 = next_2)
;