set serveroutput on


create or replace procedure display_emoloyee(i_emp_id in number,o_name out varchar2)
as

BEGIN 
select last_name into o_name from employee where employee_id=i_emp_id;
 

exception
  when others then
   dbms_output.put_line('id not found'); 
END display_emoloyee;
/