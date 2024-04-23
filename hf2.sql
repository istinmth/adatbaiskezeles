SELECT * INTO #Felhasznalok /*Ez egy temporary tábla*/ FROM Ugyfel;

ALTER TABLE #Felhasznalok
ALTER COLUMN login ADD MASKED WITH (FUNCTION = 'partial(1,"XXXXXXX",0)');

ALTER TABLE #Felhasznalok
ALTER COLUMN email ADD MASKED WITH (FUNCTION = 'email()');

ALTER TABLE #Felhasznalok
ALTER COLUMN CIM ADD MASKED WITH (FUNCTION = 'default()')

ALTER TABLE #Felhasznalok
ALTER COLUMN SZULEV ADD MASKED WITH (FUNCTION  = 'random(1,5)')

SELECT * FROM #Felhasznalok

/*Ez csak akkor működne, ha lenne jogosultságunk a webshop táblához*/
CREATE USER MaskedUser WITHOUT LOGIN;

EXECUTE AS USER='MaskedUser';
SELECT *
FROM #Felhasznalok
REVERT