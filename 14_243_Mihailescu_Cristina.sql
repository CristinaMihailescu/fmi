/*
1. S? se ob?in? numele turi?tilor ?i denumirea excursiilor oferite de agen?ia “Smart Tour”
achizi?ionate de c?tre ace?tia. (2p)
*/

SELECT t.nume, t.prenume, e.denumire
FROM turist           t
JOIN achizitioneaza   a    ON a.cod_turist = t.id_turist
JOIN excursie         e    ON e.id_excursie = a.cod_excursie
JOIN agentie          ag   ON ag.id_agentie = e.cod_agentie
WHERE UPPER(ag.denumire) LIKE ('%SMART TOUR%');

/*
2. S? se afi?eze numele si prenumele turi?tilor care au achizi?ionat cel pu?in acelea?i
excursii ca ?i turistul Stanciu. (2.5p)
*/

SELECT DISTINCT t.nume, t.prenume
FROM turist           t
JOIN achizitioneaza   a   ON   a.cod_turist = t.id_turist
JOIN excursie         e   ON   e.id_excursie = a.cod_excursie
JOIN agentie          ag  ON   ag.id_agentie = e.cod_agentie
WHERE UPPER(t.nume) NOT LIKE ('%STANCIU%') AND NOT EXISTS (
      SELECT DISTINCT ee.id_excursie
      FROM turist           tt
      JOIN achizitioneaza   aa   ON   aa.cod_turist = tt.id_turist
      JOIN excursie         ee   ON   ee.id_excursie = aa.cod_excursie
      JOIN agentie          agg  ON   agg.id_agentie = ee.cod_agentie
      WHERE UPPER(tt.nume) LIKE ('%STANCIU%')
  MINUS
      SELECT DISTINCT ee.id_excursie
      FROM turist           tt
      JOIN achizitioneaza   aa   ON   aa.cod_turist = tt.id_turist
      JOIN excursie         ee   ON   ee.id_excursie = aa.cod_excursie
      JOIN agentie          agg  ON   agg.id_agentie = ee.cod_agentie
      WHERE tt.id_turist = t.id_turist
  );
  
/*
3. S? se afi?eze denumirea ?i ora?ul pentru agen?iile care au cel pu?in 3 excursii oferite la
un pre? mai mic decât 2000 euro. (2p)
*/

SELECT DISTINCT ag.denumire, ag.oras
FROM excursie   e
JOIN agentie    ag   ON   ag.id_agentie = e.cod_agentie
WHERE ag.id_agentie IN (
      SELECT agg.id_agentie
      FROM excursie   ee
      JOIN agentie    agg   ON   agg.id_agentie = ee.cod_agentie
      WHERE ee.pret <= 2000
      GROUP BY agg.id_agentie
      HAVING COUNT(ee.id_excursie) >= 3
  );
      
/*
4. Modifica?i discount-ul ob?inut la achizi?ionarea excursiilor care au un pre? peste medie
astfel încat s? devin? egal cu maximul discount-urilor oferite pân? acum. Anula?i
modificarile. (2.5p)
*/

UPDATE achizitioneaza
SET discount = (SELECT MAX(discount) FROM achizitioneaza)
WHERE cod_excursie IN (
      SELECT DISTINCT aa.cod_excursie
      FROM achizitioneaza   aa
      JOIN excursie         ee    ON   ee.id_excursie = aa.cod_excursie
      JOIN agentie          agg   ON   agg.id_agentie = ee.cod_agentie
      WHERE ee.id_excursie IN (
            SELECT DISTINCT e.id_excursie
            FROM achizitioneaza   a
            JOIN excursie         e   ON   e.id_excursie = a.cod_excursie
            WHERE e.pret > (SELECT AVG(pret) FROM excursie)));

ROLLBACK;