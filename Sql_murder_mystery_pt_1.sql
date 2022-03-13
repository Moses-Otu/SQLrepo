--This is the first query run and we are working with the description CITY = "SQL City" and CRIME ="Murder"
SELECT 
	* 
FROM 
	crime_scene_report
WHERE 
	date = 20180115
AND	
	TYPE='murder' 
--Query Result --
--Security footage shows that there were 2 witnesses. The first witness lives at the last house on "Northwestern Dr". 
--The second witness, named Annabel, lives somewhere on "Franklin Ave"

--Query 2a seeks to get details of the witness who leaves at the end Northwestern DR

SELECT 
	* 
FROM 
	person
WHERE 
	address_street_name = "Northwestern Dr"

ORDER BY
	address_number DESC 
	

--Query 2b seeks to get details of the witness Annabel.


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
	"%Franklin ave%"    ---16371
	
	
--query 3 The two witnessess provided us with information that would help us sleuth further

SELECT 
	gfc.membership_id,gfc.check_in_date,
	gfm.id,gfm.name,gfm.membership_status
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
	
--Query above helps in streamlining our search into 2 gym members with gold status card with membershipID %48Z%
	


--QUERY 4 we were given info on the plate number and we also have 2 suspects. when we run the plate number we would get the muderer.

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

--Now who is the mastermind?
