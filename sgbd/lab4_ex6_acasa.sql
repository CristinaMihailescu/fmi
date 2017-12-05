CREATE OR REPLACE PROCEDURE upd_job_cm(cod_job IN jobs2_cm.job_id%type,
                                       titlu IN jobs2_cm.job_title%type)
IS
BEGIN
UPDATE jobs2_cm
SET job_title = titlu
WHERE job_id = cod_job;

IF SQL%NOTFOUND THEN
dbms_output.put_line('Nicio actualizare');
END IF;
END upd_job_cm;

EXECUTE upd_job_cm('IT_DBA', 'Data Administrator');
EXECUTE upd_job_cm('HR_REP', 'Random');

COMMIT;