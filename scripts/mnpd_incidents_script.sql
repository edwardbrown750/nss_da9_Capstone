SELECT *
FROM mnpdincidents
ORDER BY incident_occurred
LIMIT 5;

SELECT COUNT(DISTINCT(offense_nibrs))
FROM mnpdincidents

SELECT *
FROM mnpdincidents
WHERE zip_code ISNULL

SELECT DISTINCT(incident_status_description)
FROM mnpdincidents

WITH violent_crimes AS
(SELECT *,
		CASE 
		WHEN offense_nibrs = '09A' 
			OR offense_nibrs ='O9B' 
			OR offense_nibrs ='100' 
			OR offense_nibrs ='11A' 
			OR offense_nibrs ='11B' 
			OR offense_nibrs ='11C' 
			OR offense_nibrs ='11D' 
			OR offense_nibrs ='120' 
			OR offense_nibrs ='13A' 
			OR offense_nibrs ='13B' THEN 'VIOLENT'
		ELSE 'NON-VIOLENT' END AS violent_crime
FROM mnpdincidents
WHERE incident_status_code NOT IN ('R', 'U', 'P') 
 	  AND zip_code IS NOT NULL
),
total_incidents AS (
SELECT 	zip_code,
		COUNT(*) AS total_incidents
FROM violent_crimes
GROUP BY zip_code
),
non_violent_counts AS (
SELECT 	zip_code,
	   	COUNT(*) AS non_violent_incidents
FROM violent_crimes
WHERE violent_crime = 'NON-VIOLENT'
GROUP BY zip_code
),
violent_counts AS (
SELECT 	zip_code,
		COUNT(*) AS violent_incidents
FROM violent_crimes
WHERE violent_crime = 'VIOLENT'
GROUP BY zip_code
)
SELECT  zip_code,
		total_incidents,
		non_violent_incidents,
		violent_incidents
FROM total_incidents AS ti
FULL JOIN non_violent_counts AS nvc USING(zip_code)
FULL JOIN violent_counts AS vcs USING(zip_code)
ORDER BY violent_incidents DESC;