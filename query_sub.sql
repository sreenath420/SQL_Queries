input
--------------------------------------------------------------------------
name        opt_in
john         true
john         false
john         false
john         false
kek          true
kek          true                           
kek          true



output
------------------------------------------------------------------
name     opt_in
john     false
kek      true


select name,opt_in 
from (
select name,
opt_in,
row_number()over(partition by name order by opt_in) as rnk
from  john_kek
) as tem where rnk=2

