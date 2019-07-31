SET SERVEROUTPUT ON
SET VERIFY OFF

accept fun prompt 'Enter the job name:'
DECLARE 
    v_fun VARCHAR2(30) :='&fun';
    v_count number(7);
BEGIN
select count(*),function INTO v_count,v_fun from employee join job using(job_id) group by function having function=upper(v_fun);
	
	dbms_output.put_line('job name: '|| v_fun);
    dbms_output.put_line('number of Employee: '||v_count);

EXCEPTION
	WHEN NO_DATA_FOUND THEN
	DBMS_OUTPUT.PUT_LINE(' Employee ID not found ');	
END;
/