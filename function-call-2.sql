SET SERVEROUTPUT ON
SET VERIFY OFF
    
BEGIN
    if is_valid(10) then
        dbms_output.put_line('exist');
    else
        dbms_output.put_line('does not exist');
    end if;
   
EXCEPTION
  WHEN OTHERS THEN
        DBMS_OUTPUT.PUT_LINE('ID NOT FOUND');
END;
/