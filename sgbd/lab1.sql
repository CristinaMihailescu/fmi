--Ex 1
SET SERVEROUTPUT ON
DECLARE
message varchar(20) := 'Invat PL/SQL';
BEGIN
dbms_output.put_line(message);
END;
/
SET SERVEROUTPUT OFF

--Ex2
SET SERVEROUTPUT ON
DECLARE
v_oras locations.city%TYPE;
BEGIN
SELECT city
INTO v_oras
FROM departments d, locations l
WHERE d.location_id = l.location_id AND department_id = 30;
dbms_output.put_line(v_oras);
END;
/
SET SERVEROUTPUT OFF

--Ex3
SET SERVEROUTPUT ON
DECLARE
v_media_sal employees.salary%TYPE;
v_dept NUMBER := 50;
BEGIN
SELECT AVG(salary)
INTO v_media_sal
FROM employees
WHERE department_id = v_dept;
dbms_output.put_line(v_media_sal);
END;
/
SET SERVEROUTPUT OFF

--Ex 4
ACCEPT p_cod_dep PROMPT ‘Introduceti codul departamentului ‘
DECLARE v_cod_dep departments.department_id%TYPE := &p_cod_dep;
v_numar NUMBER(3) := 0;
v_comentariu VARCHAR2(10);
BEGIN
SELECT COUNT(*)
INTO v_numar
FROM employees
WHERE department_id = v_cod_dep;

IF v_numar < 10 THEN
v_comentariu := 'mic';
ELSIF v_numar BETWEEN 10 and 30 THEN
v_comentariu := 'mediu';
ELSE v_comentariu := 'mare';
END IF;

dbms_output.put_line('Departamentul cu codul ' || v_cod_dep || ' este ' || v_comentariu || '.');
END;
/

--Ex 5
SET SERVEROUTPUT ON
SET VERIFY OFF
DEFINE p_cod_dep = 50
DEFINE p_com = 10
DECLARE
v_cod_dep employees.department_id%TYPE := &p_cod_dep;
v_com FLOAT := &p_com/100;
BEGIN
dbms_output.put_line(v_com);
UPDATE employees
SET commission_pct = v_com
WHERE department_id = v_cod_dep;

IF SQL%ROWCOUNT = 0 THEN
dbms_output.put_line('Nicio linie actualizata.');
ELSE dbms_output.put_line(SQL%ROWCOUNT || ' linii actualizate.');
END IF;
END;
/
SET VERIFY ON
SET SERVEROUTPUT OFF

--Ex 6
SET SERVEROUTPUT ON
ACCEPT p_zi
DECLARE
v_zi  CHAR(2) := UPPER('&p_zi');
v_comentariu  VARCHAR2(20);
BEGIN CASE v_zi
WHEN 'L' THEN v_comentariu := 'Luni';
WHEN 'M' THEN v_comentariu := 'Marti';
WHEN 'MI' THEN v_comentariu := 'Miercuri';
WHEN 'J' THEN v_comentariu := 'JOI';
WHEN 'V' THEN v_comentariu := 'Vineri';
WHEN 'S' THEN v_comentariu := 'Sambata';
WHEN 'D' THEN v_comentariu := 'Duminica';
ELSE v_comentariu := ' eroare!';
END CASE;
DBMS_OUTPUT.PUT_LINE('Ziua este ' || v_comentariu);
END;
/
SET SERVEROUTPUT OFF

--Ex 7
ALTER TABLE emp
ADD vechime2 VARCHAR(200);

SET VERIFY OFF
ACCEPT p_cod
DECLARE
v_cod emp.employee_id%TYPE := &p_cod;
v_an INT;
v_simbol emp.vechime2%TYPE;
BEGIN
SELECT CAST (to_char(hire_date, 'YYYY') as INT)
INTO v_an
FROM emp
WHERE employee_id = v_cod;

FOR i IN 1..(2017 - v_an) LOOP
v_simbol := v_simbol || '#';
END LOOP;

UPDATE emp
SET vechime2 = v_simbol
WHERE employee_id = v_cod;
COMMIT;
END;
/
SET VERIFY ON

--Ex 8
ACCEPT p_n
DECLARE
v_n INT := &p_n;
v_result INT := 1;
BEGIN
WHILE v_n != 0 LOOP
v_result := v_result * v_n;
v_n := v_n - 1;
END LOOP;
DBMS_OUTPUT.PUT_LINE(v_result);
END;
/