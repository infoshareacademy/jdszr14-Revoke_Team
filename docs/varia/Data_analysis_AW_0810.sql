select * from air_traffic at2 
select * from citypairwise c 
select * from countrywise c 

-- ilość (99) i nazwy linii lotniczych
select distinct airline_name from air_traffic at2 

-- jakie linie latają domestic?
select distinct airline_name from air_traffic at2 
where carrier_type = 'DOMESTIC' 
-- 5 linii lotniczych: Indigo, Air India, Jet Airways, Spicejet, Air India Express

--najpopularniejsza linia pasażerska
select airline_name, max(passengers_to_india + passengers_from_india) from air_traffic 
group by airline_name order by  max(passengers_to_india + passengers_from_india) desc
--jet airways

--najpopularniejsza linia towarowa
select airline_name, max(freight_to_india  + freight_from_india) from air_traffic 
group by airline_name order by  max(freight_to_india + freight_from_india) desc
--eithad airlines

-- najwięcej pasażerów do/z Indii; najwięcej towaru do/z Idnii z tabeli air_traffic
select 
max(passengers_to_india) as max_pass_to,
max(passengers_from_india) as max_pass_from,
max(freight_to_india) as max_freight_to,
max(freight_from_india) as max_freight_from
from air_traffic at2 
-- 402,497; 400,155; 14,916.471; 48,640.297;

-- najwięcej pasażerów/ładunku z tabeli citywise
select 
max(passengers_from_city1_to_city2) as max_pass_1to2,
max(passengers_from_city2_to_city1) as max_pass_2to1,
max(freight_from_city1_to_city2) as max_freight_1to2,
max(freight_from_city2_to_city1) as max_freight_2to1
from citypairwise 
-- 304,405; 323,206; 22,487.6; 48,904

-- najwięcej pasażerów/ładunku z tabeli countrywise
select
max(passengers_to_india) as max_pass_to,
max(passengers_from_india) as max_pass_from,
max(freight_to_india) as max_freight_to,
max(freight_from_india) as max_freight_from
from countrywise c 
--2,384,541; 2,480,816; 35,914.1; 108,131.4

-- najmniej pasażerów do/z Indii; najmniej towaru do/z Idnii
select 
min(passengers_to_india) as min_pass_to 
from air_traffic at2 
where passengers_to_india <> 0 
--10

select
min(passengers_from_india) as min_pass_from
from air_traffic at2 
where passengers_from_india <> 0
--19

select 
min(freight_to_india) as min_freight_to
from air_traffic at2 
where freight_to_india <> 0
--0.001

select 
min(freight_from_india) as min_freight_from
from air_traffic at2 
where freight_from_india <>0
--0.048

-- suma pasażerów do/z Indii
select
sum(passengers_to_india) as sum_pass_to,
sum(passengers_from_india) as sum_pass_from
from air_traffic at2 
--podobne wyniki, 57 i 59 mln

-- suma towaru do/z Indii
select
sum(freight_to_india) as sum_freight_to,
sum(freight_from_india) as sum_freight_from
from air_traffic at2 
-- o wiele więcej towaru wylatuje (1,3 vs 2 mln)

--z jakiego kraju przylatywało najwięcej ludzi
select country_name, max(passengers_to_india) 
from countrywise c 
group by country_name order by max(passengers_to_india)  desc 
--Zjednoczone Emiraty Arabskie

-- do jakiego kraju wylatywało najwięcej ludzi
select country_name, max(passengers_from_india) 
from countrywise c 
group by country_name order by max(passengers_from_india)  desc 
--Zjednoczone Emiraty Arabskie

-- z jakiego kraju przylatywało najwięcej towaru
select country_name, max(freight_to_india) 
from countrywise c 
group by country_name order by max(freight_to_india)  desc 
--Hong Kong

-- do jakiego kraju wylatywało najwięcej towaru
select country_name, max(freight_from_india) 
from countrywise c 
group by country_name order by max(freight_from_india)  desc 
--Zjednoczone Emiraty Arabskie

-- kraj i rok, kiedy było najwięcej pasażerów od Indii
select "YEAR" , country_name, max(passengers_to_india)
from countrywise c 
group by "YEAR", country_name order by max(passengers_to_india) desc
--2016, Zjednoczone Emiraty Arabskie

-- kraj i rok, kiedy było najwięcej pasażerów z Indii
select "YEAR" , country_name, max(passengers_from_india)
from countrywise c 
group by "YEAR", country_name order by max(passengers_from_india) desc
--2017, Zjednoczone Emiraty Arabskie

--z jakiego miasta najwięcej ludzi przylatywało?
select city1, max(passengers_from_city1_to_city2)
from citypairwise c 
group by city1 order by max(passengers_from_city1_to_city2) desc
--Dubai

--do jakiego miasta najwięcej ludzi przylatywało?
select city1, max(passengers_from_city2_to_city1)
from citypairwise c 
group by city1 order by max(passengers_from_city2_to_city1) desc
--Dubai

--z jakiego miasta najwięcej towaru przylatywało?
select city1, max(freight_from_city1_to_city2)
from citypairwise c 
group by city1 order by max(freight_from_city1_to_city2) desc
--Hong Kong

--do jakiego miasta najwięcej towaru przylatywało?
select city1, max(freight_from_city2_to_city1)
from citypairwise c 
group by city1 order by max(freight_from_city2_to_city1) desc
--Abudhabi