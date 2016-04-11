/* Rodion Yaryy */
\W    /* enable warnings! */

use vets;

/*  TASK 00 */ 
select user(), current_date(), version(), @@sql_mode\G

/*  TASK 01 */
select vt_clients.cl_id, cl_name_last
from vt_animals
right join vt_clients on vt_animals.cl_id = vt_clients.cl_id
where vt_animals.cl_id is NULL;
    
/*  TASK 02 */
select CL.cl_id, cl_name_last
from vt_clients CL
where CL.cl_id NOT in (
  select AN.cl_id
    from vt_animals AN
);

/*  TASK 03 */
select CL.cl_id, cl_name_last
from vt_clients CL
where CL.cl_id in ( 
  select AN.cl_id
    from vt_animals AN
    where an_type NOT in ('snake', 'chelonian', 'crocodilian', 'lizard')
) 
or
CL.cl_id NOT in (
  select AN.cl_id
    from vt_animals AN
);

/* TASK 04 */
select CL.cl_id, cl_name_last
, case 
  when an_name <=> an_type then 'no animals'
  when an_name is null then 'no name'
  else an_name
  end as an_name
, if (an_type is NULL, 'no animals', an_type) as an_type  
from vt_animals AN
right join vt_clients CL on AN.cl_id = CL.cl_id;

/* TASK 05 */
select CL.cl_id, cl_name_last, AN.an_id, an_name, an_type 
from vt_animals AN
left join vt_exam_headers EH on AN.an_id = EH.an_id
join vt_clients CL on AN.cl_id = CL.cl_id
where EH.an_id is NULL;

/* TASK 06 */
select CL.cl_id, cl_name_last, AN.an_id, an_name, an_type 
from vt_animals AN
left join vt_exam_headers EH on AN.an_id = EH.an_id
right join vt_clients CL on AN.cl_id = CL.cl_id
where EH.an_id is NULL;


/* TASK 07 */
select CL.cl_id, cl_name_last, an_id, an_name, an_dob
from vt_clients CL
inner join vt_animals AN on Cl.cl_id = AN.cl_id 
where cl_state in ('NY', 'MA') AND
an_type NOT in ('bird','dog','cat');

/* TASK 08 */
select AN.an_id, an_name
from vt_animals AN
inner join vt_exam_headers EH on AN.an_id = EH.an_id
where YEAR(ex_date) = YEAR(CURDATE());

/* TASK 09 */
select SR.srv_id, srv_list_price, srv_desc, srv_type
from vt_services SR
left join vt_exam_details ED on SR.srv_id = ED.srv_id
where ED.srv_id is null AND
srv_list_price >= 100.00;


  
