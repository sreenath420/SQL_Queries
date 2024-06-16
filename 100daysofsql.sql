Namastekart, an e-commerce company, has observed a notable surge in return orders recently. They suspect that a specific group of customers may be responsible for a significant portion of these returns. To address this issue, their initial goal is to identify customers who have returned more than 50% of their orders. This way, they can proactively reach out to these customers to gather feedback.

 

For instances 
, if a customer named ABC has placed 4 orders and returned 3 of them, they should be included in the output. On the other hand, if a customer named XYZ has placed 5 orders but only returned 2, they should not be included in the output. Write an SQL to find list of customers along with their return percent(Round to 2 decimal places).

Table: orders (primary key : order_id)

column name	datatype
order_id	int
order_date	date
customer_name	varchar(20)
sales	int
 
Table: returns (primary key : order_id)

column name	datatype
order_id	int
return_date	date
 

 
Example Input

orders

order_id	order_date	customer_name	sales
1	2023-01-01	Alexa	1239
2	2023-01-02	Alexa	1239
3	2023-01-03	Alexa	1239
4	2023-01-03	Alexa	1239
5	2023-01-01	Ramesh	1239
6	2023-01-02	Ramesh	1239
7	2023-01-03	Ramesh	1239
returns

order_id	return_date
1	2023-01-02
2	2023-01-04
3	2023-01-05
7	2023-01-10
 
Expected Output:

customer_name	Return_Percent
Alexa				75.0
Explanation: Alexa has placed 4 orders and returned 3 of them which is 75 percent (3/4) so Alexa is in output while Ramesh has placed 3 orders but reurned only 1 order which is 33.33% (1/3) so Ramesh is not in output.


query:-

select customer_name, round(count(r.order_id)*100.0/count(*),2) as return_percent
from orders o
left join returns r on o.order_id=r.order_id
group by customer_name
having  count(r.order_id) > count(*)*0.5 