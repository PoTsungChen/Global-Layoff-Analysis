# 📊 Global Layoffs exploratory data analysis
 *An End-to-End ETL Solution for Unemployment Trend Analysis*
 
## Executive Summary
To analyze the macroeconomic shift in global employment from 2020-2026, identifying which sectors/industries maintained stability versus those with high volatility.

## Business Problem
* In a volatile economic climate, stakeholders require clear visibility into labor market shifts to make informed decisions regarding talent acquisition and competitive positioning. This project transforms unstructured global layoff data into a reliable analytical asset, allowing decision-makers to identify high-risk industries, geographic hotspots, and the impact of funding stages on company stability.
1. Competitive Intelligence & Market Mapping\
The Problem: Leadership needs to know which sectors are contracting and where talent is becoming available.\
The Goal: Identify which industries (e.g., Fintech vs. EdTech) are most vulnerable to current economic headwinds to inform investment or hiring strategies.

2. Identifying Correlation between Funding and Survival\
The Problem: It is unclear if high-funded startups are safer or more prone to massive cuts during a downturn.\
The Goal: Analyze the relationship between funds_raised and percentage_laid_off to determine if capital-heavy companies have better "burn-rate" management than leaner startups.
  
## Methodology
**Data Cleaning Process**\
The raw data required significant preprocessing before analysis could begin. I followed a multi-step staging approach to ensure data integrity:
1.  Staging: Created a stg_layoffs table to preserve the original raw data.
2.  Deduplication: Used ROW_NUMBER() OVER(PARTITION BY...) to identify and remove duplicate entries.
3.  Standardization:\
    * Trimmed whitespace from company names.
    * Standardized industry labels (e.g., merging "Crypto Currency" and "Crypto").
    * Fixed geographic inconsistencies (e.g., ensuring "United States" was uniform).
5.  Null Handling & Imputation: * Used COALESCE to fill missing values in total_laid_off and funds_raised with 0 to prevent calculation errors.
    Populated missing industry and country data by joining the table against itself where location data was present.

**Exploratory Data Analysis (EDA)**\
With the cleaned data, I explored several key business questions:\
* Temporal Trends: Which months or years saw the highest spikes in layoffs?
* Industry Impact: Which sectors (e.g., Tech, Retail, Finance) were hit the hardest?
* Company Size & Funding: Is there a correlation between the amount of funds raised and the percentage of the workforce laid off?
* Geography: Which countries and cities emerged as "hotspots" for workforce reductions?

## Skills
1.  Database: SQL 
2.  Key SQL Techniques: Window Functions (ROW_NUMBER, DENSE_RANK), Common Table Expressions (CTEs), Data Imputation (COALESCE, CASE), and Aggregate Functions(AVERAGE, SUM).
3.  Power BI: Dashboard, data visualization.

## Results and business recommendation

## Next steps
