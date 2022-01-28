/*

https://leetcode.com/problems/combine-two-tables/

175. Combine Two Tables

Write an SQL query to report the first name, last name, city, and state of each person in the Person table. If the address of a personId is not present in the Address table, report null instead.

Return the result table in any order.

*/

SELECT firstName, lastName, city, state
FROM Person LEFT JOIN Address
ON Person.PersonId = Address.PersonId
;