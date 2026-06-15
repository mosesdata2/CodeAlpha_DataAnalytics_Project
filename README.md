# CodeAlpha Data Analytics Internship Portfolio

This repository contains my completed projects for the CodeAlpha Data Analytics Internship. The projects demonstrate a complete end-to-end data analytics workflow: extracting and structuring relational data via SQL, and designing an interactive business intelligence dashboard in Excel to deliver actionable agricultural insights.

---

## 📊 Project 1: Smart Agriculture Yield Intelligence Dashboard

### 🔍 Executive Summary
This project focuses on transforming raw agricultural datasets into an interactive decision-support system. By combining backend SQL data preparation with advanced Excel visual design, the dashboard tracks crop performance, regional productivity, and fertilizer efficiency to provide strategic recommendations for crop yield optimization.

* **Tools Used:** Microsoft Excel (Advanced Dashboard Design, Interactive Slicers), PostgreSQL / SQL
* **Core Focus:** KPI Tracking, Seasonal Trend Modeling, and Operational Optimization.

### 🛠️ Technical Architecture & Workflow
1. **Data Extraction & Aggregation (SQL):** Handled heavy data joining, filtering out data anomalies, and aggregating average yields across records using relational logic (`GROUP BY`, multi-table joins).
2. **Data Modeling & Visualization (Excel):** Developed a dynamic dashboard featuring interactive slicers for instant data drilling by Region, Harvest Month, and Crop Type. 

### 📈 Key Metrics & Performance Indicators (KPIs)
* **Average Crop Yield:** 4,032.93 kg/hectares across all sectors.
* **Top Performing Region:** Central USA
* **Most Efficient Fertilizer Type:** Inorganic Fertilizer
* **Top Producing Crop Type:** Soybean

### 💡 Core Business Insights Discovered
* **Seasonal Trends:** Crop productivity shows significant fluctuations across seasons, experiencing a slight dip in June (3,978 kg/ha) before rallying strongly to a peak in August (4,196 kg/ha).
* **Fertilizer Efficiency:** Inorganic fertilizers deliver the highest performance, outperforming mixed and organic variations, indicating a critical lever for yield maximization.
* **Risk & Disease Impact:** Disease severity directly correlates with massive drops in production; "Severe" disease conditions noticeably degrade average crop yields compared to sectors with "Mild" or "None" classifications.

### 📋 Strategic Business Recommendations
1. **Optimize Fertilizer Input:** Promote efficient fertilizer management practices, particularly scaling the adoption of high-performing inorganic fertilizer types to maximize agricultural output.
2. **Proactive Disease Intervention:** Strengthen disease prevention protocols and early intervention strategies to minimize crop losses and protect overall farm productivity.
3. **Knowledge Transfer Networks:** Encourage operational knowledge transfer from top-performing regions like Central USA to lower-performing zones through farmer education and extension services.

---

## 🗄️ Project 2: SQL Business Queries & Script Optimization

### 🔍 Executive Summary
Developed a structured SQL database script to clean, manipulate, and query the underlying datasets powering the agricultural model. This project focuses on translating complex operational requirements into optimized database logic.

* **Core Focus:** Relational Joins, Aggregations, Decimal Data Integrity, and Subqueries.

### 🛠️ Technical Implementation Highlights
* **Precision Metrics:** Maintained strict decimal data types for soil pH, environmental indices, and average yields to prevent rounding errors in high-stakes reporting.
* **Multi-Table Joins:** Integrated multiple core entity tables smoothly to connect regional factors, crop types, and harvest timelines without data duplication.
