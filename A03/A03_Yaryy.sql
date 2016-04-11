/* Rodion Yaryy */
\W    /* enable warnings! */

use vets; -- put the database name into this command and REMOVE the comment. Keep the ending semicolon;

/*  TASK 00 */ 
select user(), current_date(), version(), @@sql_mode\G

/*  TASK 01 */
select 
  concat ( cl_postal_code , ': ', cl_city, ' ', cl_state ) as 'Location'
from vets.vt_clients
where cl_state in ('CA', 'NV');

/*  TASK 02 */
select cl_name_first
, cl_name_last
, cl_phone
from vets.vt_clients
where cl_phone is not NULL
order by cl_id;

/*  TASK 03 */
select distinct srv_id
from vets.vt_services
where srv_list_price >= 75.00;

/*  TASK 04 */
select 
  concat ( stf_name_first, ' ', stf_name_last ) as 'staff'
, stf_id
, stf_job_title
from vets.vt_staff
where stf_job_title not in ('vet', 'vet assnt');

/*  TASK 05 */
select 
  srv_id as 'Service ID'
, srv_type as 'Service Type'
, srv_desc as 'Service Description'
, srv_list_price as 'Curr Price'
, srv_list_price * 1.15 as 'Incr Price'
from vets.vt_services
where srv_type not in('office visit')
order by srv_id;

/*  TASK 06 */
select 
  cl_id
, an_id
, an_name
from vets.vt_animals
where an_type in ('hamster', 'porcupine', 'dormouse')
order by cl_id, an_id;


/*  TASK 07 */
select 
  cl_id
, an_type 
from vets.vt_animals 
where an_type in ('snake', 'turtle', 'lizard')
order by cl_id;


/*  TASK 08 */
select 
  cl_id
, an_id
, an_name
, an_dob 
from vets.vt_animals
where an_type not in('snake', 'turtle', 'lizard', 'hamster', 'porcupine', 'dormouse')
order by an_dob desc;


/*  TASK 09 */


/*  TASK 10 */
