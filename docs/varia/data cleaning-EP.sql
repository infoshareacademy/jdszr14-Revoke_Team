select * from airlinewise_monthly_international_air_traffic_to_and_from_the_i amiattafti 
select * from countrywise_quarterly_international_air_traffic_to_and_from_the cqiattaft 
select * from citypairwise_quarterly_international cqi 


--YEAR columns changed from int to numeric
alter table airlinewise_monthly_international_air_traffic_to_and_from_the_i 
alter column "YEAR" type numeric using ("YEAR"::numeric)

alter table citypairwise_quarterly_international 
alter column "YEAR" type numeric using ("YEAR"::numeric)

alter table countrywise_quarterly_international_air_traffic_to_and_from_the  
alter column "YEAR" type numeric using ("YEAR"::numeric)



--delete commas in Freight columns, passengers
alter table citypairwise_quarterly_international 
alter column "FREIGHT FROM CITY2 TO CITY1" type int4

alter table countrywise_quarterly_international_air_traffic_to_and_from_the 
alter column "FREIGHT TO INDIA" type int4

alter table citypairwise_quarterly_international 
alter column "FREIGHT FROM CITY2 TO CITY1" type int4



--delete empty column
alter table citypairwise_quarterly_international 
drop column column9



--delete rows where 4x0
delete from airlinewise_monthly_international_air_traffic_to_and_from_the_i
WHERE "PASSENGERS TO INDIA"= 0 and "PASSENGERS FROM INDIA" = 0
and "FREIGHT TO INDIA" = 0 and "FREIGHT FROM INDIA" = 0
-- 158 deleted

delete from citypairwise_quarterly_international cqi 
WHERE "PASSENGERS FROM CITY1 TO CITY2" = 0 and "PASSENGERS FROM CITY2 TO CITY1" = 0
and "FREIGHT FROM CITY1 TO CITY2" = 0 and "FREIGHT FROM CITY2 TO CITY1"= 0
-- 186 deleted

delete from countrywise_quarterly_international_air_traffic_to_and_from_the 
WHERE "PASSENGERS TO INDIA" = 0 and "PASSENGERS FROM INDIA" = 0
and "FREIGHT TO INDIA" = 0 and "FREIGHT FROM INDIA" = 0
-- 35 deleted


