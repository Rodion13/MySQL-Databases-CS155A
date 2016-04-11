/* Rodion Yaryy */
\W    /* enable warnings! */

use vets; -- put the database name into this command and REMOVE the comment. Keep the ending semicolon;

/*  TASK 00 */ 
select user(), current_date(), version(), @@sql_mode\G

/*  TASK 01 */
select cl_id
, cl_name_last
, ifnull(cl_name_first, '')
, ifnull(cl_phone, 'no phone number')
from vets.vt_clients;

select cl_id
, cl_name_last
, coalesce(cl_name_first, '')
, coalesce(cl_phone, 'no phone number')
from vets.vt_clients;

/*  TASK 02 */
select concat(
  cl_id, ' '
, if (cl_name_first is null, concat(cl_name_last, ': '), concat(cl_name_last, ', ', cl_name_first, ': '))
, if (cl_phone is null, 'No phone', concat('Phone: ', cl_phone))  
) as 'Client'
from vets.vt_clients;

/*  TASK 03 */
select
  srv_id
, format(srv_list_price, 2) as srv_list_price
, format(round(srv_list_price, -1), 2) as 'RoundedToTens'
, format(round(srv_list_price, 0), 2) as 'RoundedUpToDollar'
from vets.vt_services
where srv_id between 500 and 599;

/*  TASK 04 */
select * from vets.vt_services
where inStr(srv_desc, 'Dental') > 0 and inStr(srv_desc, 'Feline') = 0;

/*  TASK 05 */
select ex_id
, ex_date as 'ExamDatel'
, date_format(ex_date, '%Y-%m-%d') as 'ExamDate2'
, date_format(ex_date, '%Y-%m-%d') as 'ExamDate3'
, date_format(ex_date, '%M %e, %Y') as 'ExamDate4'
from vets.vt_exam_headers;

/*  TASK 06 */
select an_id
, an_name
from vets.vt_animals
join vets.vt_exam_headers using(an_id)
where ex_date >= '2015-01-01' and ex_date < '2015-06-31';

/* TASK 07 */
select an_id
, an_name
from vets.vt_animals
join vets.vt_exam_headers using(an_id)
where year(ex_date) = year(now() - interval 1 month)
and month(ex_date) = month(now() - interval 1 month);

/* TASK 08 */ 
select an_id
, an_name
, ex_date
from vets.vt_animals
join vets.vt_exam_headers using(an_id)
where date(ex_date) = last_day(ex_date); 

/* TASK 09 */
select @num := floor((rand() * (150-75+1))+75);
select ex_id
, srv_id
, ex_fee
from vets.vt_exam_details
where ex_fee > @num;

/* TASK 10 */
select an_id
, an_type
, case when an_type in ('cat', 'dog') then 'Cat/Dog' 
     when an_type in ('hamster', 'capybara', 'porcupine', 'dormouse') then 'Rodent'
       when an_type in ('snake', 'chelonian', 'crocodilian', 'lizard') then 'Reptile'
       else an_type
       end as 'Category'            
from vets.vt_animals;