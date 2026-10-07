CREATE OR REPLACE VIEW analysis_flight AS
SELECT *,

CASE
    WHEN DEP_DELAY <= 0 THEN 'On Time'
    WHEN DEP_DELAY <= 15 THEN 'Minor Delay'
    WHEN DEP_DELAY <= 60 THEN 'Moderate Delay'
    ELSE 'Severe Delay'
END AS Delay_Status,

MONTHNAME(FL_DATE) AS Month_Name,

CASE
    WHEN CRS_DEP_TIME < 600 THEN 'Early Morning'
    WHEN CRS_DEP_TIME < 1200 THEN 'Morning'
    WHEN CRS_DEP_TIME < 1700 THEN 'Afternoon'
    WHEN CRS_DEP_TIME < 2100 THEN 'Evening'
    ELSE 'Night'
END AS Departure_Slot

FROM flights_sample_3m;