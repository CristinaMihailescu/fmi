DECLARE

linie_rec dep%rowtype;

PROCEDURE introduce_inregistrare(linie_rec IN dep%rowtype)
IS
BEGIN
INSERT INTO dep
VALUES linie_rec;
END;

BEGIN
linie_rec.department_name := 'NOC';
linie_rec.department_id := 220;
linie_rec.manager_id := 145;
linie_rec.location_id := 1700;

introduce_inregistrare(linie_rec);

END;

ROLLBACK;