select * from airlinewise_monthly_international_air_traffic_to_and_from_the_i amiattafti 
select * from countrywise_quarterly_international_air_traffic_to_and_from_the cqiattaft 
select * from citypairwise_quarterly_international cqi 

--the most popular airline - cargo in tonnes, Time Period: 2015Q1 - 2017Q1 (to India)
select "AIRLINE NAME", sum("FREIGHT TO INDIA") as total from airlinewise_monthly_international_air_traffic_to_and_from_the_i amiattafti
group by "AIRLINE NAME"
order by total desc

--|AIRLINE NAME      |total |
--|------------------|------|
--|CATHAY PACIFIC    |181452|
--|EMIRATES AIRLINE  |140920|
--|JET AIRWAYS       |116453|
--|AIR INDIA         |101275|
--|LUFTHANSA         |91529 |
--|SINGAPORE AIRLINES|85263 |
--|QATAR AIRWAYS     |83340 |
--|THAI AIRWAYS      |62197 |
--|BRITISH AIRWAYS   |36210 |
--|FEDERAL EXPRESS   |33390 |

--the most popular airline - cargo in tonnes, Time Period: 2015Q1 - 2017Q1 (from India)
select "AIRLINE NAME", sum("FREIGHT FROM INDIA") as total from airlinewise_monthly_international_air_traffic_to_and_from_the_i amiattafti
group by "AIRLINE NAME"
order by total desc

--|AIRLINE NAME      |total |
--|------------------|------|
--|EMIRATES AIRLINE  |347590|
--|JET AIRWAYS       |169028|
--|QATAR AIRWAYS     |147366|
--|AIR INDIA         |137342|
--|CATHAY PACIFIC    |116743|
--|ETIHAD AIRLINES   |107150|
--|LUFTHANSA         |88234 |
--|SINGAPORE AIRLINES|82580 |
--|SAUDIA            |67270 |
--|BRITISH AIRWAYS   |66789 |


--the most popular domestic airline - Time Period: 2015Q1 - 2017Q1
select "AIRLINE NAME", sum("FREIGHT TO INDIA" + "FREIGHT FROM INDIA") as total from airlinewise_monthly_international_air_traffic_to_and_from_the_i amiattafti
where "CARRIER TYPE" = 'DOMESTIC'
group by "AIRLINE NAME"
order by total desc

--|AIRLINE NAME     |total |
--|-----------------|------|
--|JET AIRWAYS      |285481|
--|AIR INDIA        |238617|
--|INDIGO           |30757 |
--|AIR INDIA EXPRESS|13245 |
--|SPICEJET         |11228 |


--the most popular foreign airline - Time Period: 2015Q1 - 2017Q1
select "AIRLINE NAME", sum("FREIGHT TO INDIA" + "FREIGHT FROM INDIA") as total from airlinewise_monthly_international_air_traffic_to_and_from_the_i amiattafti
where "CARRIER TYPE" = 'FOREIGN'
group by "AIRLINE NAME"
order by total desc

--|AIRLINE NAME      |total |
--|------------------|------|
--|EMIRATES AIRLINE  |488510|
--|CATHAY PACIFIC    |298195|
--|QATAR AIRWAYS     |230706|
--|LUFTHANSA         |179763|
--|SINGAPORE AIRLINES|167843|


--Summary of freight to India in 2015 and 2016 (increase)
(select sum("FREIGHT TO INDIA") as total from airlinewise_monthly_international_air_traffic_to_and_from_the_i amiattafti 
where "YEAR" = 2015)
union all
(select sum("FREIGHT TO INDIA") as total from airlinewise_monthly_international_air_traffic_to_and_from_the_i amiattafti 
where "YEAR" = 2016)

--|total |
--|------|
--|560725|
--|570521|

--Summary of freight from India in 2015 and 2016 (increase)
(select sum("FREIGHT FROM INDIA") as total from airlinewise_monthly_international_air_traffic_to_and_from_the_i amiattafti 
where "YEAR" = 2015)
union all
(select sum("FREIGHT FROM INDIA") as total from airlinewise_monthly_international_air_traffic_to_and_from_the_i amiattafti 
where "YEAR" = 2016)

--|total |
--|------|
--|887780|
--|893187|


--Summary of freight to India in Q1 (increase in every year)
(select sum("FREIGHT TO INDIA") as total from airlinewise_monthly_international_air_traffic_to_and_from_the_i amiattafti 
where "YEAR" = 2015 and quarter = 'Q1')
union all
(select sum("FREIGHT TO INDIA") as total from airlinewise_monthly_international_air_traffic_to_and_from_the_i amiattafti 
where "YEAR" = 2016  and quarter = 'Q1')
union all
(select sum("FREIGHT TO INDIA") as total from airlinewise_monthly_international_air_traffic_to_and_from_the_i amiattafti 
where "YEAR" = 2017 and quarter = 'Q1')

--|total |
--|------|
--|126384|
--|134218|
--|154621|

--Summary of freight from India in Q1 (increase in every year)
(select sum("FREIGHT FROM INDIA") as total from airlinewise_monthly_international_air_traffic_to_and_from_the_i amiattafti 
where "YEAR" = 2015 and quarter = 'Q1')
union all
(select sum("FREIGHT FROM INDIA") as total from airlinewise_monthly_international_air_traffic_to_and_from_the_i amiattafti 
where "YEAR" = 2016  and quarter = 'Q1')
union all
(select sum("FREIGHT FROM INDIA") as total from airlinewise_monthly_international_air_traffic_to_and_from_the_i amiattafti 
where "YEAR" = 2017 and quarter = 'Q1')

--|total |
--|------|
--|213761| 
--|215833|
--|238553|
