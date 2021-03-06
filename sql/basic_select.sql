-- Query all attributes of every Japanese city in the CITY table. The COUNTRYCODE for Japan is JPN.
select *
from city
where COUNTRYCODE = 'JPN'

-- Query the names of all the Japanese cities in the CITY table. The COUNTRYCODE for Japan is JPN.
select name
from city
where COUNTRYCODE = 'JPN'

-- Query a list of CITY and STATE from the STATION table.
select city,state
from station

/*
Let  be the number of CITY entries in STATION, and let  be the number of distinct CITY names in STATION; query the value of  from STATION.
In other words,
find the difference between the total number of CITY entries in the table and the number of distinct CITY entries in the table.
*/
Select count(CITY) - count(distinct CITY) from STATION

-- Query the list of CITY names starting with vowels (i.e., a, e, i, o, or u) from STATION. Your result cannot contain duplicates.
select distinct city
from station
where city like 'a%' or city like 'e%' or city like 'i%' or city like 'o%' or city like 'u%'

--or --
SELECT DISTINCT city FROM station WHERE city REGEXP "^[aeiou].*"

-- Query the list of CITY names ending with vowels (a, e, i, o, u) from STATION. Your result cannot contain duplicates.
SELECT DISTINCT city FROM station WHERE city REGEXP ".*[aeiou]$"

-- Query the list of CITY names from STATION which have vowels (i.e., a, e, i, o, and u) as both their first and last characters. Your result cannot contain duplicates.
SELECT DISTINCT city FROM station WHERE city REGEXP "^[aeiou].*[aeiou]$"
--or--
select distinct city from station
where left(city,1) in ('a','e','i','o','u')
and right(city, 1) in ('a','e','i','o','u')

-- Query the list of CITY names from STATION that do not start with vowels and do not end with vowels. Your result cannot contain duplicates.
select distinct city from station where (left(city,1) not in ('a','e','i','o','u') and  right(city,1) not in ('a','e','i','o','u'));

/* Query the Name of any student in STUDENTS who scored higher than  Marks. 
Order your output by the last three characters of each name. 
If two or more students both have names ending in the same last three characters (i.e.: Bobby, Robby, etc.), 
secondary sort them by ascending ID.*/
select name
from students
where marks >75
order by right(name,3), id asc

/*
Write a query identifying the type of each record in the TRIANGLES table using its three side lengths. Output one of the following statements for each record in the table:

Equilateral: It's a triangle with  sides of equal length.
Isosceles: It's a triangle with  sides of equal length.
Scalene: It's a triangle with  sides of differing lengths.
Not A Triangle: The given values of A, B, and C don't form a triangle.

*/
SELECT CASE WHEN A + B <= C OR A + C <= B OR B + C <= A THEN 'Not A Triangle'
            WHEN A = B AND B = C THEN 'Equilateral'
            WHEN A = B OR A = C OR B = C THEN 'Isosceles'
            ELSE 'Scalene'
        END
FROM TRIANGLES



/*
Generate the following two result sets:

Query an alphabetically ordered list of all names in OCCUPATIONS, immediately followed by the first letter of each profession as a parenthetical (i.e.: enclosed in parentheses). For example: AnActorName(A), ADoctorName(D), AProfessorName(P), and ASingerName(S).
Query the number of ocurrences of each occupation in OCCUPATIONS. Sort the occurrences in ascending order, and output them in the following format:
*/
select concat(Name,'(',Substring(Occupation,1,1),')') as Name
from occupations
Order by Name;
select concat('There are a total of ',' ',count(occupation),' ',lower(occupation),'s.') as total
from occupations
group by occupation
order by total;