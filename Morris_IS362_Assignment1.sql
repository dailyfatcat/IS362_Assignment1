/*Sarah Morris
Assignment 1
IS 362
Due 02/07/21
*/

#Part 1
#1 - How many airplanes have listed speeds?
SELECT tailnum, speed
FROM planes WHERE speed IS NOT NULL;

#1- What is the minimum listed speed
SELECT tailnum, MIN(speed) as 'Min Speed'
FROM planes;

#1- What is the maximum listed speed?
SELECT tailnum, MAX(speed) as 'Max Speed'
FROM planes;

#2 - What is the total distance flown by all of the planes in January 2013?
SELECT year, month, day, SUM(distance) as TotalDistance
FROM flights WHERE year = '2013' AND month = '1';

#2 - What is the total distance flown by all of the planes in January 2013 where the tailnum is missing
SELECT year, month, day, SUM(distance) as TotalDistance
FROM flights WHERE year = '2013' AND month = '1' AND tailnum = '';

#3- What is the total distance flown for all planes on July 5, 2013 grouped by aircraft manufacturer? 
#Write this statement first using an INNER JOIN, 
SELECT F.year, F.month, F.day, SUM(F.distance) as TotalDistance, P.manufacturer
FROM flights as F 
INNER JOIN planes as P
ON F.tailnum = P.tailnum
WHERE F.year = '2013' AND F.month = '7' and F.day = '5'
GROUP BY P.manufacturer;

#then using a LEFT OUTER JOIN. 
SELECT F.year, F.month, F.day, SUM(F.distance) as TotalDistance, P.manufacturer
FROM flights as F 
LEFT OUTER JOIN planes as P
ON F.tailnum = P.tailnum
WHERE F.year = '2013' AND F.month = '7' and F.day = '5'
GROUP BY P.manufacturer;

#How do your results compare?
#The inner join only returns elements that are present in both tables,
#The left outer join there is a null value for one of the manufacturer
#because it has included all results from both tables

#4 Write a question of your own choosing that joins from three tables
#Group the results by origin that show all flights
#What flights including the manufacturer and origin had temperatures above 35?
SELECT F.tailnum, F.origin, W.temp, P.manufacturer
FROM weather as W
INNER JOIN flights as F
ON W.origin = F.origin
INNER JOIN planes as P
ON F.tailnum = P.tailnum
WHERE w.temp > '35' ;

#Part 2 The SQL user to pull data into CSV file
#After running this query the data can be exported
SELECT distance, tailnum, origin, year FROM flights WHERE year = '2013';
