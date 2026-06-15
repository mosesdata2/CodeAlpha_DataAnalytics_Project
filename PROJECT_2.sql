--What drives high crop yield?
--Temperature vs yield
SELECT 
   CASE
      WHEN temperature_c < 20.295 THEN 'Low Temperature'
	  WHEN temperature_c BETWEEN 20.295 AND 29.09 THEN 'Moderate Temperature'
	    ELSE 'High Temperature'
	END AS temperature_category,
	ROUND(AVG(yield_kg_per_hectare),2) AS avg_yield,
	COUNT(*) AS total_farms
FROM smart_farm_data
GROUP BY temperature_category
ORDER BY avg_yield DESC;

--Rainfall category vs yield
SELECT 
   CASE
      WHEN rainfall_mm < 119.23 THEN 'Low Rainfall'
	  WHEN rainfall_mm BETWEEN 119.23 AND 239.035 THEN 'Moderate Rainfall'
	    ELSE 'High Rainfall'
	END AS rainfall_category,
	ROUND(AVG(yield_kg_per_hectare),2) AS avg_yield,
	COUNT(*) AS total_farms
FROM smart_farm_data
GROUP BY rainfall_category
ORDER BY avg_yield DESC;

--Humidity category vs yield
SELECT 
   CASE
      WHEN humidity_percent < 51.865 THEN 'Low humidity'
	  WHEN humidity_percent BETWEEN 51.865 AND 77.995 THEN 'Moderate humidity'
	    ELSE 'High humidity'
	END AS humidity_category,
	ROUND(AVG(yield_kg_per_hectare),2) AS avg_yield,
	COUNT(*) AS total_farms
FROM smart_farm_data
GROUP BY humidity_category
ORDER BY avg_yield DESC;

--Sunlight category vs Yield
SELECT 
   CASE
      WHEN sunlight_hour < 5.6675 THEN 'Low sunlight'
	  WHEN sunlight_hour  BETWEEN 5.6675 AND 8.47 THEN 'Moderate sunlight'
	    ELSE 'High sunlight'
	END AS sunlight_category,
	ROUND(AVG(yield_kg_per_hectare),2) AS avg_yield,
	COUNT(*) AS total_farms
FROM smart_farm_data
GROUP BY sunlight_category
ORDER BY avg_yield DESC;

--Soil PH category vs yield
SELECT 
   CASE
      WHEN soil_ph < 6.03 THEN 'Acidic Soil'
	  WHEN soil_ph BETWEEN 6.03 AND 7.04 THEN 'Netural Soil'
	    ELSE 'Alkaline soil'
	END AS soil_ph_category,
	ROUND(AVG(yield_kg_per_hectare),2) AS avg_yield,
	COUNT(*) AS total_farms
FROM smart_farm_data
GROUP BY soil_ph_category
ORDER BY avg_yield DESC;

--Soil moisture category vs yield
SELECT 
   CASE
      WHEN soil_moisture_percent < 17.89 THEN 'Low Moisture'
	  WHEN soil_moisture_percent BETWEEN 17.89 AND 36.02 THEN 'Moderate Moisture'
	    ELSE 'High Moisture'
	END AS soil_moisture_category,
	ROUND(AVG(yield_kg_per_hectare),2) AS avg_yield,
	COUNT(*) AS total_farms
FROM smart_farm_data
GROUP BY soil_moisture_category
ORDER BY avg_yield DESC;


--Does fertilizer improve yield
SELECT 
 fertilizer_type,
 ROUND(AVG(yield_kg_per_hectare),2) AS avg_yield,
 COUNT(*) AS total_farms
FROM smart_farm_data
GROUP BY fertilizer_type
ORDER BY avg_yield DESC;

--Does farming period affect yield
SELECT DISTINCT ON (crop_type)
crop_type,
  TRIM(TO_CHAR(sowing_date, 'Month')) AS best_sowing_month,
  ROUND(AVG(yield_kg_per_hectare),2) AS avg_yield,
  COUNT(*) AS total_farms
FROM smart_farm_data
GROUP BY crop_type,TO_CHAR(sowing_date,'Month')
ORDER BY crop_type,avg_yield DESC;

SELECT DISTINCT ON (crop_type)
  TRIM(TO_CHAR(MONTH FROM harvest_date)) AS best_harvest_mont
  ROUND(AVG(yield_kg_per_hectare),2) AS avg_yield
FROM smart_farm_data
GROUP BY harvest_month
ORDER BY harvest_month;

--Which region regions produce best yield?
SELECT 
   region, ROUND(AVG(yield_kg_per_hectare),2) AS avg_yield,
   COUNT(*) AS total_farms
FROM smart_farm_data
GROUP BY region
ORDER BY avg_yield DESC;

--Does NDVI relate to disease/yield?
SELECT 
   crop_disease_status,
   ROUND(AVG(NDVI_index),2) AS avg_ndvi,
   ROUND(AVG(yield_kg_per_hectare),2) AS avg_yield
FROM smart_farm_data
GROUP BY crop_disease_status;

--Are farm inputs efficient?
SELECT 
  irrigation_type,
  ROUND(AVG(yield_kg_per_hectare),2) AS avg_yield
FROM smart_farm_data
GROUP BY irrigation_type
ORDER BY avg_yield DESC;

SELECT 
  pesticide_category,
  ROUND(AVG(yield_kg_per_hectare),2) AS avg_yield,
  COUNT(*) AS total_farms
FROM smart_farm_data
GROUP BY pesticide_category
ORDER BY avg_yield;

--which locations(geography) produce best yield?
SELECT 
  region,
  ROUND(AVG(latitude),2)AS avg_latitude,
  ROUND(AVG(longitude),2) AS avg_longitude,
  ROUND(AVG(yield_kg_per_hectare),2) AS avg_yield
FROM smart_farm_data
GROUP BY region
ORDER BY avg_yield DESC;

SELECT * FROM smart_farm_data
ORDER BY farm_id ASC