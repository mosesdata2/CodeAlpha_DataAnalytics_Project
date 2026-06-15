DROP TABLE smart_agriculture_data

CREATE TABLE smart_farm_data (
    farm_id VARCHAR(50) PRIMARY KEY,
	region VARCHAR(100),
	crop_type VARCHAR(100),
	soil_moisture_percent NUMERIC(6,2),
	soil_ph NUMERIC(4,2),
	temperature_c NUMERIC(5,2),
	rainfall_mm NUMERIC(6,2),
	humidity_percent NUMERIC(5,2),
	sunlight_hour NUMERIC(4,2),
	irrigation_type VARCHAR(100),
	fertilizer_type VARCHAR(100),
	Pesticide_usage_ml NUMERIC(6,2), -- Handles point like 6.34
	sowing_date VARCHAR(50),
	harvest_date VARCHAR(50),
	total_days INT,
	yield_kg_per_hectare NUMERIC(10,2),
	sensor_id VARCHAR(50),
	timestamp VARCHAR(50),
	latitude NUMERIC(10,6),
	longitude NUMERIC(10,6),
	NDVI_index NUMERIC(4,2),
	crop_disease_status VARCHAR(100)
);

SELECT * FROM smart_farm_data

SELECT COUNT(*) FROM smart_farm_data

SELECT column_name,data_type
FROM information_schema.columns
WHERE table_name = 'smart_farm_data'

SELECT 
COUNT(*) FILTER(WHERE farm_id IS NULL) AS farm_id_nulls,
COUNT(*) FILTER(WHERE region IS NULL) AS region_nulls,
COUNT(*) FILTER(WHERE crop_type IS NULL) AS crop_nulls,
COUNT(*) FILTER(WHERE soil_moisture_percent IS NULL) AS soil_moisture_nulls,
COUNT(*) FILTER(WHERE soil_ph IS NULL) AS ph_nulls,
COUNT(*) FILTER(WHERE temperature_c IS NULL) AS temp_nulls,
COUNT(*) FILTER(WHERE rainfall_mm IS NULL) AS rainfall_nulls,
COUNT(*) FILTER(WHERE humidity_percent IS NULL) AS humidity_nulls,
COUNT(*) FILTER(WHERE sunlight_hour IS NULL) AS sunlight_nulls,
COUNT(*) FILTER(WHERE yield_kg_per_hectare IS NULL) AS yield_nulls,
COUNT(*) FILTER(WHERE ndvi_index IS NULL) AS ndvi_nulls
FROM smart_farm_data;

DELETE FROM smart_farm_data
WHERE 
    crop_type is NULL
    OR yield_kg_per_hectare IS NULL
	OR region IS NULL;

SELECT 
  farm_id,
  timestamp,
  COUNT(*)
  FROM smart_farm_data
  GROUP BY farm_id, timestamp
  HAVING COUNT(*) > 1;

DELETE FROM smart_farm_data a
USING smart_farm_data b
  WHERE
     a.ctid < b.ctid
	 AND a.farm_id = b.farm_id
	 AND a.timestamp = b.timestamp;

SELECT * FROM smart_farm_data
WHERE soil_ph < 0 OR soil_ph > 14;

SELECT * FROM smart_farm_data
WHERE temperature_c < -10 OR temperature_c > 60;

SELECT * FROM smart_farm_data
WHERE rainfall_mm < 0;

SELECT * FROM smart_farm_data
WHERE yield_kg_per_hectare <= 0;



ALTER TABLE smart_farm_data
ALTER COLUMN sowing_date TYPE DATE
USING sowing_date::DATE;

ALTER TABLE smart_farm_data
ALTER COLUMN harvest_date TYPE DATE
USING harvest_date::DATE;

ALTER TABLE smart_farm_data
ADD COLUMN growth_days INT;

UPDATE smart_farm_data
SET growth_days = harvest_date - sowing_date;

ALTER TABLE smart_farm_data
ADD COLUMN yield_category VARCHAR(20);

UPDATE smart_farm_data
SET yield_category =
  CASE 
    WHEN yield_kg_per_hectare < 2000 THEN 'Low'
	WHEN yield_kg_per_hectare BETWEEN 2000 AND 5000
THEN 'Medium'
   ELSE 'High'
END;

SELECT *
FROM smart_farm_data
ORDER BY farm_id ASC

SELECT 
  MIN(yield_kg_per_hectare),
  MAX(yield_kg_per_hectare),
  AVG(yield_kg_per_hectare)
FROM smart_farm_data;

SELECT 
  percentile_cont(0.25) WITHIN GROUP(ORDER BY yield_kg_per_hectare) AS q1,
  percentile_cont(0.50) WITHIN GROUP(ORDER BY yield_kg_per_hectare) AS median,
  percentile_cont(0.75) WITHIN GROUP(ORDER BY yield_kg_per_hectare) AS q3
FROM smart_farm_data;

UPDATE smart_farm_data
SET yield_category =
  CASE
     WHEN yield_kg_per_hectare < 2994.8 THEN 'Low'
	 WHEN yield_kg_per_hectare BETWEEN 2994.8 AND 5062.1 THEN 'Medium'
	 ELSE 'High'
END;	

SELECT 
 region,yield_category,COUNT(*) AS total_farms
FROM smart_farm_data
GROUP BY region,yield_category
ORDER BY region;

SELECT 
  yield_category,
  ROUND(AVG(soil_ph),2) AS avg_ph,
  ROUND(AVG(soil_moisture_percent),2) AS avg_moisture
FROM smart_farm_data
GROUP BY yield_category;

SELECT 
  yield_category,
  ROUND(AVG(temperature_c),2) AS avg_temp,
  ROUND(AVG(rainfall_mm),2) AS avg_rainfall
FROM smart_farm_data
GROUP BY yield_category;

SELECT 
 DISTINCT crop_type FROM smart_farm_data

SELECT * FROM smart_farm_data

SELECT 
  MIN(pesticide_usage_ml),
  MAX(pesticide_usage_ml),
  AVG(pesticide_usage_ml)
FROM smart_farm_data;

SELECT 
   percentile_cont(0.25) WITHIN GROUP (ORDER BY pesticide_usage_ml) AS q1,
   percentile_cont(0.50) WITHIN GROUP (ORDER BY pesticide_usage_ml) AS median,
   percentile_cont(0.75) WITHIN GROUP (ORDER BY pesticide_usage_ml) AS q3
FROM smart_farm_data;

ALTER TABLE smart_farm_data
ADD COLUMN pesticide_category VARCHAR(20);

UPDATE smart_farm_data
SET pesticide_category =
  CASE
    WHEN pesticide_usage_ml < 14.945 THEN 'Low Usage'
	WHEN pesticide_usage_ml BETWEEN 14.945 AND 38.005
	THEN 'Medium Usage'
	ELSE 'High Usage'
END;

SELECT 
  MIN(temperature_c),
  MAX(temperature_c),
  AVG(temperature_c)
FROM smart_farm_data

SELECT 
   percentile_cont(0.25) WITHIN GROUP (ORDER BY temperature_c) AS q1,
   percentile_cont(0.50) WITHIN GROUP (ORDER BY temperature_c) AS median,
   percentile_cont(0.75) WITHIN GROUP (ORDER BY temperature_c) AS q3
FROM smart_farm_data;

SELECT 
  MIN(humidity_percent),
  MAX(humidity_percent),
  AVG(humidity_percent)
FROM smart_farm_data

SELECT 
   percentile_cont(0.25) WITHIN GROUP (ORDER BY humidity_percent) AS q1,
   percentile_cont(0.50) WITHIN GROUP (ORDER BY humidity_percent) AS median,
   percentile_cont(0.75) WITHIN GROUP (ORDER BY humidity_percent) AS q3
FROM smart_farm_data;

SELECT 
   percentile_cont(0.25) WITHIN GROUP (ORDER BY sunlight_hour) AS q1,
   percentile_cont(0.50) WITHIN GROUP (ORDER BY sunlight_hour) AS median,
   percentile_cont(0.75) WITHIN GROUP (ORDER BY sunlight_hour) AS q3
FROM smart_farm_data;

SELECT 
   percentile_cont(0.25) WITHIN GROUP (ORDER BY soil_ph) AS q1,
   percentile_cont(0.50) WITHIN GROUP (ORDER BY soil_ph) AS median,
   percentile_cont(0.75) WITHIN GROUP (ORDER BY soil_ph) AS q3
FROM smart_farm_data;