--Ex 1
DECLARE
TYPE info_ang IS RECORD (
  cod_ang NUMBER(4),
  nume VARCHAR2(20),
  salariu NUMBER(8),
  cod_dep NUMBER(4));
v_info_ang info_ang;
BEGIN
DELETE FROM emp
WHERE employee_id = 200
RETURNING employee_id, first_name, salary, department_id
INTO v_info_ang;
dbms_output.put_line('A fost stearsa linia continand valorile '||v_info_ang.cod_ang ||' '||v_info_ang.nume||' '||v_info_ang.salariu ||' '|| v_info_ang.cod_dep); 
END;
/
ROLLBACK;

--Ex 2
DECLARE
TYPE info_ang IS RECORD(
  EMPLOYEE_ID NUMBER(6,0),
  FIRST_NAME VARCHAR2(20 BYTE),
  LAST_NAME VARCHAR2(25 BYTE) := 'Smith',
  EMAIL VARCHAR2(25 BYTE) := 'smithy@gmail.com',
  PHONE_NUMBER VARCHAR2(20 BYTE),
  HIRE_DATE DATE := SYSDATE,
  JOB_ID VARCHAR2(10 BYTE) := 'SH_CLERK',
  SALARY NUMBER(8,2),
  COMMISSION_PCT NUMBER(2,2),
  MANAGER_ID NUMBER(6,0),
  DEPARTMENT_ID NUMBER(4,0),
  VECHIME VARCHAR2(200 BYTE));
v_info_ang info_ang;
BEGIN
INSERT INTO empp
VALUES v_info_ang;

v_info_ang.LAST_NAME := 'Nerd';

UPDATE empp
SET ROW = v_info_ang
WHERE v_info_ang.EMPLOYEE_ID = employee_id;
END;
/

ROLLBACK;

--Ex 4
DECLARE
TYPE numbers IS TABLE OF NUMBER INDEX BY BINARY_INTEGER;
v_numbers numbers;
BEGIN
FOR i IN 1..20 LOOP
v_numbers(i) := i*i;
dbms_output.put_line(v_numbers(i));
END LOOP;

v_numbers(4) := NULL;

FOR i IN 1..v_numbers.last LOOP
dbms_output.put_line(v_numbers(i));
END LOOP;
END;
/

--Ex 5
DECLARE
TYPE numbers IS TABLE OF departments%ROWTYPE INDEX BY BINARY_INTEGER;
v_numbers numbers;
BEGIN
v_numbers(1).department_id := 92;
v_numbers(1).department_name := 'New Dep';
v_numbers(1).location_id := 2700;

INSERT INTO departments
VALUES v_numbers(1);

v_numbers.delete;
END;
/

ROLLBACK;
