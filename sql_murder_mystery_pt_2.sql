SELECT 
	*
FROM
	interview
Where 
	person_id=67318
	
--QUERY 1

SELECT 
	*
from
	drivers_license
WHERE
	car_make
LIKE
	"%Tesla%"
AND
	car_model = "Model S"
AND
	Gender = "female"
AND
 	height Between 65 and 67 ---Streamlined our search to 3 licence_id
	
---QUERY 2

select p.license_id, p.name,f.*
FROM person as p
JOIN facebook_event_checkin as f
ON P.id=f.person_id
WHERE f.event_name
LIKE "%SQL symphony%"
AND date like "201712%"
AND license_id =202298 or license_id = 291182 or License_id = 918113

--The Bloody mastermind is Miranda priestly
--Let's see how rich she is

SELECT p.id,p.name,p.ssn,i.annual_income
FROM person as p
JOIN income as I
on p.ssn = i .ssn
WHERE id = 99716---she is worth $310,000

--what is her income rank

SELECT
	ssn,
	annual_income,
	RANK () OVER ( 
		ORDER BY annual_income DESC
	) rank
FROM
	income


