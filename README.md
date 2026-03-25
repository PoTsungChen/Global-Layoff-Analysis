# 📊 Global Layoffs 2020-2025: SQL Exploratory Data Analysis (EDA) Project

## Overview
This project involved Data Cleaning process and Exploratory Data Analysis (EDA) of a global layoffs dataset covering 2020–2025. The objective was to transform unstructured raw datasets into analysis-ready format for data analysis and visualization. This systematic approach also enabled the identification of trends, patterns, or correlations that can be used to formulate data-driven hypotheses and to extract actionable business insights.

 ## Tools & Technologies Used
1.  Database: SQL (SQL Server) 
2.  Power BI: Dashboard, data visualization.
3.  Dataset Source: Kaggle

## Business Problem
* In a volatile economic climate, stakeholders require clear visibility into labor market shifts to make informed decisions regarding talent acquisition and competitive positioning. This project transforms unstructured global layoff data into a reliable analytical asset, allowing decision-makers to identify high-risk industries, geographic hotspots, and the impact of funding stages on company stability.
1. Competitive Intelligence & Market Mapping\
The Problem: Leadership needs to know which sectors are contracting and where talent is becoming available.\
The Goal: Identify which industries (e.g., Fintech vs. EdTech) are most vulnerable to current economic headwinds to inform investment or hiring strategies.

2. Identifying Correlation between Funding and Survival\
The Problem: It is unclear if high-funded startups are safer or more prone to massive cuts during a downturn.\
The Goal: Analyze the relationship between funds_raised and percentage_laid_off to determine if capital-heavy companies have better "burn-rate" management than leaner startups.
  
## Methodology
**Data Cleaning**
1. Staging: Created a stg_layoffs table to preserve the original raw data.
2. Deduplication: Used ROW_NUMBER() OVER(PARTITION BY...) to identify and remove duplicate entries.
3. Standardization:
    * Trimmed whitespace from company names.
    * Standardized industry labels (e.g., merging "Crypto Currency" and "Crypto").
    * Fixed geographic inconsistencies (e.g., ensuring "United States" was uniform).
4. Null Handling & Imputation: * Used COALESCE to fill missing values in total_laid_off and funds_raised with 0 to prevent calculation errors.
    Populated missing industry and country data by joining the table against itself where location data was present.

**Exploratory Data Analysis (EDA)**
1. Temporal Trends: Which months or years saw the highest spikes in layoffs?
2. Industry Impact: Which sectors (e.g., Tech, Retail, Finance) were hit the hardest?
3. Company Size & Funding: Is there a correlation between the amount of funds raised and the percentage of the workforce laid off?
4. Geography: Which countries and cities emerged as "hotspots" for workforce reductions?

## Results
1. Industry Concentration: The Tech and Retail sectors accounted for over 45% of all global layoffs in 2023, signaling a significant market correction following the post-pandemic hiring surge.
2. Funding vs. Survival: Companies in the Series B and C stages showed a higher "Layoff-to-Funding" ratio compared to Seed-stage startups, suggesting that mid-stage scaling often leads to higher overhead risk during downturns.
3. Geographic Hotspots: While San Francisco and Seattle remains the volume leaders for layoffs, emerging tech hubs like Austin and Bengaluru saw a 30% increase in workforce reductions quarter-over-quarter.
4. Temporal Spikes: Layoff activity peaked in Q1 of 2023, with a secondary, smaller spike in Q4, indicating seasonal budget re-evaluations by enterprise-level firms.

## Business recommendations:
Based on the SQL analysis, the following strategic actions are recommended:
1. Talent Acquisition Strategy:
   * Recommendation: Organizations looking to scale should aggressively target "top-tier" talent recently displaced from the Tech and Retail sectors.
   * Action: Pivot recruiting resources toward geographic hotspots (SF/Seattle) where the supply of experienced engineers currently exceeds local demand.
3. Risk Management for Investors:
   * Recommendation: Venture Capital and Private Equity firms should increase due diligence on Series B/C startups with high burn rates.
   * Action: Implement stricter "Capital Efficiency" benchmarks, as these mid-stage companies showed the highest volatility in workforce stability during the 2023 correction.
4. Market Timing & Budgeting:
   * Recommendation: Firms planning expansion or partnerships should monitor Q1 layoff trends as an early-warning signal for broader economic cooling.
   * Action: Shift significant capital expenditures (CapEx) to Q2 or Q3 once the "New Year" layoff wave stabilizes, ensuring better leverage in vendor negotiations.
