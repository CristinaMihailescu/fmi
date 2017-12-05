CREATE OR REPLACE PROCEDURE del_job_cm(cod_job IN jobs2_cm.job_id%type)
IS
BEGIN
DELETE FROM jobs2_cm
WHERE job_id = cod_job;

IF SQL%NOTFOUND THEN
dbms_output.put_line('Nicio actualizare');
END IF;
END del_job_cm;

BEGIN
del_job_cm('HR_REP');
END;

COMMIT;