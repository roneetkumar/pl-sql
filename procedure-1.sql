SET SERVEROUTPUT ON
SET VERIFY OFF

CREATE OR REPLACE PROCEDURE DISPLAY (I_DEP_ID IN NUMBER)
AS
    V_NAME DEPARTMENT.NAME%TYPE;
    V_LOCATION LOCATION.REGIONAL_GROUP%TYPE;
    
BEGIN
    SELECT D.NAME , L.REGIONAL_GROUP
        INTO V_NAME , V_LOCATION
        FROM DEPARTMENT D JOIN LOCATION L
        USING(LOCATION_ID)
        WHERE DEPARTMENT_ID = I_DEP_ID;
        DBMS_OUTPUT.PUT_LINE('DEPARTMENT ID : ' || I_DEP_ID);      
        DBMS_OUTPUT.PUT_LINE('DEPARTMENT NAME : ' || V_NAME);
        DBMS_OUTPUT.PUT_LINE('LOCATION : ' || V_LOCATION);

EXCEPTION
  WHEN OTHERS THEN
        DBMS_OUTPUT.PUT_LINE('ID NOT FOUND');
END DISPLAY;
/