Problem:
Given a table with sell dates and product names, our goal is to find, for each date  the count of unique products sold and their names sorted lexicographically.

Activities Table:
+------------+------------+
| sell_date | product   |
+------------+------------+
| 2020-05-30 | Headphone |
| 2020-06-01 | Pencil   |
| 2020-06-02 | Mask    |
| 2020-05-30 | Basketball |
| 2020-06-01 | Bible   |
| 2020-06-02 | Mask    |
| 2020-05-30 | T-Shirt  |
+------------+------------+

Output: 
+------------+----------+------------------------------+
| sell_date | num_sold | products           |
+------------+----------+------------------------------+
| 2020-05-30 | 3    | Basketball,Headphone,T-shirt |
| 2020-06-01 | 2    | Bible,Pencil         |
| 2020-06-02 | 1    | Mask             |
+------------+----------+------------------------------+

SQL Solution:

SELECT 
 sell_date, 
 COUNT(DISTINCT product) AS num_sold,
 GROUP_CONCAT(DISTINCT product ORDER BY product ASC SEPARATOR ',') AS products
FROM Activities 
GROUP BY sell_date 
ORDER BY sell_date ASC;


👉 Immediate Detection: The primary challenge here is aggregating product names into a single cell. MySQL's GROUP_CONCAT comes to the rescue, allowing the specification of sorting mechanisms for group concatenation (aggregation).

👉 Functionality Overview: GROUP_CONCAT() concatenates data from multiple rows into one field. An aggregate (GROUP BY) function, it returns a String value if the group contains at least one non-NULL value; otherwise, it returns NULL.

👉 Clauses Inside GROUP_CONCAT():
 Distinct: Eliminates the repetition of values from the result.
 Order By: Sorts values of the group in a specific order before concatenating.
 Separator: By default, values are separated by the (, ) operator. The Separator clause allows customization with a string literal (e.g., Separator ‘str_value’).
  
  