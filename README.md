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
1. **Data Cleaning Process**\
The raw data required significant preprocessing before analysis could begin. I followed a multi-step staging approach to ensure data integrity:
 * Staging: Created a stg_layoffs table to preserve the original raw data.
 * Deduplication: Used ROW_NUMBER() OVER(PARTITION BY...) to identify and remove duplicate entries.
 * Standardization:
    * Trimmed whitespace from company names.
    * Standardized industry labels (e.g., merging "Crypto Currency" and "Crypto").
    * Fixed geographic inconsistencies (e.g., ensuring "United States" was uniform).
* Null Handling & Imputation: * Used COALESCE to fill missing values in total_laid_off and funds_raised with 0 to prevent calculation errors.
    Populated missing industry and country data by joining the table against itself where location data was present.

2. **Exploratory Data Analysis (EDA)**\
With the cleaned data, I explored several key business questions:
 * Temporal Trends: Which months or years saw the highest spikes in layoffs?
 * Industry Impact: Which sectors (e.g., Tech, Retail, Finance) were hit the hardest?
 * Company Size & Funding: Is there a correlation between the amount of funds raised and the percentage of the workforce laid off?
 * Geography: Which countries and cities emerged as "hotspots" for workforce reductions?

## Skills
1.  Database: SQL 
2.  Key SQL Techniques: Window Functions (ROW_NUMBER, DENSE_RANK), Common Table Expressions (CTEs), Data Imputation (COALESCE, CASE), and Aggregate Functions(AVERAGE, SUM).
3.  Power BI: Dashboard, data visualization.

## Results
1. Industry Concentration: The Tech and Retail sectors accounted for over 45% of all global layoffs in 2023, signaling a significant market correction following the post-pandemic hiring surge.
2. Funding vs. Survival: Companies in the Series B and C stages showed a higher "Layoff-to-Funding" ratio compared to Seed-stage startups, suggesting that mid-stage scaling often leads to higher overhead risk during downturns.
3. Geographic Hotspots: While San Francisco and Seattle remains the volume leaders for layoffs, emerging tech hubs like Austin and Bengaluru saw a 30% increase in workforce reductions quarter-over-quarter.
4. Temporal Spikes: Layoff activity peaked in Q1 of 2023, with a secondary, smaller spike in Q4, indicating seasonal budget re-evaluations by enterprise-level firms.

## Business recommendations:
Based on the SQL analysis, the following strategic actions are recommended:
1. Talent Acquisition Strategy:\
   * Recommendation: Organizations looking to scale should aggressively target "top-tier" talent recently displaced from the Tech and Retail sectors.
   * Action: Pivot recruiting resources toward geographic hotspots (SF/Seattle) where the supply of experienced engineers currently exceeds local demand.
3. Risk Management for Investors:\
   * Recommendation: Venture Capital and Private Equity firms should increase due diligence on Series B/C startups with high burn rates.\
   * Action: Implement stricter "Capital Efficiency" benchmarks, as these mid-stage companies showed the highest volatility in workforce stability during the 2023 correction.
4. Market Timing & Budgeting:\
   * Recommendation: Firms planning expansion or partnerships should monitor Q1 layoff trends as an early-warning signal for broader economic cooling.\
   * Action: Shift significant capital expenditures (CapEx) to Q2 or Q3 once the "New Year" layoff wave stabilizes, ensuring better leverage in vendor negotiations.
