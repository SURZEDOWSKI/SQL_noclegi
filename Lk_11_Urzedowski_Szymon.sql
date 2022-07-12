CLEAR SCREEN;
SET WRAP OFF;
SET LINESIZE 500;
SET PAGESIZE 500;

SET SERVEROUTPUT ON;

PROMPT ;
PROMPT Kasowanie tabel;
PROMPT ;
--
-- UWAGA! Jesli tabele istnieja to zostana usuniete:

ALTER SESSION SET nls_date_format = 'YYYY.MM.DD';

DELETE FROM REZERWACJA;
DROP TABLE REZERWACJA;
--

DELETE FROM APARTAMENT;
DROP TABLE APARTAMENT;
--

DELETE FROM OBIEKT;
DROP TABLE OBIEKT;
--

DELETE FROM WPLATA;
DROP TABLE WPLATA;
--

DELETE FROM WYKUPIONA_USLUGA;
DROP TABLE WYKUPIONA_USLUGA;
--

DELETE FROM GOSC;
DROP TABLE GOSC;
--

DELETE FROM APARTAMENT_INFO;
DROP TABLE APARTAMENT_INFO;
--

DELETE FROM PRACOWNIK;
DROP TABLE PRACOWNIK;
--

DELETE FROM RABAT;
DROP TABLE RABAT;
--

DELETE FROM USLUGA;
DROP TABLE USLUGA;
--

DELETE FROM MIEJSCE_PARKINGOWE;
DROP TABLE MIEJSCE_PARKINGOWE;
--


create table MIEJSCE_PARKINGOWE
(
	MIE_ID 		number(3) 		NOT NULL,
	MIE_NUMER 	varchar2(3) 	NOT NULL
); 

	alter table MIEJSCE_PARKINGOWE
	add constraint CSR_PK_MIEJSCE_PARKINGOWE
	primary key (MIE_ID);

	alter table MIEJSCE_PARKINGOWE
	add constraint CSR_QU_MIEJSCE_PARKINGOWE
	unique (MIE_NUMER);

	drop sequence SEQ_MIEJSCE_PARKINGOWE;
	--
	create sequence SEQ_MIEJSCE_PARKINGOWE increment by 1 start with 1
	maxvalue 9999999999 minvalue 1;
	--

	create or replace trigger T_BI_MIEJSCE_PARKINGOWE
	before insert on MIEJSCE_PARKINGOWE
	for each row
	begin
	 if :new.MIE_ID is NULL then
	 SELECT SEQ_MIEJSCE_PARKINGOWE.nextval INTO :new.MIE_ID FROM dual;
	 end if;
	end;
	/

		insert into MIEJSCE_PARKINGOWE (MIE_NUMER)
		values ('11');
		
		insert into MIEJSCE_PARKINGOWE (MIE_NUMER)
		values ('21');

		column MIE_ID HEADING 'ID' for 999999
		column MIE_NUMER HEADING 'NUMER MIEJSCA' for A20
		
		SELECT * from MIEJSCE_PARKINGOWE;
	

create table USLUGA
(
	USL_ID 		number(3) 		NOT NULL,
	USL_RODZAJ 	varchar2(20) 	NOT NULL,
	USL_CENA	number(6),
	USL_OPIS	varchar2(100)
); 

	alter table USLUGA
	add constraint CSR_PK_USLUGA
	primary key (USL_ID);

	drop sequence SEQ_USLUGA;
	--
	create sequence SEQ_USLUGA increment by 1 start with 1
	maxvalue 9999999999 minvalue 1;
	--

	create or replace trigger T_BI_USLUGA
	before insert on USLUGA
	for each row
	begin
	 if :new.USL_ID is NULL then
	 SELECT SEQ_USLUGA.nextval INTO :new.USL_ID FROM dual;
	 end if;
	end;
	/
	
	CREATE INDEX IX_USL_RODZAJ 
	ON USLUGA (USL_RODZAJ)
	TABLESPACE STUDENT_INDEX NOLOGGING;	 

	CREATE INDEX IX_USL_CENA 
	ON USLUGA (USL_CENA)
	TABLESPACE STUDENT_INDEX NOLOGGING;


		insert into USLUGA (USL_RODZAJ, USL_CENA)
		values ('BAREK POKOJOWY',499);
		
		insert into USLUGA (USL_RODZAJ, USL_CENA)
		values ('PAKIET POWITALNY',39);

		column USL_ID HEADING 'ID' for 999999
		column USL_RODZAJ HEADING 'RODZAJ USLUGI' for A20
		column USL_CENA HEADING 'CENA' for 999999
		
		SELECT * from USLUGA;


create table RABAT
(
	RAB_ID 			number(3) 		NOT NULL,
	RAB_RODZAJ 		varchar2(15) 	NOT NULL,
	RAB_WYSOKOSC	number(6)
);

	alter table RABAT
	add constraint CSR_PK_RABAT
	primary key (RAB_ID);

	drop sequence SEQ_RABAT;
	--
	create sequence SEQ_RABAT increment by 1 start with 1
	maxvalue 9999999999 minvalue 1;
	--

	create or replace trigger T_BI_RABAT
	before insert on RABAT
	for each row
	begin
	 if :new.RAB_ID is NULL then
	 SELECT SEQ_RABAT.nextval INTO :new.RAB_ID FROM dual;
	 end if;
	end;
	/

		insert into RABAT (RAB_RODZAJ, RAB_WYSOKOSC)
		values ('STUDENT',20);
		
		insert into RABAT (RAB_RODZAJ, RAB_WYSOKOSC)
		values ('SENIOR',40);

		column RAB_ID HEADING 'ID' for 999999
		column RAB_RODZAJ HEADING 'RODZAJ RABATU' for A20
		column RAB_WYSOKOSC HEADING 'WYSOKOSC W PROCENTACH' for 999999
		
		SELECT * from RABAT;

		
create table PRACOWNIK
(
	PRA_ID 			number(3) 		NOT NULL,
	PRA_IMIE 		varchar2(15) 	NOT NULL,
	PRA_NAZWISKO	varchar2(15)	NOT NULL
); 

	alter table PRACOWNIK
	add constraint CSR_PK_PRACOWNIK
	primary key (PRA_ID);

	drop sequence SEQ_PRACOWNIK;
	--
	create sequence SEQ_PRACOWNIK increment by 1 start with 1
	maxvalue 9999999999 minvalue 1;
	--

	create or replace trigger T_BI_PRACOWNIK
	before insert on PRACOWNIK
	for each row
	begin
	 if :new.PRA_ID is NULL then
	 SELECT SEQ_PRACOWNIK.nextval INTO :new.PRA_ID FROM dual;
	 end if;
	end;
	/
	
	CREATE INDEX IX_PRA_IMIE 
	ON PRACOWNIK (PRA_IMIE)
	TABLESPACE STUDENT_INDEX NOLOGGING;	 

	CREATE INDEX IX_PRA_NAZWISKO 
	ON PRACOWNIK (PRA_NAZWISKO)
	TABLESPACE STUDENT_INDEX NOLOGGING;

		insert into PRACOWNIK (PRA_IMIE, PRA_NAZWISKO)
		values ('ADRIANNA','ALCZUK');
		
		insert into PRACOWNIK (PRA_IMIE, PRA_NAZWISKO)
		values ('BARBARA','BAK');
		
		insert into PRACOWNIK (PRA_IMIE, PRA_NAZWISKO)
		values ('CECYLIA','CALKA');
		
		insert into PRACOWNIK (PRA_IMIE, PRA_NAZWISKO)
		values ('DANUTA','DOBROWOLSKA');

		column PRA_ID HEADING 'ID' for 999999
		column PRA_IMIE HEADING 'IMIE' for A20
		column PRA_NAZWISKO HEADING 'NAZWISKO' for A20
		
		SELECT * from PRACOWNIK;

create table APARTAMENT_INFO
(
	AIN_ID 				number(3)	NOT NULL,
	AIN_ILOSC_MIEJSC 	number(2) 	NOT NULL,
	AIN_CENA			number(6)	,
	AIN_OPIS			varchar2(100)
); 

	alter table APARTAMENT_INFO
	add constraint CSR_PK_APARTAMENT_INFO
	primary key (AIN_ID);

	drop sequence SEQ_APARTAMENT_INFO;
	--
	create sequence SEQ_APARTAMENT_INFO increment by 1 start with 1
	maxvalue 9999999999 minvalue 1;
	--

	create or replace trigger T_BI_APARTAMENT_INFO
	before insert on APARTAMENT_INFO
	for each row
	begin
	 if :new.AIN_ID is NULL then
	 SELECT SEQ_APARTAMENT_INFO.nextval INTO :new.AIN_ID FROM dual;
	 end if;
	end;
	/
	
		insert into APARTAMENT_INFO (AIN_ILOSC_MIEJSC, AIN_CENA, AIN_OPIS)
		values (2,499,'APARTAMENT Z LOZKIEM 2-OSOBOWYM, Z WIDOKIEM NA TATRY');

		insert into APARTAMENT_INFO (AIN_ILOSC_MIEJSC, AIN_CENA, AIN_OPIS)
		values (1,399,'APARTAMENT Z LOZKIEM 1-OSOBOWYM, Z BALKONEM Z WIDOKIEM NA TATRY');
		
		insert into APARTAMENT_INFO (AIN_ILOSC_MIEJSC, AIN_CENA, AIN_OPIS)
		values (4,899,'APARTAMENT Z 2 LOZKAMI 2-OSOBOWYM, Z BALKONEM');
		
		insert into APARTAMENT_INFO (AIN_ILOSC_MIEJSC, AIN_CENA, AIN_OPIS)
		values (4,1099,'APARTAMENT Z 4 LOZKAMI 1-OSOBOWYMI, Z BALKONEM Z WIDOKIEM NA TATRY');
		
		column AIN_ID HEADING 'ID' for 999999
		column AIN_ILOSC_MIEJSC HEADING 'ILOSC MIEJSC' for 999999
		column AIN_CENA HEADING 'CENA' for 999999
		column AIN_OPIS HEADING 'OPIS' for A20
		
		SELECT * from APARTAMENT_INFO;

		
create table GOSC
(
	GOS_ID 			number(3) 		NOT NULL,
	GOS_IMIE 		varchar2(15) 	NOT NULL,
	GOS_NAZWISKO	varchar2(15) 	NOT NULL,
	GOS_PESEL		varchar2(11) 	NOT NULL,
	GOS_TELEFON		varchar2(12) 	,
	GOS_EMAIL		varchar2(20) 	,
	MIE_NUMER		varchar2(3) 	NOT NULL
); 

	alter table GOSC
	add constraint CSR_PK_GOSC
	primary key (GOS_ID);

	alter table GOSC
	add constraint CSR_FK_GOSC
	foreign key (MIE_NUMER)
	references MIEJSCE_PARKINGOWE (MIE_NUMER)

	drop sequence SEQ_GOSC;
	--
	create sequence SEQ_GOSC increment by 1 start with 1
	maxvalue 9999999999 minvalue 1;
	--

	create or replace trigger T_BI_GOSC
	before insert on GOSC
	for each row
	begin
	 if :new.GOS_ID is NULL then
	 SELECT SEQ_GOSC.nextval INTO :new.GOS_ID FROM dual;
	 end if;
	end;
	/
	
		insert into GOSC (GOS_IMIE, GOS_NAZWISKO, GOS_PESEL, GOS_TELEFON, GOS_EMAIL, MIE_NUMER)
		values ('ADAM','ADAMCZYK','87060510798','664666876','aadmczyk@gmail.com','11');

		insert into GOSC (GOS_IMIE, GOS_NAZWISKO, GOS_PESEL, GOS_TELEFON, GOS_EMAIL, MIE_NUMER)
		values ('BARTOSZ','BARAN','49110112788','507854993','bart.baran@gmail.com','21');
		
		column GOS_ID HEADING 'ID' for 999999
		column GOS_IMIE HEADING 'IMIE' for A20
		column GOS_NAZWISKO HEADING 'NAZWISKO' for A20
		column GOS_PESEL HEADING 'PESEL' for A20
		column GOS_TELEFON HEADING 'NR. TELEFONU' for A20
		column GOS_EMAIL HEADING 'EMAIL' for A20
		column MIE_NUMER HEADING 'NR. M. PARKINGOWEGO' for A20
		
		SELECT * from GOSC;

		
create table WYKUPIONA_USLUGA
(
	WYK_ID 			number(3) 		NOT NULL,
	WYK_DATA 		date	 		NOT NULL,
	USL_RODZAJ		varchar2(20) 	NOT NULL
); 

	alter table WYKUPIONA_USLUGA
	add constraint CSR_PK_WYKUPIONA_USLUGA
	primary key (WYK_ID);

	alter table WYKUPIONA_USLUGA
	add constraint CSR_FK_WYKUPIONA_USLUGA
	foreign key (USL_RODZAJ)
	references USLUGA (USL_RODZAJ)

	drop sequence SEQ_WYKUPIONA_USLUGA;
	--
	create sequence SEQ_WYKUPIONA_USLUGA increment by 1 start with 1
	maxvalue 9999999999 minvalue 1;
	--

	create or replace trigger T_BI_WYKUPIONA_USLUGA
	before insert on WYKUPIONA_USLUGA
	for each row
	begin
	 if :new.WYK_ID is NULL then
	 SELECT SEQ_WYKUPIONA_USLUGA.nextval INTO :new.WYK_ID FROM dual;
	 end if;
	end;
	/
	
		insert into WYKUPIONA_USLUGA (WYK_DATA, USL_RODZAJ)
		values (TO_DATE('2021/11/28', 'yyyy/mm/dd'),'PAKIET POWITALNY');

		insert into WYKUPIONA_USLUGA (WYK_DATA, USL_RODZAJ)
		values (TO_DATE('2021/11/29', 'yyyy/mm/dd'),'PAKIET POWITALNY');
		
		column WYK_ID HEADING 'ID' for 999999
		column WYK_DATA HEADING 'DATA' for A11
		column USL_RODZAJ HEADING 'RODZAJ USLUGI' for A20
		
		SELECT * from WYKUPIONA_USLUGA;

		
create table WPLATA
(
	WPL_ID 			number(3) 		NOT NULL,
	WPL_KWOTA 		number(6)	 	NOT NULL,
	WPL_DATA		date		 	NOT NULL,
	RAB_ID			number(3) 	
); 

	alter table WPLATA
	add constraint CSR_PK_WPLATA
	primary key (WPL_ID);

	alter table WPLATA
	add constraint CSR_FK_WPLATA
	foreign key (RAB_ID)
	references RABAT (RAB_ID)

	drop sequence SEQ_WPLATA;
	--
	create sequence SEQ_WPLATA increment by 1 start with 1
	maxvalue 9999999999 minvalue 1;
	--

	create or replace trigger T_BI_WPLATA
	before insert on WPLATA
	for each row
	begin
	 if :new.WPL_ID is NULL then
	 SELECT SEQ_WPLATA.nextval INTO :new.WPL_ID FROM dual;
	 end if;
	end;
	/
	
		insert into WPLATA (WPL_KWOTA, WPL_DATA)
		values (499,TO_DATE('2021/11/25', 'yyyy/mm/dd'));

		insert into WPLATA (WPL_KWOTA, WPL_DATA, RAB_ID)
		values (240,TO_DATE('2021/11/28', 'yyyy/mm/dd'),2);
		
		column WPL_ID HEADING 'ID' for 999999
		column WPL_KWOTA HEADING 'WPLACONA KWOTA' for 999999
		column WPL_DATA HEADING 'DATA WPLATY' for A11
		column RAB_ID HEADING 'ID RABATU' for 999999
		
		SELECT * from WPLATA;

create table OBIEKT
(
	OBI_ID 				number(3) 			NOT NULL,
	OBI_NAZWA 			varchar2(20)	 	NOT NULL,
	OBI_ILOSC_POKOI		number(3)	 		NOT NULL,
	PRA_ID				number(3)
); 

	alter table OBIEKT
	add constraint CSR_PK_OBIEKT
	primary key (OBI_ID);

	alter table OBIEKT
	add constraint CSR_QU_OBIEKT
	unique (OBI_NAZWA);

	alter table OBIEKT
	add constraint CSR_FK_OBIEKT
	foreign key (PRA_ID)
	references PRACOWNIK (PRA_ID)

	drop sequence SEQ_OBIEKT;
	--
	create sequence SEQ_OBIEKT increment by 1 start with 1
	maxvalue 9999999999 minvalue 1;
	--

	create or replace trigger T_BI_OBIEKT
	before insert on OBIEKT
	for each row
	begin
	 if :new.OBI_ID is NULL then
	 SELECT SEQ_OBIEKT.nextval INTO :new.OBI_ID FROM dual;
	 end if;
	end;
	/
	
		insert into OBIEKT (OBI_NAZWA, OBI_ILOSC_POKOI, PRA_ID)
		values ('HAWRAN',5,1);

		insert into OBIEKT (OBI_NAZWA, OBI_ILOSC_POKOI, PRA_ID)
		values ('MURAN',8,2);
		
		column OBI_ID HEADING 'ID' for 999999
		column OBI_NAZWA HEADING 'NAZWA OBIEKTU' for A20
		column OBI_ILOSC_POKOI HEADING 'ILOSC POKOI' for 999999
		column PRA_ID HEADING 'ID PRACOWNIKA' for 999999
		
		SELECT * from OBIEKT;

create table APARTAMENT
(
	APA_ID 					number(3)		NOT NULL,
	APA_NR_POKOJU 			number(3)	 	NOT NULL,
	AIN_ILOSC_MIEJSC		number(2)	 	NOT NULL,
	OBI_NAZWA				varchar2(20) 	NOT NULL
); 

	alter table APARTAMENT
	add constraint CSR_PK_APARTAMENT
	primary key (APA_ID);

	alter table APARTAMENT
	add constraint CSR_QU_APARTAMENT
	unique (APA_NR_POKOJU);

	alter table APARTAMENT
	add constraint CSR_FK_APARTAMENT
	foreign key (AIN_ILOSC_MIEJSC)
	references APARTAMENT_INFO (AIN_ILOSC_MIEJSC)

	alter table APARTAMENT
	add constraint CSR_FK_APARTAMENT2
	foreign key (OBI_NAZWA)
	references OBIEKT (OBI_NAZWA)

	drop sequence SEQ_APARTAMENT;
	--
	create sequence SEQ_APARTAMENT increment by 1 start with 1
	maxvalue 9999999999 minvalue 1;
	--

	create or replace trigger T_BI_APARTAMENT
	before insert on APARTAMENT
	for each row
	begin
	 if :new.APA_ID is NULL then
	 SELECT SEQ_APARTAMENT.nextval INTO :new.APA_ID FROM dual;
	 end if;
	end;
	/
	
		insert into APARTAMENT (APA_NR_POKOJU, AIN_ILOSC_MIEJSC, OBI_NAZWA)
		values (11,2,'HAWRAN');

		insert into APARTAMENT (APA_NR_POKOJU, AIN_ILOSC_MIEJSC, OBI_NAZWA)
		values (21,1,'MURAN');
		
		insert into APARTAMENT (APA_NR_POKOJU, AIN_ILOSC_MIEJSC, OBI_NAZWA)
		values (12,4,'HAWRAN');

		insert into APARTAMENT (APA_NR_POKOJU, AIN_ILOSC_MIEJSC, OBI_NAZWA)
		values (22,4,'MURAN');
		
		column APA_ID HEADING 'ID' for 999999
		column APA_NR_POKOJU HEADING 'NR. POKOJU' for 999999
		column AIN_ILOSC_MIEJSC HEADING 'ILOSC MIEJSC' for 999999
		column OBI_NAZWA HEADING 'NAZWA OBIEKTU' for A20
		
		SELECT * from APARTAMENT;

		
create table REZERWACJA
(
	REZ_ID 			number(3)		NOT NULL,
	REZ_DATA 		date	 		NOT NULL,
	WPL_KWOTA		number(6)	 	NOT NULL,
	GOS_NAZWISKO	varchar2(15) 	NOT NULL,
	GOS_PESEL		varchar2(11) 	NOT NULL,
	USL_RODZAJ		varchar2(20) 	NOT NULL,
	APA_NR_POKOJU	number(3)	 	NOT NULL
); 

	alter table REZERWACJA
	add constraint CSR_PK_REZERWACJA
	primary key (REZ_ID);

	alter table REZERWACJA
	add constraint CSR_FK_REZERWACJA
	foreign key (WPL_KWOTA)
	references WPLATA (WPL_KWOTA)

	alter table REZERWACJA
	add constraint CSR_FK_REZERWACJA2
	foreign key (GOS_NAZWISKO)
	references GOSC (GOS_NAZWISKO)

	alter table REZERWACJA
	add constraint CSR_FK_REZERWACJA3
	foreign key (GOS_PESEL)
	references GOSC (GOS_PESEL)

	alter table REZERWACJA
	add constraint CSR_FK_REZERWACJA4
	foreign key (USL_RODZAJ)
	references WYKUPIONA_USLUGA (USL_RODZAJ)

	alter table REZERWACJA
	add constraint CSR_FK_REZERWACJA5
	foreign key (APA_NR_POKOJU)
	references APARTAMENT (APA_NR_POKOJU)

	drop sequence SEQ_REZERWACJA;
	--
	create sequence SEQ_REZERWACJA increment by 1 start with 1
	maxvalue 9999999999 minvalue 1;
	--

	create or replace trigger T_BI_REZERWACJA
	before insert on REZERWACJA
	for each row
	begin
	 if :new.REZ_ID is NULL then
	 SELECT SEQ_REZERWACJA.nextval INTO :new.REZ_ID FROM dual;
	 end if;
	end;
	/
	
		insert into REZERWACJA (REZ_DATA, WPL_KWOTA, GOS_NAZWISKO, GOS_PESEL, USL_RODZAJ, APA_NR_POKOJU)
		values (TO_DATE('2021/11/28', 'yyyy/mm/dd'),499,'ADAMCZYK','87060510798','PAKIET POWITALNY',11);

		insert into REZERWACJA (REZ_DATA, WPL_KWOTA, GOS_NAZWISKO, GOS_PESEL, USL_RODZAJ, APA_NR_POKOJU)
		values (TO_DATE('2021/11/29', 'yyyy/mm/dd'),240,'BARAN','49110112788','PAKIET POWITALNY',21);
		
		column REZ_ID HEADING 'ID' for 999999
		column REZ_DATA HEADING 'DATA REZERWACJI' for A11
		column WPL_KWOTA HEADING 'WYSOKOSC WPLATY' for 999999
		column GOS_NAZWISKO HEADING 'NAZWISKO' for A20
		column GOS_PESEL HEADING 'PESEL' for A20
		column USL_RODZAJ HEADING 'RODZAJ USLUGI' for A20
		column APA_NR_POKOJU HEADING 'NR. POKOJU' for 999999
		
		SELECT * from REZERWACJA;


describe MIEJSCE_PARKINGOWE;
describe USLUGA;
describe RABAT;
describe PRACOWNIK;
describe APARTAMENT_INFO;
describe GOSC;
describe WYKUPIONA_USLUGA;
describe WPLATA;
describe OBIEKT;
describe APARTAMENT;
describe REZERWACJA;


PROMPT ---------------------------------------------;
PROMPT -- 1. Podstawy SQL DML - operatory, NVL--;
PROMPT ---------------------------------------------;


		column AIN_ID HEADING 'ID' for 999999
		column AIN_ILOSC_MIEJSC HEADING 'ILOSC MIEJSC' for 999999
		column AIN_CENA HEADING 'CENA' for 999999
		column AIN_OPIS HEADING 'OPIS' for A30 TRUNCATED
		
		column PRA_ID HEADING 'ID' for 999999
		column PRA_IMIE HEADING 'IMIE' for A20
		column PRA_NAZWISKO HEADING 'NAZWISKO' for A20
		
		column APA_ID HEADING 'ID' for 999999
		column APA_NR_POKOJU HEADING 'NR. POKOJU' for 999999
		column AIN_ILOSC_MIEJSC HEADING 'ILOSC MIEJSC' for 999999
		column OBI_NAZWA HEADING 'NAZWA OBIEKTU' for A20
		
	SELECT * from APARTAMENT_INFO;
		
	/*
		 ID ILOSC MIEJSC    CENA OPIS
	------- ------------ ------- ------------------------------
		  1            2     499 APARTAMENT Z LOZKIEM 2-OSOBOWY
		  2            1     399 APARTAMENT Z LOZKIEM 1-OSOBOWY
		  3            4     899 APARTAMENT Z 2 LOZKAMI 2-OSOBO
		  4            4    1099 APARTAMENT Z 4 LOZKAMI 1-OSOBO
	*/
	
	UPDATE APARTAMENT_INFO SET AIN_CENA = 399
		WHERE AIN_ILOSC_MIEJSC = 2;
		
		
	SELECT * FROM APARTAMENT_INFO;
			
	/*
		 ID ILOSC MIEJSC    CENA OPIS
	------- ------------ ------- ------------------------------
		  1            2     399 APARTAMENT Z LOZKIEM 2-OSOBOWY
		  2            1     399 APARTAMENT Z LOZKIEM 1-OSOBOWY
		  3            4     899 APARTAMENT Z 2 LOZKAMI 2-OSOBO
		  4            4    1099 APARTAMENT Z 4 LOZKAMI 1-OSOBO
	*/	
		
	SELECT AIN_ID, AIN_CENA, AIN_OPIS FROM APARTAMENT_INFO
		WHERE AIN_ILOSC_MIEJSC = 4;
	/*
		 ID    CENA OPIS
	------- ------- ------------------------------
		  3     899 APARTAMENT Z 2 LOZKAMI 2-OSOBO
		  4    1099 APARTAMENT Z 4 LOZKAMI 1-OSOBO
	*/
	
	SELECT AIN_ID, AIN_ILOSC_MIEJSC, AIN_CENA, AIN_OPIS FROM APARTAMENT_INFO
		WHERE AIN_CENA <= 400;
	
	/*
		 ID ILOSC MIEJSC    CENA OPIS
	------- ------------ ------- ------------------------------
		  1            2     399 APARTAMENT Z LOZKIEM 2-OSOBOWY
		  2            1     399 APARTAMENT Z LOZKIEM 1-OSOBOWY
	*/
	
	SELECT PRA_ID, PRA_NAZWISKO FROM PRACOWNIK
		WHERE PRA_NAZWISKO NOT LIKE 'C%';
	
	/*
		 ID NAZWISKO
	------- --------------------
		  1 ALCZUK
		  2 BAK
		  4 DOBROWOLSKA
	*/
	
	SELECT APA_ID, APA_NR_POKOJU, AIN_ILOSC_MIEJSC FROM APARTAMENT
		WHERE OBI_NAZWA LIKE 'HAWRAN%';
	
	/*
		 ID NR. POKOJU ILOSC MIEJSC
	------- ---------- ------------
		  1         11            2
		  3         12            4
	*/
	
	
	UPDATE APARTAMENT_INFO SET AIN_CENA = NULL
		WHERE AIN_ILOSC_MIEJSC = 4;
	
	SELECT AIN_ID, AIN_ILOSC_MIEJSC, NVL(TO_CHAR(AIN_CENA), 'NIE DOSTEPNY') "CENA" FROM APARTAMENT_INFO;
	
	/*
	     ID ILOSC MIEJSC CENA
	------- ------------ ----------------------------------------
		  1            2 399
		  2            1 399
		  3            4 NIE DOSTEPNY
		  4            4 NIE DOSTEPNY
	*/
	
	insert into RABAT (RAB_RODZAJ, RAB_WYSOKOSC)
		values ('STALY KLIENT', NULL);
		
	insert into RABAT (RAB_RODZAJ, RAB_WYSOKOSC)
		values ('EARLY BIRD', NULL);
		
	insert into RABAT (RAB_RODZAJ, RAB_WYSOKOSC)
		values ('LAST MINUTE', NULL);
		
	SELECT RAB_ID, RAB_RODZAJ, NVL(TO_CHAR(RAB_WYSOKOSC), 'NIE OBOWIAZUJE') "WYSOKOSC W PROCENTACH" FROM RABAT;
	
	/*
	ID RABATU RODZAJ RABATU        WYSOKOSC W PROCENTACH
	--------- -------------------- ----------------------------------------
			1 STUDENT              20
			2 SENIOR               40
			3 STALY KLIENT         NIE OBOWIAZUJE
			4 EARLY BIRD           NIE OBOWIAZUJE
			5 LAST MINUTE          NIE OBOWIAZUJE
	*/
	
	SELECT RAB_ID, RAB_RODZAJ, NVL(TO_CHAR(RAB_WYSOKOSC), 'NIE OBOWIAZUJE') "WYSOKOSC W PROCENTACH" FROM RABAT
		WHERE RAB_WYSOKOSC <= 20 OR RAB_WYSOKOSC IS NULL;
		
	/*
	ID RABATU RODZAJ RABATU        WYSOKOSC W PROCENTACH
	--------- -------------------- ----------------------------------------
			1 STUDENT              20
			3 STALY KLIENT         NIE OBOWIAZUJE
			4 EARLY BIRD           NIE OBOWIAZUJE
			5 LAST MINUTE          NIE OBOWIAZUJE
	*/
	
	insert into WPLATA (WPL_KWOTA, WPL_DATA)
		values (240,TO_DATE('2021/11/30', 'yyyy/mm/dd'));
		
	SELECT WPL_ID, WPL_KWOTA, WPL_DATA, NVL(TO_CHAR(RAB_ID), '---') "ID RABATU" FROM WPLATA;
	
	/*
	     ID WYSOKOSC WPLATY DATA WPLATY ID RABATU
	------- --------------- ----------- ----------------------------------------
		  1             499 2021.11.25  ---
		  2             240 2021.11.28  2
		  3             240 2021.11.30  ---
	*/
	
	insert into WPLATA (WPL_KWOTA, WPL_DATA, RAB_ID)
		values (600,TO_DATE('2021/12/01', 'yyyy/mm/dd'),4);
	
	SELECT w.WPL_ID, w.WPL_KWOTA, w.WPL_DATA, NVL(r.RAB_WYSOKOSC, 5)  "WYSOKOSC W PROCENTACH", r.RAB_RODZAJ FROM WPLATA w, RABAT r
		WHERE w.RAB_ID = r.RAB_ID;
	
	/*
	     ID WYSOKOSC WPLATY DATA WPLATY WYSOKOSC W PROCENTACH RODZAJ RABATU
	------- --------------- ----------- --------------------- --------------------
		  2             240 2021.11.28                     40 SENIOR
		  4             600 2021.12.01                      5 EARLY BIRD
	*/
	
	insert into WPLATA (WPL_KWOTA, WPL_DATA, RAB_ID)
		values (540,TO_DATE('2021/12/01', 'yyyy/mm/dd'),2);
		
	insert into WPLATA (WPL_KWOTA, WPL_DATA, RAB_ID)
		values (450,TO_DATE('2021/12/03', 'yyyy/mm/dd'),3);
		
	insert into WPLATA (WPL_KWOTA, WPL_DATA, RAB_ID)
		values (899,TO_DATE('2021/12/06', 'yyyy/mm/dd'),1);
	
	COLUMN WPL_ID HEADING 'ID WPLATY';
	
	SELECT w.WPL_ID, w.WPL_KWOTA, w.WPL_DATA, NVL(r.RAB_WYSOKOSC, 5)  "WYSOKOSC W PROCENTACH", r.RAB_RODZAJ FROM WPLATA w, RABAT r
		WHERE w.RAB_ID = r.RAB_ID
		AND w.WPL_KWOTA >= 300;
	
	/*
	ID WPLATY WYSOKOSC WPLATY DATA WPLATY WYSOKOSC W PROCENTACH RODZAJ RABATU
	--------- --------------- ----------- --------------------- --------------------
			4             600 2021.12.01                      5 EARLY BIRD
			5             540 2021.12.01                     40 SENIOR
			6             450 2021.12.03                      5 STALY KLIENT
			7             899 2021.12.06                     20 STUDENT
	*/
	
	SELECT o.OBI_NAZWA, o.OBI_ILOSC_POKOI, p.PRA_NAZWISKO FROM OBIEKT o, PRACOWNIK p
		WHERE o.PRA_ID = p.PRA_ID
		AND o.OBI_ILOSC_POKOI > 5;
		
	/*
	NAZWA OBIEKTU        ILOSC POKOI NAZWISKO
	-------------------- ----------- --------------------
	MURAN                          8 BAK
	*/
	
	ALTER TABLE  APARTAMENT ADD
		APA_RODZAJ VARCHAR2(10) ;
		
	UPDATE APARTAMENT SET APA_RODZAJ = 'RODZINNY'
		WHERE AIN_ILOSC_MIEJSC >= 4;
	
	UPDATE APARTAMENT SET APA_RODZAJ = 'BIZNES'
		WHERE AIN_ILOSC_MIEJSC < 4;
		
	COLUMN APA_RODZAJ HEADING 'RODZAJ';
	
	SELECT APA_RODZAJ FROM APARTAMENT GROUP BY APA_RODZAJ;
	
	/*
	RODZAJ
	----------
	RODZINNY
	BIZNES
	*/
	
	SELECT RAB_RODZAJ FROM RABAT GROUP BY RAB_RODZAJ;
	/*
	RAB_RODZAJ
	---------------
	EARLY BIRD
	STUDENT
	STALY KLIENT
	LAST MINUTE
	SENIOR
	*/
	
	SELECT OBI_NAZWA FROM APARTAMENT GROUP BY OBI_NAZWA;
	/*
	OBI_NAZWA
	--------------------
	MURAN
	HAWRAN	
	*/
	
	-- VIEWS --
	
	insert into OBIEKT (OBI_NAZWA, OBI_ILOSC_POKOI, PRA_ID)
		values ('RYSY',2,1);
	
	CREATE OR REPLACE VIEW V_OBIEKTU 
	AS
	SELECT p.PRA_ID "ID PRACOWNIKA", p.PRA_NAZWISKO, o.OBI_NAZWA, TAB_POK.KOL_POK "SREDNIO POKOI" FROM OBIEKT o, PRACOWNIK p, (SELECT AVG(OBI_ILOSC_POKOI) KOL_POK FROM OBIEKT) TAB_POK
		WHERE o.PRA_ID = p.PRA_ID; 
	
	SELECT * FROM OBIEKT ORDER BY PRA_ID;
	
	SELECT * FROM V_OBIEKTU;
	
	/*
	ID PRACOWNIKA NAZWISKO             NAZWA OBIEKTU        SREDNIO POKOI
	------------- -------------------- -------------------- -------------
				1 ALCZUK               HAWRAN                           5
				2 BAK                  MURAN                            5
				1 ALCZUK               RYSY                             5
	*/
	
	
	CREATE OR REPLACE VIEW V_WPLATY
	AS
	SELECT w.WPL_ID, w.WPL_KWOTA, TAB_SR.KOL_SR SREDNIA, w.WPL_DATA,  NVL(r.RAB_WYSOKOSC, 5)  "WYSOKOSC W PROCENTACH" FROM WPLATA w, RABAT r, (SELECT AVG(WPL_KWOTA) KOL_SR FROM WPLATA WHERE WPL_KWOTA >= 300) TAB_SR
		WHERE w.RAB_ID = r.RAB_ID
		AND w.WPL_KWOTA >= 300;
		
	SELECT * FROM WPLATA ORDER BY WPL_KWOTA;
		
	SELECT * FROM V_WPLATY
		ORDER BY WPL_KWOTA;
	/*
	ID WPLATY WYSOKOSC WPLATY    SREDNIA DATA WPLATY WYSOKOSC W PROCENTACH
	--------- --------------- ---------- ----------- ---------------------
			6             450      597,6 2021.12.03                      5
			5             540      597,6 2021.12.01                     40
			4             600      597,6 2021.12.01                      5
			7             899      597,6 2021.12.06                     20
	*/
	
	
	------------------------------------------
	
	
	column INDEX_NAME HEADING 'NAME' for A32
	column INDEX_TYPE HEADING 'TYPE' for A10
	column TABLE_NAME HEADING 'TABLE' for A20
	column PF HEADING 'PCT_FREE' for 9999999
	column IE HEADING '1oEXTENT' for 9999999
	
	SELECT INDEX_NAME,INDEX_TYPE,TABLE_NAME,
			PCT_FREE||'[%]' PF,
			INITIAL_EXTENT/1024||'[kB]' IE 
	FROM USER_INDEXES;
	
	
	---------------------------	---------------------------
	----------- INDEX MONITORING	
	--------------------------- ---------------------------	
	
	/*
	NAME                             TYPE       TABLE                PCT_FREE                                    1oEXTENT
	-------------------------------- ---------- -------------------- ------------------------------------------- --------------------------------------------
	CSR_QU_USLUGA                    NORMAL     USLUGA               10[%]                                       64[kB]
	CSR_QU_OBIEKT                    NORMAL     OBIEKT               10[%]                                       64[kB]
	CSR_QU_MIEJSCE_PARKINGOWE        NORMAL     MIEJSCE_PARKINGOWE   10[%]                                       64[kB]
	CSR_QU_APARTAMENT                NORMAL     APARTAMENT           10[%]                                       64[kB]
	CSR_PK_WYKUPIONA_USLUGA          NORMAL     WYKUPIONA_USLUGA     10[%]                                       64[kB]
	CSR_PK_WPLATA                    NORMAL     WPLATA               10[%]                                       64[kB]
	CSR_PK_USLUGA                    NORMAL     USLUGA               10[%]                                       64[kB]
	CSR_PK_REZERWACJA                NORMAL     REZERWACJA           10[%]                                       64[kB]
	CSR_PK_RABAT                     NORMAL     RABAT                10[%]                                       64[kB]
	CSR_PK_PRACOWNIK                 NORMAL     PRACOWNIK            10[%]                                       64[kB]
	CSR_PK_OBIEKT                    NORMAL     OBIEKT               10[%]                                       64[kB]
	CSR_PK_MIEJSCE_PARKINGOWE        NORMAL     MIEJSCE_PARKINGOWE   10[%]                                       64[kB]
	CSR_PK_GOSC                      NORMAL     GOSC                 10[%]                                       64[kB]
	CSR_PK_APARTAMENT_INFO           NORMAL     APARTAMENT_INFO      10[%]                                       64[kB]
	CSR_PK_APARTAMENT                NORMAL     APARTAMENT           10[%]                                       64[kB]
	IX_USL_CENA                      NORMAL     USLUGA               10[%]                                       64[kB]
	IX_PRA_NAZWISKO                  NORMAL     PRACOWNIK            10[%]                                       64[kB]
	IX_PRA_IMIE                      NORMAL     PRACOWNIK            10[%]                                       64[kB]
	*/
	
PROMPT ;

	Commit;

	select count(PRA_ID) from PRACOWNIK;

	/*
	COUNT(PRA_ID)
	-------------
				4
	*/
	
	select ROWID, PRA_ID, PRA_IMIE, PRA_NAZWISKO
		from PRACOWNIK;
	
	insert into PRACOWNIK (PRA_IMIE, PRA_NAZWISKO)
		values ('EDWARD','EDAMSKI');
		
	insert into PRACOWNIK (PRA_IMIE, PRA_NAZWISKO)
		values ('FRANCISZEK','FALAFEL');
		
	update PRACOWNIK set PRA_NAZWISKO = 'BAK-BACZYNSKA' where PRA_NAZWISKO = 'BAK';
	
	select ROWID, PRA_ID, PRA_IMIE, PRA_NAZWISKO
		from PRACOWNIK;
		
	/*
	ROWID                   ID IMIE                 NAZWISKO
	------------------ ------- -------------------- --------------------
	AALro/AAcAAAComAAA       1 ADRIANNA             ALCZUK
	AALro/AAcAAAComAAB       2 BARBARA              BAK-BACZYNSKA
	AALro/AAcAAAComAAC       3 CECYLIA              CALKA
	AALro/AAcAAAComAAD       4 DANUTA               DOBROWOLSKA
	AALro/AAcAAAComAAE       5 EDWARD               EDAMSKI
	AALro/AAcAAAComAAF       6 FRANCISZEK           FALAFEL
	*/
	
	SAVEPOINT TRS_GWIDON;
	
	insert into PRACOWNIK (PRA_IMIE, PRA_NAZWISKO)
		values ('GWIDON','GRULA');
	
	select ROWID, PRA_ID, PRA_IMIE, PRA_NAZWISKO
		from PRACOWNIK;
	
	/*
	ROWID                   ID IMIE                 NAZWISKO
	------------------ ------- -------------------- --------------------
	AALrwdAAcAAAComAAA       1 ADRIANNA             ALCZUK
	AALrwdAAcAAAComAAB       2 BARBARA              BAK-BACZYNSKA
	AALrwdAAcAAAComAAC       3 CECYLIA              CALKA
	AALrwdAAcAAAComAAD       4 DANUTA               DOBROWOLSKA
	AALrwdAAcAAAComAAE       5 EDWARD               EDAMSKI
	AALrwdAAcAAAComAAF       6 FRANCISZEK           FALAFEL
	AALrwdAAcAAAComAAG       7 GWIDON               GRULA
	*/
	
	ROLLBACK TO SAVEPOINT TRS_GWIDON;
	
	DELETE FROM PRACOWNIK WHERE PRA_ID <= 2;
	
	select ROWID, PRA_ID, PRA_IMIE, PRA_NAZWISKO
		from PRACOWNIK;
		
	/*
	ROWID                   ID IMIE                 NAZWISKO
	------------------ ------- -------------------- --------------------
	AALr6/ABMAAADY+AAC       3 CECYLIA              CALKA
	AALr6/ABMAAADY+AAD       4 DANUTA               DOBROWOLSKA
	AALr6/ABMAAADY+AAE       5 EDWARD               EDAMSKI
	AALr6/ABMAAADY+AAF       6 FRANCISZEK           FALAFEL
	*/
	
	ROLLBACK;
	
	select ROWID, PRA_ID, PRA_IMIE, PRA_NAZWISKO
		from PRACOWNIK;
		
	/*
	ROWID                   ID IMIE                 NAZWISKO
	------------------ ------- -------------------- --------------------
	AALry1AAcAAAComAAA       1 ADRIANNA             ALCZUK
	AALry1AAcAAAComAAB       2 BARBARA              BAK
	AALry1AAcAAAComAAC       3 CECYLIA              CALKA
	AALry1AAcAAAComAAD       4 DANUTA               DOBROWOLSKA
	*/	
	
	
	--########## LAB09 #########--
	
		column APA_ID HEADING 'ID' for 999999
		column APA_NR_POKOJU HEADING 'NR. POKOJU' for 999999
		column AIN_ILOSC_MIEJSC HEADING 'ILOSC MIEJSC' for 999999
		column OBI_NAZWA HEADING 'NAZWA OBIEKTU' for A20
		column APA_RODZAJ HEADING 'RODZAJ' for A20
	
	SELECT * FROM APARTAMENT;
	
	/*
	     ID NR. POKOJU ILOSC MIEJSC NAZWA OBIEKTU        RODZAJ
	------- ---------- ------------ -------------------- --------------------
		  1         11            2 HAWRAN               BIZNES
		  2         21            1 MURAN                BIZNES
		  3         12            4 HAWRAN               RODZINNY
		  4         22            4 MURAN                RODZINNY
	*/
	
	
	CREATE OR REPLACE PROCEDURE pINSERT_APARTAMENT_FOR( 
							inAPA_RODZAJ IN APARTAMENT.APA_RODZAJ%TYPE,
							inMnoznik IN number,
							ile IN number)
	IS
		mnoznik number;
		nazwa varchar2(20);
	BEGIN
		IF inMnoznik = 1 THEN 
			nazwa := 'HAWRAN';
			mnoznik := 1;
		ELSIF inMnoznik = 2 THEN 
			nazwa := 'MURAN';
			mnoznik := 2;
		ELSE 
			nazwa := 'niepoprawna';
			mnoznik := 0;
		END IF;
		--
		for licznikPETLI IN 1 .. ile
		loop
			insert into APARTAMENT(APA_NR_POKOJU,AIN_ILOSC_MIEJSC,OBI_NAZWA,APA_RODZAJ) 
			values (2+licznikPETLI+mnoznik*10, licznikPETLI, nazwa, inAPA_RODZAJ);
		end loop;
	END;
	/
	
	EXEC pINSERT_APARTAMENT_FOR('RODZINNY',1,5);
	
	SELECT * FROM APARTAMENT;

	/*
	     ID NR. POKOJU ILOSC MIEJSC NAZWA OBIEKTU        RODZAJ
	------- ---------- ------------ -------------------- --------------------
		  1         11            2 HAWRAN               BIZNES
		  2         21            1 MURAN                BIZNES
		  3         12            4 HAWRAN               RODZINNY
		  4         22            4 MURAN                RODZINNY
		  5         13            1 HAWRAN               RODZINNY
		  6         14            2 HAWRAN               RODZINNY
		  7         15            3 HAWRAN               RODZINNY
		  8         16            4 HAWRAN               RODZINNY
		  9         17            5 HAWRAN               RODZINNY
	*/
	
	CREATE OR REPLACE FUNCTION fINSERT_APARTAMENT_FOR( 
							inAPA_RODZAJ IN APARTAMENT.APA_RODZAJ%TYPE,
							inMnoznik IN number,
							ile IN number)
	RETURN 	varchar2
	IS
		mnoznik number;
		nazwa varchar2(20);
		newAPA_ID APARTAMENT.APA_ID%TYPE;
	BEGIN
		IF inMnoznik = 1 THEN 
			nazwa := 'HAWRAN';
			mnoznik := 1;
		ELSIF inMnoznik = 2 THEN 
			nazwa := 'MURAN';
			mnoznik := 2;
		ELSE 
			nazwa := 'niepoprawna';
			mnoznik := 0;
		END IF;
		--
		for licznikPETLI IN 1 .. ile
		loop
			insert into APARTAMENT(APA_NR_POKOJU,AIN_ILOSC_MIEJSC,OBI_NAZWA,APA_RODZAJ) 
			values (2+licznikPETLI+mnoznik*10, licznikPETLI, nazwa, inAPA_RODZAJ);
			
			SELECT SEQ_APARTAMENT.CURRVAL INTO newAPA_ID FROM DUAL; 
		
			DBMS_OUTPUT.PUT_LINE('Dodano nowy wiersz do APARTAMENT ID='||newAPA_ID);
		end loop;
		
		RETURN 'Dodano '||ile||' wierszy';
	END;
	/
	
	BEGIN
		DBMS_OUTPUT.PUT_LINE(fINSERT_APARTAMENT_FOR('BIZNES',2,4));
	END;
	/
	
	SELECT * FROM APARTAMENT;
	
	/*
	     ID NR. POKOJU ILOSC MIEJSC NAZWA OBIEKTU        RODZAJ
	------- ---------- ------------ -------------------- --------------------
		  1         11            2 HAWRAN               BIZNES
		  2         21            1 MURAN                BIZNES
		  3         12            4 HAWRAN               RODZINNY
		  4         22            4 MURAN                RODZINNY
		  5         13            1 HAWRAN               RODZINNY
		  6         14            2 HAWRAN               RODZINNY
		  7         15            3 HAWRAN               RODZINNY
		  8         16            4 HAWRAN               RODZINNY
		  9         17            5 HAWRAN               RODZINNY
		 10         23            1 MURAN                BIZNES
		 11         24            2 MURAN                BIZNES
		 12         25            3 MURAN                BIZNES
		 13         26            4 MURAN                BIZNES
	*/
	
	CREATE OR REPLACE VIEW V_WPLATY
	AS
	SELECT w.WPL_ID, w.WPL_KWOTA, w.WPL_DATA, r.RAB_ID, r.RAB_RODZAJ FROM WPLATA w, RABAT r
		WHERE w.RAB_ID = r.RAB_ID;
		
	SELECT * FROM V_WPLATY
		ORDER BY WPL_KWOTA;
	
	CREATE OR REPLACE PROCEDURE p_INSERT_WPL_RAB(
	inWPL_KWOTA IN WPLATA.WPL_KWOTA%TYPE,
	inWPL_DATA IN WPLATA.WPL_DATA%TYPE,
	inRAB_RODZAJ IN RABAT.RAB_RODZAJ%TYPE	
	)
	IS
		PRAGMA AUTONOMOUS_TRANSACTION; 
		--
		WPL_ID_curr	WPLATA.WPL_ID%TYPE;
		RAB_ID_curr RABAT.RAB_ID%TYPE;
	BEGIN
		-- kursor niejawny INSERT
		insert into RABAT (RAB_RODZAJ)
		values (inRAB_RODZAJ);
		--
			-- niebezpieczne jeśli na bazie pracuje wielu użytkowników:
			SELECT SEQ_RABAT.CURRVAL INTO RAB_ID_curr FROM DUAL;
			
		-- kursor niejawny INSERT
		insert into WPLATA (WPL_KWOTA,WPL_DATA,RAB_ID)
		values (inWPL_KWOTA,inWPL_DATA,RAB_ID_curr);
		--
			-- niebezpieczne jeśli na bazie pracuje wielu użytkowników:
			SELECT SEQ_WPLATA.CURRVAL INTO WPL_ID_curr FROM DUAL; 
		--
		--
		DBMS_OUTPUT.PUT_LINE('Dodano nowy wiersz RABAT - ID='||RAB_ID_curr);
		--
		DBMS_OUTPUT.PUT_LINE('Dodano nowy wiersz WPLATA - ID='||WPL_ID_curr);
		--
		-- prosta obsługa transakcji
		IF RAB_ID_curr > 0 and WPL_ID_curr > 0 THEN 
			COMMIT;
		ELSE 
			ROLLBACK;
		END IF;
		--
	END;
	/
	
	exec p_INSERT_WPL_RAB(500,TO_DATE('2021/11/30', 'yyyy/mm/dd'),'GRUPA');
	select * from V_WPLATY where RAB_RODZAJ = 'GRUPA';
	
	/*
	ID WPLATY WYSOKOSC WPLATY DATA WPLATY ID RABATU RODZAJ RABATU
	--------- --------------- ----------- --------- --------------------
			8             500 2021.11.30          6 GRUPA
	*/
	
	CREATE OR REPLACE PROCEDURE p_INSERT_WPL_RAB_RET(
	inWPL_KWOTA IN WPLATA.WPL_KWOTA%TYPE,
	inWPL_DATA IN WPLATA.WPL_DATA%TYPE,
	inRAB_RODZAJ IN RABAT.RAB_RODZAJ%TYPE	
	)
	IS
		PRAGMA AUTONOMOUS_TRANSACTION; 
		--
		WPL_ID_curr	WPLATA.WPL_ID%TYPE;
		RAB_ID_curr RABAT.RAB_ID%TYPE;
	BEGIN
		-- kursor niejawny INSERT
		insert into RABAT (RAB_RODZAJ)
		values (inRAB_RODZAJ)
		RETURNING RAB_ID 
		INTO RAB_ID_curr; 
		--
		if SQL%FOUND then 
			-- kursor niejawny INSERT
			insert into WPLATA (WPL_KWOTA,WPL_DATA,RAB_ID)
			values (inWPL_KWOTA,inWPL_DATA,RAB_ID_curr)
			RETURNING WPL_ID 
			INTO WPL_ID_curr;
			--
				if SQL%FOUND then
					DBMS_OUTPUT.PUT_LINE('Dodano nowy wiersz RABAT - ID='||RAB_ID_curr);
					--
					DBMS_OUTPUT.PUT_LINE('Dodano nowy wiersz WPLATA - ID='||WPL_ID_curr);
					--
					COMMIT;
				ELSE
					DBMS_OUTPUT.PUT_LINE('Procedura p_INSERT_WPL_RAB_RET - ERROR!');
					ROLLBACK;
				END IF;
			--		
		ELSE
			ROLLBACK;
		END IF;	
		--
	END;
	/
	
	exec p_INSERT_WPL_RAB_RET(800,TO_DATE('2021/11/30', 'yyyy/mm/dd'),'URODZINY');
	select * from V_WPLATY where RAB_RODZAJ = 'URODZINY';
	
	/*
	ID WPLATY WYSOKOSC WPLATY DATA WPLATY ID RABATU RODZAJ RABATU
	--------- --------------- ----------- --------- --------------------
			9             800 2021.11.30          7 URODZINY
	*/
	
	------------------------------------
	--##############LAB11#############--
	------------------------------------
	
	insert into APARTAMENT_INFO (AIN_ILOSC_MIEJSC,AIN_CENA)
		values (3,599);
	insert into APARTAMENT_INFO (AIN_ILOSC_MIEJSC,AIN_CENA)
		values (3,449);
			
	CREATE OR REPLACE PROCEDURE p_Set_AIN_OPIS(
							inAIN_ILOSC_MIEJSC IN APARTAMENT_INFO.AIN_ILOSC_MIEJSC%TYPE, 
							inAIN_OPIS IN APARTAMENT_INFO.AIN_OPIS%TYPE
	)
	IS
		PRAGMA AUTONOMOUS_TRANSACTION; 
		--
		CURSOR curAIN_ILOSC_MIEJSC(cAIN_ILOSC_MIEJS IN APARTAMENT_INFO.AIN_ILOSC_MIEJSC%TYPE)
		IS
		select * from APARTAMENT_INFO
			where AIN_ILOSC_MIEJSC = cAIN_ILOSC_MIEJS
		FOR UPDATE of AIN_OPIS; 
		--
		wiersz APARTAMENT_INFO%ROWTYPE;
		--
		ile number := 0;
		status number := 0;
	BEGIN
		--
		OPEN curAIN_ILOSC_MIEJSC(inAIN_ILOSC_MIEJSC);
		---
		LOOP 
		FETCH curAIN_ILOSC_MIEJSC INTO wiersz; 
			--
			-- warunek wyjścia z pętli
			EXIT WHEN curAIN_ILOSC_MIEJSC%NOTFOUND OR curAIN_ILOSC_MIEJSC%ROWCOUNT <1;
			--
			ile := ile + 1;
				IF wiersz.AIN_OPIS IS NULL THEN
				--
					IF inAIN_OPIS IS NOT NULL then	
						--
						-- kursor niejawny
						UPDATE APARTAMENT_INFO set AIN_OPIS = inAIN_OPIS
						WHERE CURRENT OF curAIN_ILOSC_MIEJSC;
						-- 
						-- check update
						if SQL%FOUND THEN 
							status := status + 1; 
						ELSE 
							status := 0; 
						END IF;
					END IF;
				--
				END IF;
			--	
		END LOOP;
		--
		CLOSE curAIN_ILOSC_MIEJSC;
		--
		-- prosta obsługa transakcji
		IF ile = status THEN
			DBMS_OUTPUT.PUT_LINE('p_Set_AIN_OPIS: COMMIT :) ');
			COMMIT;
		ELSE 
			DBMS_OUTPUT.PUT_LINE('p_Set_AIN_OPIS: ROLLBACK :( ');
			ROLLBACK;
		END IF;
	END;
	/

	exec p_Set_AIN_OPIS(3,'PRZYTULNY POKOJ DLA PARY Z DZIECKIEM');
	
	column AIN_ID HEADING 'ID' for 9999
	column AIN_ILOSC_MIEJSC HEADING 'ILOSC MIEJSC' for 9999
	column AIN_CENA HEADING 'CENA' for 9999
	column AIN_OPIS HEADING 'OPIS' for A120
	
	SELECT * FROM APARTAMENT_INFO;
	
	/*
	   ID ILOSC MIEJSC  CENA OPIS
	----- ------------ ----- ------------------------------------------------------------------
		1            2   399 APARTAMENT Z LOZKIEM 2-OSOBOWYM, Z WIDOKIEM NA TATRY
		2            1   399 APARTAMENT Z LOZKIEM 1-OSOBOWYM, Z BALKONEM Z WIDOKIEM NA TATRY
		3            4       APARTAMENT Z 2 LOZKAMI 2-OSOBOWYM, Z BALKONEM
		4            4       APARTAMENT Z 4 LOZKAMI 1-OSOBOWYMI, Z BALKONEM Z WIDOKIEM NA TATRY
		5            3   599 PRZYTULNY POKOJ DLA PARY Z DZIECKIEM
		6            3   449 PRZYTULNY POKOJ DLA PARY Z DZIECKIEM
	*/
	
	insert into USLUGA (USL_CENA,USL_RODZAJ)
		values (39,'WYZYWIENIE');
	insert into USLUGA (USL_CENA,USL_RODZAJ)
		values (59,'WYZYWIENIE');
	
	CREATE OR REPLACE PROCEDURE p_Set_USL_OPIS(
							inUSL_RODZAJ IN USLUGA.USL_RODZAJ%TYPE, 
							inUSL_OPIS IN USLUGA.USL_OPIS%TYPE
	)
	IS
		PRAGMA AUTONOMOUS_TRANSACTION; 
		--
		CURSOR curUSL_RODZAJ(cUSL_RODZAJ IN USLUGA.USL_RODZAJ%TYPE)
		IS
		select * from USLUGA
			where USL_RODZAJ = cUSL_RODZAJ
		FOR UPDATE of USL_OPIS; 
		--
		wiersz USLUGA%ROWTYPE;
		--
		ile number := 0;
		status number := 0;
	BEGIN
		--
		OPEN curUSL_RODZAJ(inUSL_RODZAJ);
		---
		LOOP 
		FETCH curUSL_RODZAJ INTO wiersz; 
			--
			-- warunek wyjścia z pętli
			EXIT WHEN curUSL_RODZAJ%NOTFOUND OR curUSL_RODZAJ%ROWCOUNT <1;
			--
			ile := ile + 1;
				IF wiersz.USL_OPIS IS NULL THEN
				--
					IF inUSL_OPIS IS NOT NULL then	
						--
						-- kursor niejawny
						UPDATE USLUGA set USL_OPIS = inUSL_OPIS
						WHERE CURRENT OF curUSL_RODZAJ;
						-- 
						-- check update
						if SQL%FOUND THEN 
							status := status + 1; 
						ELSE 
							status := 0; 
						END IF;
					END IF;
				--
				END IF;
			--	
		END LOOP;
		--
		CLOSE curUSL_RODZAJ;
		--
		-- prosta obsługa transakcji
		IF ile = status THEN
			DBMS_OUTPUT.PUT_LINE('p_Set_USL_OPIS: COMMIT :) ');
			COMMIT;
		ELSE 
			DBMS_OUTPUT.PUT_LINE('p_Set_USL_OPIS: ROLLBACK :( ');
			ROLLBACK;
		END IF;
	END;
	/
	
	exec p_Set_USL_OPIS('WYZYWIENIE','CODZIENNE WYZYWIENIE ZAWIERAJACE SNIADNIE, OBIAD I KOLACJE');
	
	column USL_ID HEADING 'ID' for 9999
	column USL_CENA HEADING 'CENA' for 9999
	column USL_RODZAJ HEADING 'RODZAJ USLUGI' for 9999
	column USL_OPIS HEADING 'OPIS' for A120
	
	SELECT * FROM USLUGA;
	
	/*
	   ID RODZAJ USLUGI         CENA OPIS
	----- -------------------- ----- ----------------------------------------------------------
		1 BAREK POKOJOWY         499
		2 PAKIET POWITALNY        39
		3 WYZYWIENIE              39 CODZIENNE WYZYWIENIE ZAWIERAJACE SNIADNIE, OBIAD I KOLACJE
		4 WYZYWIENIE              59 CODZIENNE WYZYWIENIE ZAWIERAJACE SNIADNIE, OBIAD I KOLACJE
	*/
	
commit work;