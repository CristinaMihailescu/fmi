CREATE TABLE jobs2_cm AS SELECT * FROM jobs;

ALTER TABLE jobs2_cm ADD CONSTRAINT pk_jobs_cm PRIMARY KEY(job_id);

CREATE OR REPLACE PROCEDURE add_job_cm(p_id IN jobs2_cm.job_id%type,
                                       p_title IN jobs2_cm.job_title%type)
IS
BEGIN
INSERT INTO jobs2_cm(job_id, job_title)
VALUES (p_id, p_title);
END;

COMMIT;

EXECUTE add_job_cm('IT_MA', 'IT Manager');

ROLLBACK;

DROP TABLE jobs2_cm;