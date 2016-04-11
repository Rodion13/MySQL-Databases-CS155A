/*  Rodion Yaryy */
\W    /* enable warnings! */

use vets;  -- put the database name into this command and REMOVE the comment. Keep the ending semicolon;

/*  TASK 00 */ 
select user(), current_date(), version(), @@sql_mode\G

/*  TASK 01 */
select stf_name_first, stf_name_last, stf_job_title 
from vets.vt_staff;

/*  TASK 02 */
select
  an_id as 'ID',
  an_name as 'Name',
  an_type as 'Animal Type',
  an_dob as 'Birth Date'
from vets.vt_animals
order by an_dob;

/*  TASK 03 */
select distinct an_type 
from vets.vt_animals;

/*  TASK 04 */
select srv_type, srv_desc 
from vets.vt_services
order by srv_type, srv_list_price;  

/*  TASK 05 */
select 
  ex_id as 'Exam_ID',
  srv_id as 'Service',
  ex_fee as 'Fee_Charged'
from vets.vt_exam_details
order by ex_id, ex_fee; 


/*  TASK 06 */
select distinct an_name, an_type, an_dob
from vets.vt_animals
order by an_type, an_name;

/*  TASK 07 */
select 
  an_id as 'Animal',
  ex_date as 'Exam Date',
  stf_id as 'Staff'
from vets.vt_exam_headers
order by stf_id, ex_date;

/*  TASK 08 */
select distinct cl_city, cl_state
 from vets.vt_clients
 order by cl_state, cl_city;

/*  TASK 09 */


/*  TASK 10 */
