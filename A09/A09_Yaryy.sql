/* Rodion Yaryy */
\W    /* enable warnings! */

use bkorders; 

/*  TASK 00 */ 
select user(), current_date(), version(), @@sql_mode\G

/*  TASK 01 */
select (sum(quantity * order_price)) as AmtDue
from order_details
where book_id in (1108);

/*  TASK 02 */
select 
  count(OD.order_id) as NumberOfOrders
from order_details OD
inner join order_headers OH on OD.order_id = OH.order_id
where book_id in (1108)
and YEAR(order_date) = YEAR((CURDATE()-1));

/* TASK 03 */
select 
  cust_id as CustID
, cust_name_last as CustName
, sum(quantity) as BookTotal
, sum(case when YEAR(order_date) = YEAR(CURDATE()) then quantity else NULL end) as CurrentYearBookTotal
from customers
left join order_headers using (cust_id)
left join order_details using (order_id)
group by cust_id; 

/* TASK 04 */
select 
   @last_quarter := IF((QUARTER(CURDATE( ))-1) = 0, 4, QUARTER(CURDATE( ))-1) as PreviousQuarterNumber
,  @last_year:=IF(@last_quarter = 4, YEAR(NOW( ))-1, YEAR(NOW( ))) as YearOfPreviousQuarter
,  count(case when QUARTER(order_date) = @last_quarter 
  and year(order_date) = @last_year then 1 end
  ) as NumberOfOrdersLastQuarter
,  count(distinct (
  case when QUARTER(order_date) = @last_quarter and year(order_date) = @last_year then cust_id end
    )) as CustomersLastQuarter
from order_headers
join customers using (cust_id);

/* TASK 05 */
select book_id
, title
from bkinfo.books BKS
join bkinfo.book_topics using(book_id)
join bkorders.order_details OD using (book_id)
where topic_id in ('NOSQL','XML','DB')
group by book_id
order by count(book_id) desc
limit 1;

/* TASK 06 */
select
   sum(case when topic_id in ('SCI') then 1 end) as 'Science'
,  sum(case when topic_id in ('DB','SQL','SSRV','MySQL','ORA','ADO') then 1 end) as 'Database Systems'
,  sum(case when topic_id in ('NOSQL','XML','DB') then 1 end) as 'Data Storage Techniques'
,  count(topic_id) as 'All Books'
from bkinfo.books
join bkinfo.book_topics using(book_id);

/* TASK 07 */
select 
  cust_id as CustID
, cust_name_last as CustName
, if (max(order_date is null) = 0, max(order_date), 'No Orders') as MostRecentOrder
from order_headers
right join customers using(cust_id) 
group by cust_id;

/* TASK 08 */
select 
  cust_id as CustID
, cust_name_last as CustName
from customers
join order_headers using (cust_id)
join order_details using (order_id)
where cust_id not in (
  select cust_id
  from order_headers
  join order_details using (order_id)
    where book_id = 1142
) AND cust_id in (
  select cust_id 
    from order_headers
  join order_details using (order_id)
    join bkinfo.book_topics using (book_id)
    where topic_id in ('SQL')
)  
group by cust_id
having sum((quantity * order_price)) > 500;



