CREATE TABLE Obuchaushiesa(
	Kod_ob bigint NOT NULL,
	FIO varchar(50) NULL,
	Pol varchar(10) NULL,
	Data_r date NULL,
	Rodit varchar(50) NULL,
	Adres varchar(100) NULL,
	Tel varchar(15) NULL,
	Pasp varchar(100) NULL,
	No_stb bigint NULL,
	Data_p date NULL,
	Gruppa varchar(10) NULL,
	Kurs int NULL,
	Kod_napr bigint NULL,
	Och_FO int NULL,
 CONSTRAINT PK_st PRIMARY KEY  
(	Kod_ob ));

INSERT INTO Obuchaushiesa
     VALUES
(1,'Ivanov A.I.', 'Muzhsk', '1983-12-12', 'Otec, Mat', 'Moskwa', '+74957895674', '8567-567543', 13245, '2007-01-09', 'MM11', 1, 1, 1),
 (2,'Petrova I.I.', 'Zhensk', '1982-01-11', 'Mat', 'Moskwa', '+74957889876', '4567-765432', 34563, '2006-01-08', 'PI21', 2, 2, 0),
 (3,'Muhin I.A.', 'Muzhsk', '1982-05-14', 'Otec', 'Samara', '+78462875690', '5438-098787', 56732, '2006-05-07', 'CT22', 2, 3, 0),
 (4,'Sidorova V.K.', 'Zhensk', '1981-09-27', 'Net', 'Saratov', '+79027868909', '1287-987509', 27543, '2005-06-23', 'MO31', 3, 4, 1),
 (5,'Kozhevnikov A.A.', 'Muzhsk', '1981-12-04', 'Mat', 'Kazan', '+79168563476', '2312-675468', 34217, '2005-07-21', 'BU33', 3, 5, 1),
 (6,'Palchikova N.E.', 'Zhensk', '1983-02-09', 'Otec, Mat', 'Chelabinsk', '+74569098723', '8743-856780', 43278, '2007-01-08', 'MM12', 1, 1, 0),
 (7,'Caregorodcev A.B.', 'Muzhsk', '1980-02-17', 'Otec', 'Samara', '+78462234769', '6543-834521', 43765, '2004-04-07', 'PI41', 4, 2, 1),
 (8,'Baranova O.V.', 'Zhensk', '1980-09-07', 'Otec, Mat', 'Cheboksary', '+79027874638', '2133-896567', 10387, '2004-09-08', 'CT42', 4, 3, 0),
 (9,'Leuhin A.B.', 'Muzhsk', '1979-02-26', 'netu', 'Kazan', '+79067453678', '2769-634904', 67348, '2003-07-23', 'MO51', 5, 4, 1),
(10,'Nikolaeva A.P.', 'Zhensk', '1979-03-17', 'Mat', 'Saratov', '+78546456432', '3256-490932', 45287, '2003-06-21', 'BU53', 5, 5, 0) ,
(11,'Familiya  po variantu.', 'Luboj', '1950-05-05', 'Brat', 'Alatyr', '+78546456432', '3256-490932', 45287, '2003-06-21', 'BU53', 5, 5, 0);

CREATE TABLE Napravleniya (
Kod_napr bigint NOT NULL,
	Naim_napr varchar(50) NULL,
	Opis_napr varchar(100) NULL,
 CONSTRAINT PK_Napr PRIMARY KEY 
(	Kod_napr)); 

INSERT INTO Napravleniya VALUES
(1,'MM', 'Matemeticheskie metody'),
(2,'BU', 'Buhuchet'),
(3,'PI', 'Prikl inf'),
(4,'CT', 'Statistica'),
(5,'MO', 'Menedjment organizatsij');

CREATE TABLE Discipliny (
	Kod_disc bigint NOT NULL,
	Naim_disc varchar(50) NULL,
	Opis_disc varchar(100) NULL,
 CONSTRAINT PK_Disc PRIMARY KEY 
(Kod_disc));


INSERT INTO Discipliny
     VALUES
           (1,'Operacionnye sistemy', 'Windows'),
           (2,'Ofisnye pakety', 'MS Office'),
           (3,'Basy dannyh', 'MS Access'),
           (4,'Yazyki pr', 'Visual St'),
           (5,'Proek IS', 'SQL server');

CREATE TABLE Ocenki(
	Kod_obuch bigint NULL,
	Data_ekz1 date NULL,
	Kod_disc1 bigint NULL,
	Ocenka1 int NULL,
	Data_ekz2 date NULL,
	Kod_disc2 bigint NULL,
	Ocenka2 int NULL,
	Data_ekz3 date NULL,
	Kod_disc3 bigint NULL,
	Ocenka3 int NULL,
	Srednij_ball real NULL
);

INSERT INTO Ocenki
     VALUES
(1, '2008-02-01', 1, 5, '2008-02-09', 4, 3, '2008-02-04', 2, 4, 0),
(2, '2008-01-30', 5, 4, '2008-02-23', 3, 5, '2008-02-27', 1, 5, 0),
(3, '2008-01-26', 3, 5, '2008-02-05', 1, 3, '2008-02-15', 5, 3, 0),
(4, '2007-12-26', 2, 3, '2008-01-05', 4, 4, '2008-01-21', 3, 4, 0),
(5, '2008-01-12', 4, 4, '2008-01-18', 5, 4, '2008-01-25', 1, 4, 0),
(6, '2007-12-17', 2, 4, '2007-12-26', 4, 5, '2008-01-05', 1, 3, 0),
(7, '2008-02-21', 5, 2, '2008-02-25', 1, 2, '2008-02-20', 2, 4, 0),
(8, '2008-02-03', 3, 3, '2008-02-12', 5, 3, '2008-02-14', 4, 5, 0),
(9, '2008-01-25', 1, 5, '2008-02-02', 3, 5, '2008-01-23', 5, 5, 0),
(10, '2007-12-28', 4, 4, '2008-01-11', 1, 4, '2008-02-27', 2, 3, 0);



CREATE TABLE Vyvod (chislo bigint, stroka varchar(50), rl real);

CREATE or replace PROCEDURE srednee_treh_vel_Gromov
(Value1 Real = 0, Value2 Real = 0, Value3 Real = 0)
language SQL
AS $$
DELETE FROM Vyvod;
INSERT INTO Vyvod values (0, 'srednee=', (Value1+Value2+Value3)/3.0);
$$;

CALL srednee_treh_vel_Gromov (1, 7, 9 );

SELECT * from vyvod;

CREATE or replace PROCEDURE Otobr_obuch_po_FIO_Gromov
(FIO1 Varchar(50)='')
language sql
AS $$
DROP TABLE IF EXISTS Vyv2;
SELECT * INTO Vyv2 FROM Obuchaushiesa WHERE FIO LIKE CONCAT(FIO1,'%');
$$;

CALL Otobr_obuch_po_FIO_Gromov('I'); 

SELECT * from vyv2;

create view V1 as
SELECT Ocenki.Ocenka1 AS Expr1, Obuchaushiesa.FIO, Obuchaushiesa.Pol, Obuchaushiesa.Data_r, Obuchaushiesa.rodit, Obuchaushiesa.Adres, Obuchaushiesa.tel, 
Obuchaushiesa.pasp, Obuchaushiesa.no_stb, Obuchaushiesa.data_p, Obuchaushiesa.gruppa, Obuchaushiesa.kurs, Obuchaushiesa.kod_napr, 
Obuchaushiesa.och_fo, Ocenki.data_ekz1, Ocenki.kod_disc1, Ocenki.data_ekz2, Ocenki.kod_disc2, Ocenki.Ocenka2 AS Expr2, 
Ocenki.data_ekz3, Ocenki.kod_disc3, Ocenki.Ocenka3 AS Expr3, Ocenki.srednij_ball
FROM Ocenki INNER JOIN Obuchaushiesa ON Ocenki.kod_obuch = Obuchaushiesa.kod_ob;
                         
CREATE or replace PROCEDURE Otobr_ob_SR_b_Gromov
(Grade Real=0)
language sql
AS $$
DROP TABLE IF EXISTS Vyv2;
SELECT * INTO Vyv2 FROM V1 WHERE (Expr1+Expr2+Expr3)/3>Grade;
$$;

CALL Otobr_ob_SR_b_Gromov();

SELECT * from vyv2;

CREATE OR REPLACE FUNCTION F_sred_3_vel_Gromov
 (Value1 Int, Value2 Int, Value3 Int)
RETURNS Real
AS $func$
SELECT (Value1+Value2+Value3+0.0)/3.0;
$func$ LANGUAGE SQL;

SELECT F_sred_3_vel_Gromov(3, 5, 5);

CREATE OR REPLACE FUNCTION Posl_den_mes_Gromov
 (MyDate Date)
RETURNS Date 
AS $$ 
	DECLARE Year Int;
	 Month Int;
	 Day Int;
     TmpDate VarChar(10) ;
     Result Date;
BEGIN 
  Year:= date_part('year',  MyDate);
  Month:= date_part('month',  MyDate);
  Day:= date_part('day',  MyDate) ;
IF Month=12 THEN
Month:=1;
Year=Year+1;
ELSE
Month:=Month+1;
END IF;
TmpDate:=CONCAT(CAST(Month AS varchar(2)),'/01/',CAST(Year AS varchar(4)));
Result:=CAST(TmpDate AS Date);
Result:= Result - '1 day'::interval;
RETURN Result;
END;
$$ LANGUAGE plpgsql;

SELECT Posl_den_mes_Gromov('07/12/08');

CREATE OR REPLACE FUNCTION F_otb_po_vosr_Gromov()
RETURNS TABLE (fio2 VARCHAR(50), DR Date, Vozr INT) 
AS $$
BEGIN
RETURN QUERY SELECT FIO, Data_r , CAST(date_part('year',  Current_date)- date_part('year', Data_r) AS INT)
FROM Obuchaushiesa;
end;
$$ LANGUAGE 'plpgsql';

SELECT * FROM F_otb_po_vosr_Gromov();

CREATE OR REPLACE FUNCTION aft_insert_Gromov_fnc()
  RETURNS trigger AS
$$
BEGIN
 INSERT INTO vyvod 
VALUES(0, CONCAT('Запись добавлена ', CAST(current_timestamp AS CHAR(25))),0);
RETURN NEW;
END;
$$
LANGUAGE 'plpgsql';

CREATE TRIGGER employee_insert_trigger
  AFTER INSERT
  ON Obuchaushiesa
  EXECUTE PROCEDURE aft_insert_Gromov_fnc();
  
INSERT INTO Obuchaushiesa
VALUES
(13,'F. I. O.', 'Neizv', '1983-12-12', 'Otec, Mat', 'Moskwa', '+74957895674', '8567-567543', 13245, '2007-01-09', 'MM11', 1, 1, 1);

SELECT * FROM vyvod;

CREATE OR REPLACE FUNCTION aft_update_Gromov_fnc()
  RETURNS trigger AS
$$
BEGIN
 INSERT INTO vyvod 
VALUES(0, CONCAT('Запись изменена ', CAST(current_timestamp AS CHAR(25))),0);
RETURN NEW;
END;
$$
LANGUAGE 'plpgsql';

CREATE TRIGGER Gromov_upd_trigger
  AFTER UPDATE
  ON Obuchaushiesa
  EXECUTE PROCEDURE aft_update_Gromov_fnc();

UPDATE Obuchaushiesa SET adres='Samara' WHERE fio='Ivanov A.I.';
SELECT * FROM vyvod;

CREATE OR REPLACE FUNCTION aft_delete_Gromov_fnc()
  RETURNS trigger AS
$$
BEGIN
 INSERT INTO vyvod 
VALUES(0, CONCAT('Запись удалена ', CAST(current_timestamp AS CHAR(25))),0);
RETURN NEW;
END;
$$
LANGUAGE 'plpgsql';

CREATE TRIGGER Familia_del_trigger
  AFTER DELETE
  ON Obuchaushiesa
  EXECUTE PROCEDURE aft_delete_Gromov_fnc();

DELETE FROM Obuchaushiesa WHERE fio='Ivanov A.I.';

SELECT * FROM vyvod;

CREATE TABLE "Employee"
(
"EmployeeId" INT NOT NULL,
"LastName" VARCHAR(20) NOT NULL,
"FirstName" VARCHAR(20) NOT NULL,
"Title" VARCHAR(30),
"ReportsTo" INT,
"BirthDate" TIMESTAMP,
"HireDate" TIMESTAMP,
"Address" VARCHAR(70),
"City" VARCHAR(40),
"State" VARCHAR(40),
"Country" VARCHAR(40),
"PostalCode" VARCHAR(10),
"Phone" VARCHAR(24),
"Fax" VARCHAR(24),
"Email" VARCHAR(60),
CONSTRAINT "PK_Employee" PRIMARY KEY  ("EmployeeId")
);

CREATE TABLE "Employee_Audit"
("EmployeeId" INT NOT NULL,
"LastName" VARCHAR(50) NOT NULL,
"FirstName" VARCHAR(50) NOT NULL,
"UserName" VARCHAR(50) NOT NULL,
"EmpAdditionTime" VARCHAR(50) NOT NULL);

CREATE OR REPLACE FUNCTION Gromov_insert_trigger_fnc()
  RETURNS trigger AS
$$
BEGIN
INSERT INTO "Employee_Audit" ( "EmployeeId", "LastName", "FirstName","UserName" ,"EmpAdditionTime")
VALUES(NEW."EmployeeId",NEW."LastName",NEW."FirstName",current_user,current_date);
RETURN NEW;
END;
$$
LANGUAGE 'plpgsql';

CREATE TRIGGER Gromov_insert_trigger
  AFTER INSERT
  ON "Employee"
  FOR EACH ROW
  EXECUTE PROCEDURE Gromov_insert_trigger_fnc();

INSERT INTO "Employee" 
VALUES(12,' Smith','Jeff','Editor',1,'1992-05-28 00:00:00','2022-01-15 00:00:00','Paseo de Gracia','Barcelona','Catalonia','Spain','128 665','+15 52-469-2573','+15 52-469-2573','mail@mail.com');

SELECT * FROM "Employee_Audit";
