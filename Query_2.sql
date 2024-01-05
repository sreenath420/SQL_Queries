

--UNION and UNION ALL are SQL operators used to concatenate 2 or more result sets. This allows us to write multiple SELECT statements, retrieve the desired results, then combine them together into a final, unified set.
--UNION: only keeps unique records
--UNION ALL: keeps all records, including duplicates
The main difference between UNION and UNION ALL is that:

UNION: only keeps unique records
UNION ALL: keeps all records, including duplicates
input

id|name|add1     |add2
1 | x  |chennai  |hyderabad
2 | y  |bengalore|mumbai

output

id | name | address
1     x     chennai
1     x     hyderabad
2     y     bengalore
2     y     mumbai


select id,name,add1 as address
from city
UNION
select id,name,add2 as adress
from city
  
