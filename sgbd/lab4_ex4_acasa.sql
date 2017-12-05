DROP PROCEDURE ex_3;

CREATE OR REPLACE PROCEDURE ex_3(p_nume IN varchar2)
IS
BEGIN
dbms_output.put_line(p_nume || ' invata PL/SQL.');
END;

EXECUTE ex_3('Cristina');