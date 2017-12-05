CREATE OR REPLACE PROCEDURE ex_3
IS
azi DATE := sysdate;
ieri azi%type;
BEGIN
dbms_output.put_line('Programare PL/SQL' || ' ' || 
                     to_char(azi, 'DD-MONTH-YYYY hh24:mi:ss'));
ieri := azi-1;
dbms_output.put_line(to_char(ieri, 'DD-MONTH-YYYY'));
END;

--EXECUTE ex_3;

--ROLLBACK;