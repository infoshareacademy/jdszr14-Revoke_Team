select * from airline a 
select * from citypair c 
select * from country c2 


--ile przylecialo ile wyleciało, pasażerowie i cargo w podziale na lata (2017 tylko 1Q)
select "YEAR" ,sum("PASSENGERS TO INDIA") as "PASSENGERS TO INDIA" , sum("PASSENGERS FROM INDIA")as "PASSENGERS FROM INDIA" ,
sum("FREIGHT TO INDIA")as "FREIGHT TO INDIA" , sum("FREIGHT FROM INDIA")as "FREIGHT FROM INDIA"   
from airline a 
group by "YEAR"
order by "YEAR" 
-- YEAR|PASSENGERS TO INDIA|PASSENGERS FROM INDIA|FREIGHT TO INDIA|FREIGHT FROM INDIA|
----+-------------------+---------------------+----------------+---------------------+
--2015|           23781640|             24858956|      3768280018|           5167130769|
--2016|           26543689|             27122472|       570518700|            893202200|
--2017|            6778304|              7424671|       154621100|            238545900|
-- więcej ludzi i towarów wylatuje z Indii niż przylatuje
--z roku na rok coraz większy ruch 


--ile przylecialo ile wyleciało, pasażerowie i cargo w podziale na kwartały 
select "YEAR" , quarter ,sum("PASSENGERS TO INDIA") as "PASSENGERS TO INDIA" , sum("PASSENGERS FROM INDIA")as "PASSENGERS FROM INDIA" ,
sum("FREIGHT TO INDIA")as "FREIGHT TO INDIA" , sum("FREIGHT FROM INDIA")as "FREIGHTFROM INDIA"  
from airline a 
group by "YEAR", quarter 
order by "YEAR" , quarter 

--YEAR|quarter|PASSENGERS TO INDIA|PASSENGERS FROM INDIA|FREIGHT TO INDIA|FREIGHT FROM INDIA|
----+-------+-------------------+---------------------+----------------+---------------------+
--2015|Q1     |            5712230|              6376365|       127645585|            222898632|
--2015|Q2     |            5876964|              6276379|      1329790591|           1173208444|
--2015|Q3     |            5711102|              6064483|       992827955|           1693817001|
--2015|Q4     |            6481344|              6141729|      1318015887|           2077206692|
--2016|Q1     |            6343530|              6871288|       134226100|            215836300|
--2016|Q2     |            6521248|              6775745|       137174100|            231436600|
--2016|Q3     |            6515859|              6802518|       145634500|            219676100|
--2016|Q4     |            7163052|              6672921|       153484000|            226253200|
--2017|Q1     |            6778304|              7424671|       154621100|            238545900|
--w Q4 więcej pasażerów przylauje w Q1 więcej wylatuje może mieć to zwiącek ze świętami/Nowym Rokiem

--CZY SĄ "PUSTE LOTY"? tylko cargo?
select "YEAR",quarter , "AIRLINE NAME"  ,sum("PASSENGERS TO INDIA") as "PASSENGERS TO INDIA" , sum("PASSENGERS FROM INDIA")as "PASSENGERS FROM INDIA" ,
sum("FREIGHT TO INDIA")as "FREIGHT TO INDIA" , sum("FREIGHT FROM INDIA")as "FREIGHTFROM INDIA"  
from airline a 
where "PASSENGERS TO INDIA"=0 and "PASSENGERS FROM INDIA"=0
group by  "AIRLINE NAME", "YEAR", quarter 
order by "AIRLINE NAME" ,"YEAR", quarter 
--tylko ludzie?
select "YEAR",quarter , "AIRLINE NAME"  ,sum("PASSENGERS TO INDIA") as "PASSENGERS TO INDIA" , 
sum("PASSENGERS FROM INDIA")as "PASSENGERS FROM INDIA" ,
sum("FREIGHT TO INDIA")as "FREIGHT TO INDIA" , sum("FREIGHT FROM INDIA")as "FREIGHTFROM INDIA"  
from airline a 
where "FREIGHT TO INDIA"=0 and "FREIGHT FROM INDIA"=0 and "PASSENGERS TO INDIA" >0
group by  "AIRLINE NAME", "YEAR", quarter 
order by "AIRLINE NAME" ,"YEAR", quarter 
-- przeloty tylko pasażerowie kraje

select "YEAR",quarter , "COUNTRY NAME"  ,sum("PASSENGERS TO INDIA") as "PASSENGERS TO INDIA" ,
sum("PASSENGERS FROM INDIA")as "PASSENGERS FROM INDIA" ,
sum("FREIGHT TO INDIA")as "FREIGHT TO INDIA" , sum("FREIGHT FROM INDIA")as "FREIGHTFROM INDIA"  
from country c  
where "FREIGHT TO INDIA"=0 and "FREIGHT FROM INDIA"=0 and "PASSENGERS TO INDIA" >0
group by  "COUNTRY NAME" , "YEAR", quarter 
order by "COUNTRY NAME"  ,"YEAR", quarter  
--YEAR|quarter|COUNTRY NAME|PASSENGERS TO INDIA|PASSENGERS FROM INDIA|FREIGHT TO INDIA|FREIGHTFROM INDIA|
----+-------+------------+-------------------+---------------------+----------------+-----------------+
--2015|Q3     |IRAQ        |               2586|                 2226|             0.0|              0.0|
--2016|Q1     |IRAQ        |                993|                  986|             0.0|              0.0|
--2016|Q3     |IRAQ        |               1732|                 1742|             0.0|              0.0|
--2016|Q4     |IRAQ        |               1459|                 1625|             0.0|              0.0|
--2017|Q1     |AZERBAIJAN  |               8414|                 8600|             0.0|              0.0|
--2017|Q1     |IRAQ        |               1967|                 1999|             0.0|              0.0|

--tylko towar
select "YEAR",quarter , "COUNTRY NAME" ,sum("PASSENGERS TO INDIA") as "PASSENGERS TO INDIA" ,
sum("PASSENGERS FROM INDIA")as "PASSENGERS FROM INDIA" ,
sum("FREIGHT TO INDIA")as "FREIGHT TO INDIA" , sum("FREIGHT FROM INDIA")as "FREIGHTFROM INDIA"  
from country c 
where "PASSENGERS TO INDIA"=0 and "PASSENGERS FROM INDIA"=0
group by  "COUNTRY NAME" , "YEAR", quarter 
order by "COUNTRY NAME"  ,"YEAR", quarter 

--TOP 5 krajów z których przylatywało najwięcej ludzi w latach 
select "YEAR","COUNTRY NAME" , max("PASSENGERS TO INDIA")as "PASSENGERS TO INDIA" 
from country c2
where "YEAR" = 2017
group by "COUNTRY NAME", "YEAR" 
order by "PASSENGERS TO INDIA"  desc
limit 5

--YEAR|COUNTRY NAME        |PASSENGERS TO INDIA|
----+--------------------+-------------------+
--2017|UNITED ARAB EMIRATES|            2232638|
--2017|SINGAPORE           |             436300|
--2017|THAILAND            |             402740|
--2017|SAUDI ARABIA        |             388916|
--2017|OMAN                |             373984|
--
select "YEAR","COUNTRY NAME" , max("PASSENGERS TO INDIA")as "PASSENGERS TO INDIA" 
from country c2
where "YEAR" = 2016
group by "COUNTRY NAME", "YEAR" 
order by "PASSENGERS TO INDIA"  desc
limit 5
--YEAR|COUNTRY NAME        |PASSENGERS TO INDIA|
----+--------------------+-------------------+
--2016|UNITED ARAB EMIRATES|            2384541|
--2016|SINGAPORE           |             498117|
--2016|SAUDI ARABIA        |             435796|
--2016|QATAR               |             379866|
--2016|THAILAND            |             373640|

select "YEAR","COUNTRY NAME" , max("PASSENGERS TO INDIA")as "PASSENGERS TO INDIA" 
from country c2
where "YEAR" = 2015
group by "COUNTRY NAME", "YEAR" 
order by "PASSENGERS TO INDIA"  desc
limit 5
--YEAR|COUNTRY NAME        |PASSENGERS TO INDIA|
----+--------------------+-------------------+
--2015|UNITED ARAB EMIRATES|            2133864|
--2015|SINGAPORE           |             447714|
--2015|QATAR               |             425728|
--2015|SAUDI ARABIA        |             385801|
--2015|THAILAND            |             359590|

--TOP 5 krajów do których wylatywało najwięcej ludzi w latach 
select "YEAR","COUNTRY NAME" , max("PASSENGERS FROM INDIA")as "PASSENGERS FROM INDIA" 
from country c2
where "YEAR" = 2015
group by "COUNTRY NAME" ,"YEAR" 
order by "PASSENGERS FROM INDIA"  desc
limit 5
--YEAR|COUNTRY NAME        |PASSENGERS FROM INDIA|
----+--------------------+---------------------+
--2015|UNITED ARAB EMIRATES|              2115129|
--2015|SINGAPORE           |               449017| 
--2015|SAUDI ARABIA        |               434124|
--2015|QATAR               |               401387|
--2015|UNITED KINGDOM      |               358553|

select "YEAR","COUNTRY NAME" , max("PASSENGERS FROM INDIA")as "PASSENGERS FROM INDIA" 
from country c2
where "YEAR" = 2016
group by "COUNTRY NAME" ,"YEAR" 
order by "PASSENGERS FROM INDIA"  desc
limit 5
--YEAR|COUNTRY NAME        |PASSENGERS FROM INDIA|
----+--------------------+---------------------+
--2016|UNITED ARAB EMIRATES|              2338669|
--2016|SINGAPORE           |               481999|
--2016|SAUDI ARABIA        |               425966|
--2016|OMAN                |               390897|
--2016|THAILAND            |               381558|
select "YEAR","COUNTRY NAME" , max("PASSENGERS FROM INDIA")as "PASSENGERS FROM INDIA" 
from country c2
where "YEAR" = 2017
group by "COUNTRY NAME" ,"YEAR" 
order by "PASSENGERS FROM INDIA"  desc
limit 5
--YEAR|COUNTRY NAME        |PASSENGERS FROM INDIA|
----+--------------------+---------------------+
--2017|UNITED ARAB EMIRATES|              2480816|
--2017|SINGAPORE           |               495624|
--2017|SAUDI ARABIA        |               424112|
--2017|THAILAND            |               408134|
--2017|OMAN                |               401851|

-- TOP 5 krajów z krórych przylatywało najwięcej towaru w latach
select "YEAR","COUNTRY NAME", max("FREIGHT TO INDIA") as "FREIGHT TO INDIA"
from country c 
where "YEAR"= 2015
group by "COUNTRY NAME" ,"YEAR" 
order by  "FREIGHT TO INDIA"  desc 
limit 5
--YEAR|COUNTRY NAME        |FREIGHT TO INDIA|
----+--------------------+----------------+
--2015|HONG KONG           |        35914100|
--2015|UNITED ARAB EMIRATES|        24560500|
--2015|SINGAPORE           |        14574500|
--2015|QATAR               |        14247600|
--2015|GERMANY             |        12445500|
select "YEAR","COUNTRY NAME", max("FREIGHT TO INDIA") as "FREIGHT TO INDIA"
from country c 
where "YEAR"= 2016
group by "COUNTRY NAME" ,"YEAR" 
order by  "FREIGHT TO INDIA"  desc 
limit 5
--YEAR|COUNTRY NAME        |FREIGHT TO INDIA|
----+--------------------+----------------+
--2016|HONG KONG           |        27237000|
--2016|UNITED ARAB EMIRATES|        23254400|
--2016|QATAR               |        15084900|
--2016|SINGAPORE           |        14495000|
--2016|UNITED KINGDOM      |        13170200|
select "YEAR","COUNTRY NAME", max("FREIGHT TO INDIA") as "FREIGHT TO INDIA"
from country c 
where "YEAR"= 2017
group by "COUNTRY NAME" ,"YEAR" 
order by  "FREIGHT TO INDIA"  desc 
limit 5
--YEAR|COUNTRY NAME        |FREIGHT TO INDIA|
----+--------------------+----------------+
--2017|HONG KONG           |        24307300|
--2017|UNITED ARAB EMIRATES|        22876400|
--2017|QATAR               |        16166100|
--2017|SINGAPORE           |        13649900|
--2017|UNITED KINGDOM      |        13194900|

-- TOP 5 krajów do których wylatywało najwięcej towaru w latach 
select "YEAR","COUNTRY NAME", max("FREIGHT FROM INDIA") as "FREIGHT FROM INDIA"
from country c 
where "YEAR" = 2015
group by "COUNTRY NAME" ,"YEAR" 
order by  "FREIGHT FROM INDIA"  desc 
limit 5
--YEAR|COUNTRY NAME        |FREIGHT FROM INDIA|
----+--------------------+------------------+
--2015|UNITED ARAB EMIRATES|         108131400|
--2015|QATAR               |          25598200|
--2015|HONG KONG           |          22273000|
--2015|UNITED KINGDOM      |          18945000|
--2015|GERMANY             |          15999500|
select "YEAR","COUNTRY NAME", max("FREIGHT FROM INDIA") as "FREIGHT FROM INDIA"
from country c 
where "YEAR" = 2016
group by "COUNTRY NAME" ,"YEAR" 
order by  "FREIGHT FROM INDIA"  desc 
limit 5
--YEAR|COUNTRY NAME        |FREIGHT FROM INDIA|
----+--------------------+------------------+
--2016|UNITED ARAB EMIRATES|          69673904|
--2016|QATAR               |          25616200|
--2016|UNITED KINGDOM      |          20105600|
--2016|SINGAPORE           |          16530900|
--2016|GERMANY             |          16204900|
select "YEAR","COUNTRY NAME", max("FREIGHT FROM INDIA") as "FREIGHT FROM INDIA"
from country c 
where "YEAR" = 2017
group by "COUNTRY NAME" ,"YEAR" 
order by  "FREIGHT FROM INDIA"  desc 
limit 5
--YEAR|COUNTRY NAME        |FREIGHT FROM INDIA|
----+--------------------+------------------+
--2017|UNITED ARAB EMIRATES|          67074100|
--2017|QATAR               |          28409600|
--2017|UNITED KINGDOM      |          19492100|
--2017|SINGAPORE           |          16280800|
--2017|GERMANY             |          15330000|