/* Rodion Yaryy */
\W    /* enable warnings! */

use bkorders; 

/*  TASK 00 */ 
select user(), current_date(), version(), @@sql_mode\G

/*  TASK 01 */
drop view if exists bkorders.BkOrdersPriorYear;

create view bkorders.BkOrdersPriorYear as (
    select  
  CT.cust_id as customerID
,   case when cust_name_first is null then concat(cust_name_last)
     when cust_name_first is null AND cust_name_last is null then 'no name'
     else concat(cust_name_last, ', ', cust_name_first)
     end as customerName
,    OH.order_date as full_date
,    date_format(OH.order_date,'%M') as order_month
,    order_id  
from customers CT
join order_headers OH on OH.cust_id = CT.cust_id
where YEAR(order_date) = YEAR(CURDATE()) - 1   
);  

use bkorders;

/*  TASK 02 */
select customerID, customerName
from bkordersprioryear
where order_month = 'April'
union
select customerID, customerName
from bkordersprioryear
where order_month = 'June'
union
select customerID, customerName
from bkordersprioryear
where order_month = 'August';

/* TASK 03 */
select customerID, customerName
from bkordersprioryear
where customerID not in (
  select customerID
  from bkordersprioryear
  where order_month = 'March'
)
AND customerID not in(
  select customerID
  from bkordersprioryear
  where order_month = 'June'
)
AND customerID not in (
  select customerID
  from bkordersprioryear
  where order_month = 'September'
);

/* TASK 04 */
select distinct customerID, customerName
from bkordersprioryear
where customerID in (
  select customerID
  from bkordersprioryear
  where order_month = 'March'
)
AND customerID in(
  select customerID
  from bkordersprioryear
  where order_month = 'June'
)
AND customerID in (
  select customerID
  from bkordersprioryear
  where order_month = 'September'
);

/* TASK 05 */
select distinct customerID, customerName
from bkordersprioryear
where customerID in (
  select customerID
  from bkordersprioryear
  where order_month = 'January'
)
AND customerID not in (
  select customerID
  from bkordersprioryear
  where order_month = 'February'
)
AND customerID not in (
  select customerID
  from bkordersprioryear
  where order_month = 'March'
);

/* TASK 06 */
select distinct customerID, customerName, order_month
from bkordersprioryear
where customerID in (
  select customerID
  from bkordersprioryear
  where order_month = 'March'
)
AND customerID in (
  select customerID
  from bkordersprioryear
  where customerID in (
      select customerID
      from bkordersprioryear
      where order_month = 'April'
    )
    OR customerID in (
    select customerID
  from bkordersprioryear
    where customerID in (
      select customerID
      from bkordersprioryear
      where order_month = 'May'
    )
  )
);

/* TASK 07 */
select distinct customerID, customerName, order_month
from bkordersprioryear
where customerID in (
  select customerID
  from bkordersprioryear
  where customerID in (
      select customerID
      from bkordersprioryear
      where order_month = 'April'
    )
    AND customerID in (
    select customerID
    from bkordersprioryear
    where customerID in (
      select customerID
      from bkordersprioryear
      where order_month = 'May'
    )
  )
) AND customerID not in (
  select customerID
  from bkordersprioryear
  where order_month = 'June'
);