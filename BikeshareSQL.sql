


SELECT * into bike_merged
FROM

(	
	SELECT * FROM may_2021
	union all
	SELECT * FROM june_2021
	union all
	SELECT * FROM july_2021
	union all
	SELECT * FROM august_2021
	union all
	SELECT * FROM sept_2021
	union all
	SELECT * FROM oct_2021
	union all
	SELECT * FROM nov_2021
	union all
	SELECT * FROM dec_2021
	union all
	SELECT * FROM jan_2022
	union all
	SELECT * FROM feb_2022
	union all
	SELECT * FROM march_2022
	union all
	SELECT * FROM april_2022
	) as A

select TOP 5 * from bike_merged

SELECT * INTO bike_notnull
FROM
(
	select * FROM bike_merged
	where start_station_name IS NOT NULL
		AND start_station_id IS NOT NULL
		AND end_station_name IS NOT NULL
		AND end_station_id IS NOT NULL
		and start_lng IS NOT NULL
		and end_lat IS NOT NULL
		and end_lng IS NOT NULL
) AS B

SELECT COUNT(*) FROM dbo.bike_notnull
--Null values accounted for about  1M rows

	
	---RENAMING AND TRANSFORMING THE DATA
	select * into bike_Tinfo

	FROM
(
	
	SELECT ride_id,rideable_type as bike_type
	,YEAR(started_at) as started_year
	,DATENAME(MONTH,started_at) as started_month
	,DATENAME(WEEKDAY,started_at) as started_date
	,DATEPART(HOUR,started_at) as Hour
	,DATEDIFF(MINUTE,started_at,ended_at)as ride_length
	,Case
		WHEN DATEPART(HOUR,started_at) >=0 AND DATEPART(HOUR,started_at) <=12 THEN 'Morning'
		WHEN DATEPART(HOUR,started_at) >12 AND DATEPART(HOUR,started_at) <=16 THEN 'Afternoon'
		WHEN DATEPART(HOUR,started_at) >16 AND DATEPART(HOUR,started_at) <=23 THEN 'Evening'
	ELSE NULL
	END AS TimeofDay
	,start_station_id,end_station_name,end_station_id,start_lat,start_lng,end_lat,end_lng,member_casual as rider_type
	FROM
	Bike.dbo.bike_notnull

	) AS C