SELECT 
	* 
FROM 
	crime_scene_report
WHERE 
	date = 20180115
AND	
	TYPE='murder' --this query gives a piece of informatiion ro get started


--Query 2a

SELECT 
	* 
FROM 
	person
WHERE 
	address_street_name = "Northwestern Dr"

ORDER BY
	address_number DESC ----this query identifies one of the suspects as 'ID' 14887	,'Name' Morty Schapiro	'licence ID' 118009	4919	Northwestern Dr	'ssn' 111564949
	

--Query 2b


SELECT 
	* 
FROM 
	person
WHERE 
	name
LIKE
	"%Annabel%"
AND
	address_street_name
LIKE
	"%Franklin ave%"    ---16371	Annabel Miller	490173	103	Franklin Ave	318771143
	
	
--query 3 The two witnessess provided us with information that would help us sleuth further

SELECT 
	gfc.membership_id,gfc.check_in_date,
	gfm.id,get_fit_now_member.name,gfm.membership_status
FROM 
	get_fit_now_check_in AS gfc
JOIN
	get_fit_now_member AS gfm
ON 
	gfc.membership_id = gfm.id
where
	gfm.membership_status='gold'
AND	
	gfc.membership_id 
LIKE
	"48Z%"
	
--QUERY 4

SELECT 
	p.name, d.plate_number
FROM 
	person as p
JOIN
	drivers_license as d
ON
	p.license_id=d.id
Where 
	d.plate_number 
LIKE
	"%H42W%"
AND
	p.name = "Joe Gemuska" OR p.name = "Jeremy Bowers"
	
-THE BLOODY KILLER'S NAME IS JEREMY BOWERS"

--Now who is the mastermind
