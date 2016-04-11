/* Rodion Yaryy */
\W    /* enable warnings! */

use vets; -- put the database name into this command and REMOVE the comment. Keep the ending semicolon;

/*  TASK 00 */ 
select user(), current_date(), version(), @@sql_mode\G

/*  TASK 01 */
select cl_id
, an_id
, an_type
, an_name
from vets.vt_animals
where an_type in ('cat', 'dog');

/*  TASK 02 */
select ex_id
, ex_date
, srv_id
, ex_fee
from vets.vt_exam_details 
join vets.vt_exam_headers using (ex_id)
join vets.vt_animals using (an_id) 
where an_type in ('hamster', 'capybara', 'porcupine', 'dormouse')
order by ex_id, srv_id; 

/*  TASK 03 */
select stf_id
, concat ( stf_name_last, ' ', stf_name_last ) as 'staff'
, ex_date
from vets.vt_staff
join vets.vt_exam_headers using (stf_id)
join vets.vt_animals using (an_id) 
where an_type not in ('bird', 'snake', 'chelonian', 'crocodilian', 'lizard')
order by ex_date; 

/*  TASK 04 */
select cl_id
, ex_id
, ex_date
, srv_id
, ex_fee
from vets.vt_clients
join vets.vt_animals using (cl_id)
join vets.vt_exam_headers using (an_id)
join vets.vt_exam_details using (ex_id)
where ex_fee not between 25.00 and 200.00
order by ex_date, srv_id; 

/*  TASK 05 */
select * 
from vets.vt_services
where srv_desc like '%Feline%'
and srv_desc not like '%Dental%'
order by srv_type, srv_id; 

/*  TASK 06 */
select distinct cl_id
, cl_name_last
from vets.vt_clients
join vets.vt_animals using (cl_id)
where an_type like 'dog'
order by cl_id; 

/*  TASK 07 */
select distinct cl_id
, cl_name_last
from vets.vt_clients
join vets.vt_animals using (cl_id)
where an_type not in ('dog')
order by cl_id; 

/*  TASK 08 */
select distinct cl_id
, cl_name_last
from vets.vt_clients
join vets.vt_animals using (cl_id)
where an_type in ('hamster', 'capybara', 'porcupine', 'dormouse')
order by cl_id; 

/*  TASK 09 */
select distinct cl_id
, cl_name_last
from vets.vt_clients
join vets.vt_animals using (cl_id)
where an_type not in ('hamster', 'capybara', 'porcupine', 'dormouse')
order by cl_id;
