set serveroutput on
set verify off

DECLARE   

    
    v_salesperson customer.salesperson_id%type:=&sv_salesperson;
   
	CURSOR c_cust IS 
    
    select salesperson_id,name,credit_limit,city from customer where salesperson_id=v_salesperson;
    


BEGIN
	
	FOR v_row IN c_cust LOOP
	
		
		 DBMS_OUTPUT.PUT_LINE('Name = '||v_row.name);
        DBMS_OUTPUT.PUT_LINE('City = '||v_row.city);
        DBMS_OUTPUT.PUT_LINE('Credit Limit = '||v_row.credit_limit);
		DBMS_OUTPUT.PUT_LINE(chr(10));
		
	END LOOP;
   
		
	exception
      when no_data_found then
      dbms_output.put_line('Customer ID not found');   
END;
