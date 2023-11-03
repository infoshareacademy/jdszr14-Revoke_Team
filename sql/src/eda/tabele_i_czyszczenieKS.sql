-- tworzenie tabel 

CREATE TABLE airline (
    "YEAR" integer,
    "MONTH" character varying(50),
    quarter character varying(50),
    "AIRLINE NAME" character varying(50),
    "CARRIER TYPE" character varying(50),
    "PASSENGERS TO INDIA" integer,
    "PASSENGERS FROM INDIA" integer,
    "FREIGHT TO INDIA" real,
    "FREIGHT FROM INDIA" real
);


CREATE TABLE citypair (
    "YEAR" integer,
    quarter character varying(50),
    city1 character varying(50),
    city2 character varying(50),
    "PASSENGERS FROM CITY1 TO CITY2" integer,
    "PASSENGERS FROM CITY2 TO CITY1" integer,
    "FREIGHT FROM CITY1 TO CITY2" real,
    "FREIGHT FROM CITY2 TO CITY1" real,
    column9 character varying(50)
);

CREATE TABLE country (
    "YEAR" integer,
    quarter character varying(50),
    "COUNTRY NAME" character varying(50),
    "PASSENGERS TO INDIA" integer,
    "PASSENGERS FROM INDIA" integer,
    "FREIGHT TO INDIA" real,
    "FREIGHT FROM INDIA" real
);
-- czyszczenie 

-- usunięcie pustej kolumny column9
ALTER TABLE citypair 
DROP COLUMN column9;

-- zmiana nazwy UNITED ARAB EMIRATES* na UNITED ARAB EMIRATES
update country c2 set "COUNTRY NAME" = 'UNITED ARAB EMIRATES' where "COUNTRY NAME" = 'UNITED ARAB EMIRATES*'