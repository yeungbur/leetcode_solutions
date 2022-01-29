/*

https://leetcode.com/problems/trips-and-users/

The cancellation rate is computed by dividing the number of canceled (by client or driver) requests with unbanned users by the total number of requests with unbanned users on that day.

Write a SQL query to find the cancellation rate of requests with unbanned users (both client and driver must not be banned) each day between "2013-10-01" and "2013-10-03". Round Cancellation Rate to two decimal points.

*/

WITH clean AS(
    SELECT users_id FROM users WHERE banned = 'No'
),

eligible AS(
    SELECT client_id, driver_id, status, request_at
    FROM trips
    WHERE client_id IN (SELECT * FROM clean) AND driver_id IN (SELECT * FROM clean)
),

numerator AS(    
    SELECT SUM(CASE WHEN status != 'completed' THEN 1 ELSE 0 END) AS num, request_at
    FROM eligible
    GROUP BY 2
),
    
denominator AS(
    SELECT COUNT(*) AS den, request_at
    FROM eligible
    GROUP BY 2
)

SELECT denominator.request_at AS 'Day', ROUND(num/den,2) AS 'Cancellation Rate'
FROM denominator
JOIN numerator ON denominator.request_at = numerator.request_at
WHERE denominator.request_at BETWEEN '2013-10-01' AND '2013-10-03'
GROUP BY 1
ORDER BY 1
;
