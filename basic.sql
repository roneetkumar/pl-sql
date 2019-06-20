SET SERVEROUTPUT ON
SET VERIFY OFF

DECLARE
V_TOTAL NUMBER := 0;
V_COUNTER NUMBER := 0;
V_NUMBER NUMBER := 0;

BEGIN

    LOOP
        EXIT WHEN V_NUMBER > 100;
        IF MOD(V_NUMBER, 3) = 0 THEN
            V_TOTAL := V_NUMBER + V_TOTAL;
            V_COUNTER := V_COUNTER + 1;
            V_NUMBER := V_NUMBER + 3;
            CONTINUE;
        END IF; 
        V_NUMBER := V_NUMBER + 1;
    END LOOP; 
    
    DBMS_OUTPUT.PUT_LINE('TOTAL = ' || V_TOTAL);
    DBMS_OUTPUT.PUT_LINE('PERCENTAGE = ' || (V_COUNTER/100));
-- EXCEPTION
   
END;
/
