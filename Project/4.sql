set serveroutput on
create or replace function logina(i_emp_id in number,i_password in varchar2) return boolean
as

cursor c_emp is
select employee_id,password from employee;

v_id employee.employee_id%type;
v_pwd employee.password%type;

BEGIN 
  select employee_id,password into v_id,v_pwd from employee where employee_id=i_emp_id and password=i_password;
  
  FOR v_row IN c_emp LOOP

    if v_id =v_row.employee_id  then
      dbms_output.put_line(v_id || v_row.employee_id);
      if v_pwd = v_row.password then
        dbms_output.put_line(v_pwd|| v_row.password);
        return true;
      else
        return false;  
      end if;  
    end if;
  
  end loop;
exception
  when others then
   return false;
END logina;
/