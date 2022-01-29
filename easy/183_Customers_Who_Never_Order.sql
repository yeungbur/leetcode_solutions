/*

https://leetcode.com/problems/customers-who-never-order/

Customers Who Never Order

Write an SQL query to report all customers who never order anything.

*/

-- Solution 1, Inner query

SELECT name AS 'customers'
FROM customers
WHERE id NOT IN (SELECT customerID FROM orders)
;

-- Solution 2, External CTE

WITH A AS (
    SELECT customerID 
    FROM orders
)

SELECT name AS 'customers'
FROM customers
WHERE id NOT IN (SELECT * FROM A)
;