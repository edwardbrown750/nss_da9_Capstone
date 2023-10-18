SELECT *
FROM metrosurvey2018
LIMIT 2;

WITH qol AS (
SELECT zip_code,
	   quality_of_life as response_types,
	   COUNT(quality_of_life) AS quality_of_life
FROM metrosurvey2018
GROUP BY zip_code, response_types
),
safety AS (
SELECT zip_code,
	   overall_feeling_of_safety as response_types,
	   COUNT(overall_feeling_of_safety) AS overall_feeling_of_safety
FROM metrosurvey2018
GROUP BY zip_code, response_types
),

SELECT zip_code,
	   response_types,
	   quality_of_life,
	   overall_feeling_of_safety
FROM qol
FULL JOIN safety USING(zip_code, response_types)
ORDER BY zip_code