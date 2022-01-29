

/*

https://leetcode.com/problems/rising-temperature/

197. Rising Temperature

Write an SQL query to find all dates' Id with higher temperatures compared to its previous dates (yesterday).

*/

WITH A AS (
    SELECT *,
    LAG(recordDate) OVER (ORDER BY recordDate) AS prev_date,
    LAG(temperature) OVER (ORDER BY recordDate) AS prev_temp
    FROM weather
)

SELECT id
FROM A
WHERE temperature > prev_temp AND DATEDIFF(recordDate,prev_date) = 1
;