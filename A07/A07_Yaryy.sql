/* Rodion Yaryy */
\W    /* enable warnings! */

use vets; 

/*  TASK 00 */ 
select user(), current_date(), version(), @@sql_mode\G

/*  TASK 01 */
select CL.cl_id, cl_name_last, AN.an_id, an_type, an_name
from vt_clients CL
left join vt_animals AN on CL.cl_id = AN.cl_id;

/* TAST 02 */ 
select AN.an_id, an_type, ex_id, YEAR(ex_date), stf_id
from vt_animals AN
left join vt_exam_headers EH on AN.an_id = EH.an_id; 

/* TAST 03 */ 
select distinct CL.cl_id, cl_name_last
from vt_clients CL
join vt_animals AN on CL.cl_id = AN.cl_id
where an_type NOT in ('snake','chelonian','crocodilian','lizard');

/* TASK 04 */
select CL.cl_id, CL.cl_name_last
from vt_clients CL
where CL.cl_id in (
  select cl_id
  from vt_animals 
  where an_type in ('dog'))
and cl_id in (
  select cl_id
  from vt_animals 
  where an_type in ('snake','chelonian','crocodilian','lizard'));

/* TASK 05 */
select CL.cl_id, CL.cl_name_last
from vt_clients CL
where CL.cl_id in (
  select cl_id
  from vt_animals 
  where an_type in ('dog'))
and cl_id NOT in (
  select cl_id
  from vt_animals 
  where an_type in ('snake','chelonian','crocodilian','lizard'));
    
/* TASK 06 */
select distinct AN.an_id, AN.an_name
from vt_animals AN
join vt_exam_headers EH on AN.an_id = EH.an_id
join vt_exam_details ED on EH.ex_id = ED.ex_id
where srv_id NOT in (104, 105, 106, 108);

/* TASK 07 */
select AN.an_id, AN.an_type, an_name, AN.cl_id
from vt_animals AN
where AN.an_id in (
  select an_id
    from vt_exam_headers
    where YEAR(ex_date) = 2015
) 
and AN.an_id in (
  select an_id
    from vt_exam_headers
    where YEAR(ex_date) = 2016 
);

/* TASK 08 */
select AN.an_id, AN.an_type, an_name, AN.cl_id
from vt_animals AN
where AN.an_id in ( 
  select an_id
    from vt_exam_headers
    where YEAR(ex_date) = YEAR(CURDATE())-1)
and AN.an_id NOT in (
  select an_id
    from vt_exam_headers
    where YEAR(ex_date) = YEAR(CURDATE())
);