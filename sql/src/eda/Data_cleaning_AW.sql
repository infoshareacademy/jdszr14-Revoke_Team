select * from air_traffic at2 
select * from citypairwise c 
select * from countrywise c 

-- usunięcie pustej kolumny column9
ALTER TABLE citypairwise 
DROP COLUMN column9;


-- usunięcie danych z wartościami 0 (puste loty?)

DELETE FROM air_traffic WHERE passengers_to_india = '0' and passengers_from_india = '0' and freight_to_india = '0' and freight_from_india = '0'
-- usunęło 158

DELETE FROM citypairwise  WHERE passengers_from_city1_to_city2 = '0' and passengers_from_city2_to_city1 = '0' and freight_from_city1_to_city2 = '0' and freight_from_city2_to_city1 = '0'
-- usunęło 185

DELETE FROM countrywise  WHERE passengers_to_india = '0' and passengers_from_india = '0' and freight_to_india = '0' and freight_from_india = '0'
-- usunęło 35

