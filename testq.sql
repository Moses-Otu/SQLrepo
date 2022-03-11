SELECT NOW();

--Quick EDA on our dataseT

SELECT COUNT (*) AS row_count FROM dbo.crimestat$
SELECT TOP 5 * FROM dbo.crimestat$

--What are the unique values for the crime category column in the crimes table

SELECT DISTINCT
[UCR CRIME CATEGORY]
FROM dbo.crimestat$

--How many unique category values are there in the crimes table

SELECT
	COUNT (DISTINCT [UCR CRIME CATEGORY]) AS unique_category
FROM dbo.crimestat$	

--What is the frequency of occurence of each category

SELECT [UCR CRIME CATEGORY],
	COUNT (*) AS frequency
FROM dbo.crimestat$
GROUP BY 1 ;

--We want to see the frequency of the categories in descending order

SELECT [UCR CRIME CATEGORY],
	COUNT (*) AS frequency
FROM dbo.crimestat$
GROUP BY 1
ORDER BY 2 DESC;--dESC is introduced to specify the order of the result 

--What is the percentage of the frequency of values in the category column

SELECT 
	[UCR CRIME CATEGORY],
	count(*) as frequency,
	Round(100*count(*)/sum(count(*)) OVER(),2) as prcentage
FROM dbo.crimestat$
GROUP BY 1
ORDER BY 2 DESC;

--What year was the highest number of crime recorded?

SELECT 
	 YEAR ([OCCURRED ON]) AS 'year_occured',
	COUNT(*) AS FREQUENCY
FROM dbo.crimestat$
GROUP BY 1
ORDER BY 
2 desc, year 1 DESC

--what is the maximum lenght of time it took to commit a crime

SELECT  [OCCURRED ON], [OCCURRED TO],DATEDIFF(MINUTE, [OCCURRED ON],[OCCURRED TO]) AS 'Total_crime_time'
FROM dbo.crimestat$
GROUP BY 1, 2
ORDER BY 3 desc;
-----This is interesting :). I wander what crime could take that long to commit
			--let's find out

SELECT  [OCCURRED ON], [OCCURRED TO],
	DATEDIFF(MINUTE, [OCCURRED ON],[OCCURRED TO]) AS 'Total_crime_time',
	[UCR CRIME CATEGORY],
	[PREMISE TYPE]
FROM dbo.crimestat$
GROUP BY 1, 2,3
ORDER BY 3,1 desc;

---Result from the last query reveals an important question. What kind of premise do some the crimes occurs?
--RAPE
SELECT Count(*) as frequency,[UCR CRIME CATEGORY],[PREMISE TYPE]
	FROM dbo.crimestat$
	where [UCR CRIME CATEGORY]='RAPE'
	GROUP BY [UCR CRIME CATEGORY],[PREMISE TYPE]
	ORDER BY frequency DESC

--ARSON
SELECT Count(*) as frequency,[UCR CRIME CATEGORY],[PREMISE TYPE]
	FROM dbo.crimestat$
	where [UCR CRIME CATEGORY]= 'ARSON'
	GROUP BY [UCR CRIME CATEGORY],[PREMISE TYPE]
	ORDER BY frequency DESC
	
	
----------------------------------------------------------------------------------------------------------------------------
--SUBQUERIES
--A subquery is essentially a query within a query 
--Take note of the syntax - especially the AS component because subqueries must always have an alias!

--for example, lets determine duplicate values in the dataset

SELECT COUNT(*)
FROM dbo.crimestat$;--result shows we 686257 rows


SELECT COUNT(*)
FROM
(
SELECT DISTINCT *
FROM dbo.crimestat$)
AS subquery----------using subqueries result shows we have 412455 unique rows
;


