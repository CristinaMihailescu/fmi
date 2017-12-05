DECLARE

nume employees.last_name%type;

PROCEDURE ex_2(p_rezultat IN OUT employees.last_name%type,
               p_comision IN employees.commission_pct%type:=NULL,
               p_cod IN employees.employee_id%type:=NULL)
IS
BEGIN
IF(p_comision IS NOT NULL) THEN
  SELECT last_name
  INTO p_rezultat
  FROM employees
  WHERE salary = (SELECT max(salary)
                  FROM employees
                  WHERE commission_pct = p_comision);
ELSE
SELECT last_name
INTO p_rezultat
FROM employees
WHERE employee_id = p_cod;

END IF;
END;

BEGIN
ex_2(nume, p_cod => 176);
dbms_output.put_line(nume);
END;

ROLLBACK;
