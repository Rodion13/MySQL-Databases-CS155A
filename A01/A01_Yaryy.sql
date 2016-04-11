# Rodion Yaryy
\W/* enable warnings! */

use a_testbed;

/*  TASK 00 */ 
select user(), current_date(), version(), @@sql_mode\G

/*  TASK 01 */
delete
from a_testbed.zoo_2016

where z_id > 100;
select *
from a_testbed.zoo_2016 ;

/*  TASK 02 */
Insert Into a_testbed.zoo_2016  (z_id, z_name, z_type, z_cost, z_dob, z_acquired)   Values
   (145,'Ken','Kenguru', 5000.00, '2013-02-14','2015-09-17'),
   (146,'5th Element','Lion', 4500.00, '2013-02-14','2015-09-17'),
   (147,'Barny','Goat', 500.00, '2013-02-14','2015-09-17');


/*  TASK 03 */
Insert Into a_testbed.zoo_2016  (z_id, z_name, z_type, z_cost, z_dob, z_acquired)   Values
  (111,'Lizzy','Bear', 5000.00, '2016-01-15','2016-01-26'),
  (122, 'Fil', 'Snake', 490.00, '2013-01-15', '2013-04-05'),
  (133, 'Mary', 'Rat', 5000.00, '2011-02-24', '2011-03-28');

Insert Into  a_testbed.zoo_2016  (z_id, z_name, z_type, z_cost, z_dob, z_acquired)    Values
  (152, 'Ram', 'Cheetah', 1500.00, '2012-06-10', '2013-01-08');

Insert Into  a_testbed.zoo_2016  (z_id, z_name, z_type, z_cost, z_dob, z_acquired)    Values
  (183, 'Survivor', 'Coyote', 400.00, '2010-02-15', '2015-05-21');

Insert Into zoo_2016 values
( 101, 'Pumpkin', 'Armadillo', 2500.00, '2015-01-06 10:48:00', '2016-01-12' )
,
( 221, 'Hippy', 'Hippo', 4000.00, '2014-05-06 12:17:45', '2015-08-15' )
,
( 465, 'Pete', 'Penguin', 2000.55, '2013-12-06 12:03:00', '2014-07-12' )
;

/*  TASK 04 */
select z_id, z_name, z_type, z_cost, z_dob, z_acquired
    from a_testbed.zoo_2016;

/*  TASK 05 */
Select z_type, z_name, z_cost 
From a_testbed.zoo_2016 
Order By z_type, z_name;


/*  TASK 06 */
Select z_id, z_name, z_dob
From a_testbed.zoo_2016
Where z_type = "Zebra";

/*  TASK 07 */
show tables;

/*  TASK 08 */
desc a_testbed.zoo_2016;

/*  TASK 09 */
show variables like 'char%';

