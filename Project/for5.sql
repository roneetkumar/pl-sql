set serveroutput on
set verify off
DECLARE
v_id employee.employee_id%type:=&sv_id;
v_name employee.last_name%type;

begin
display_emoloyee(v_id,v_name);
dbms_output.put_line('Employee ID: '||v_id);
dbms_output.put_line('Last Name: '||v_name);
end;
/