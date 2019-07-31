set serveroutput on
set verify off
DECLARE
v_id employee.employee_id%type:=&sv_id;
v_pwd employee.password%type:='&sv_pwd';
begin
if logina(v_id,v_pwd) then
dbms_output.put_line('LOGIN SUCCESSFUL');
else
dbms_output.put_line('incorrect username or password');
end if;
end;
/