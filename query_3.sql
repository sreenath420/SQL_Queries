

input

cust_id  flight_id  origin  destination
--------------------------------------------------------------------------------------------------------------
--------------------------------------------------------------------------------------------------------------
1	     Flight1	Delhi	Hyderabad
1		    Flight2	Hyderabad	Kochi
1	     Flight3	Kochi	Mangalore
2	     Flight1	Mumbai	Ayodhya
2	     Flight2	Ayodhya	Gorakhpur


output

cust_id    origin   destination
-------------------------------------------
------------------------------------------
1	       Delhi    Mangalore
2	       Mumbai	  Gorakhpur




create table journey(
cust_id int, 
flight_id varchar(20), 
origin varchar(20), 
destination varchar(20))

Insert into journey values(1,'Flight1' , 'Delhi' , 'Hyderabad'),
 (1,'Flight2' , 'Hyderabad' , 'Kochi'),
 (1,'Flight3' , 'Kochi' , 'Mangalore'),
 (2,'Flight1' , 'Mumbai' , 'Ayodhya'),
 (2,'Flight2' , 'Ayodhya' , 'Gorakhpur');



with cte as
(select *,row_number() over(partition by cust_id order by flight_id) as start_jrny,
row_number() over(partition by cust_id order by flight_id desc) as end_jrny
from journey),
cte2 as
(select cust_id,origin,destination from cte where end_jrny=1),
cte3 as
(select cust_id,origin,destination from cte where start_jrny=1)
select cte2.cust_id,cte3.origin,cte2.destination 
from cte2 join cte3 on cte2.cust_id=cte3.cust_id
