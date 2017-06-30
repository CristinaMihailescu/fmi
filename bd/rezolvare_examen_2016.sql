SELECT oj.denumire, oj.cod, c.nume, c.prenume, c.cod, t.denumire
FROM OFERTA_JOB oj
LEFT JOIN APLICA a ON (a.cod_job = oj.cod)
LEFT JOIN CANDIDAT c ON (a.cod_candidat = c.cod)
LEFT JOIN APTITUDINE ap ON (ap.cod_candidat = c.cod)
LEFT JOIN TEHNOLOGIE t ON (ap.cod_tehn = t.cod);

SELECT DISTINCT t.denumire
FROM TEHNOLOGIE t
JOIN (
      SELECT cod_tehn, nivel, COUNT(cod_job) as x
      FROM SOLICITA
      GROUP BY cod_tehn, nivel) s ON (t.cod = s.cod_tehn)
JOIN (
      SELECT cod_tehn, nivel, COUNT(cod_candidat) as y
      FROM APTITUDINE
      GROUP BY cod_tehn, nivel) a ON (t.cod = a.cod_tehn)
WHERE x < y;

SELECT c.cod, c.nume, c.prenume
FROM CANDIDAT c
WHERE NOT EXISTS(SELECT DISTINCT aa.cod_tehn, aa.nivel
      FROM APTITUDINE aa
      JOIN OFERTA_JOB oj ON (oj.castigator = aa.cod_candidat)
      WHERE oj.data LIKE '%2014%' AND oj.salariu_start >= (SELECT MAX(salariu_start) FROM OFERTA_JOB WHERE data LIKE '%2014%')
      MINUS
      SELECT DISTINCT a.cod_tehn, a.nivel
      FROM APTITUDINE a
      WHERE a.cod_candidat = c.cod
      );

/*
ALTER TABLE CANDIDAT
ADD PRIMARY KEY (COD);

ALTER TABLE OFERTA_JOB
ADD PRIMARY KEY (COD);
*/

CREATE TABLE APLICA2
(
    COD_CANDIDAT INTEGER NOT NULL,
    COD_JOB INTEGER NOT NULL,
    DATA_APL DATE,
    OBSERVATII VARCHAR2(20),
    CONSTRAINT FK_COD_CANDIDAT FOREIGN KEY(COD_CANDIDAT) REFERENCES CANDIDAT (COD) ON DELETE CASCADE,
    CONSTRAINT FK_COD_JOB FOREIGN KEY(COD_JOB) REFERENCES OFERTA_JOB (COD) ON DELETE CASCADE
);

/*
DROP TABLE APLICA2;
*/

/*
ALTER TABLE OFERTA_JOB oj
SET oj.castigator = c.cod
FROM (;

SELECT aa.cod_job, aa.cod_candidat
FROM APLICA aa
WHERE (aa.cod_job, aa.cod_candidat) = (
        SELECT cod_job, cod
        FROM(
              SELECT s.cod_job, c.cod, COUNT(CASE WHEN s.cod_tehn = a.cod_tehn AND s.nivel = a.nivel THEN 1 END) as cnt
              FROM CANDIDAT c
              JOIN APLICA ap ON (ap.cod_candidat = c.cod)
              JOIN SOLICITA s ON (ap.cod_job = s.cod_job)
              JOIN APTITUDINE a ON (a.cod_candidat = c.cod)
              WHERE aa.cod_job = s.cod_job
              GROUP BY c.cod, s.cod_job
              ORDER BY cnt
        )
        LIMIT 1
);
fmm
*/