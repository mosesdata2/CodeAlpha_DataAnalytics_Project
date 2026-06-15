--which region performs best in crop production
SELECT region,
SUM(yield_kg_per_hectare) AS total_yield
FROM smart_farm_data
GROUP BY region
ORDER BY total_yield DESC;

--which crop type perform best across regions
SELECT region,
crop_type,
SUM(yield_kg_per_hectare) AS total_yield
FROM smart_farm_data
GROUP BY region, crop_type

--which fertilizer type produces the highest yield
SELECT fertilizer_type,
ROUND(AVG(yield_kg_per_hectare),2) AS avg_yield
FROM smart_farm_data
GROUP BY fertilizer_type
ORDER BY avg_yield

--How does sowing time affect crop yield
--sowing
SELECT 
TO_CHAR(sowing_date, 'Month')AS sowing_period,
ROUND(AVG(yield_kg_per_hectare),2) AS avg_yield
FROM smart_farm_data
GROUP BY TO_CHAR(sowing_date, 'Month'), EXTRACT(MONTH FROM sowing_date)
ORDER BY EXTRACT(MONTH FROM sowing_date)ASC;

--How does harvest time affect crop yield

SELECT 
TO_CHAR(harvest_date,'Month')AS harvest_period,
ROUND(AVG(yield_kg_per_hectare),2) AS avg_yield
FROM smart_farm_data
GROUP BY TO_CHAR(harvest_date, 'Month'), EXTRACT(MONTH FROM harvest_date)
ORDER BY EXTRACT(MONTH FROM harvest_date)ASC;

SELECT DISTINCT region,
crop_disease_status,
AVG(yield_kg_per_hectare) AS avg_yield
FROM smart_farm_data
GROUP BY region,crop_disease_status;

SELECT DISTINCT region FROM smart_farm_data