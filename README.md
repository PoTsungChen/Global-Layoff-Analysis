# 📊 Global Layoffs 2020-2025: SQL Exploratory Data Analysis (EDA) Project

## 🔭Overview
This project involved Data Cleaning process and Exploratory Data Analysis (EDA) of a global layoffs dataset covering 2020–2025. The objective was to transform unstructured raw datasets into analysis-ready format for data analysis and visualization. This systematic approach enabled the identification of trends, patterns, or correlations used to formulate data-driven hypotheses and extract actionable insights.

## 🛠️Tools & Technologies Used
1.  Database: SQL (SQL Server) 
2.  Power BI: Dashboard, data visualization.
3.  Dataset Source: Kaggle

## 🧩Business Problem
In a volatile economic climate, stakeholders require clear visibility into labor market shifts to make informed decisions regarding talent acquisition and competitive positioning. Decision-makers need to identify high-risk industries, geographic hotspots, and the impact of funding stages on company stability.

* **Problem** 1: Leadership needs to know which industries are contracting and where talent is becoming available.\
**The Goal**: Identify which industries are most vulnerable to current economic headwinds to inform investment or hiring strategies.

* **Problem 2**: It is unclear if high-funded startups are safer or more prone to massive cuts during a downturn.\
**The Goal**: Analyze the relationship between funds raised and percentage laid-off to determine if capital-heavy companies have better "burn-rate" management than leaner startups.
  
## ⚙️Methodology
**Data Cleaning**
1. Create staging tables: to preserve raw data integrity.
2. Remove Deduplication: Used ROW_NUMBER() and CTEs.
3. Standardized text columns. 
4. Delete recordes where both total_laid_off and percentage_laid_off are null.
5. Update missing country name.
6. Replace null value on text columns to 'Unknown'.

**Exploratory Data Analysis (EDA)**
1. Geography impact: Which countries and cities emerged as "hotspots" for workforce reductions?  
2. Industry/comnpany Impact: Which industries/companies were hit the hardest?
3. Temporal Trends**: Which quarters or years saw the highest spikes in layoffs?
4. Which industries saw the most company closures? (percentage_laid_off = 1)
5. Correlations: Is there a correlation between the amount of funds raised and percentage laid off?
6. Outliers identification.

## 🎯Results
1. **Industry Concentration**: The Hardware and Retail industries accounted for over 23% of all global layoffs from 2020 to 2025, signaling a significant market correction following the post-pandemic hiring surge.
2. **Temporal Spikes**: Layoff activity peaked in Q1 of 2023, with a secondary, smaller spike in Q4, indicating seasonal budget re-evaluations by enterprise-level firms.
3. **Geographic Hotspots**: San Francisco and Seattle, where the most big tech companies headquartered, are the volume leaders for layoffs.
4. **Funding vs.Survival**: Companies in the Series B and C stages showed a higher "Layoff-to-Funding" ratio compared to Seed-stage startups, suggesting that mid-stage scaling often leads to higher overhead risk during downturns.
5. **Outliers**: "The dataset contains several high-leverage observations—specifically in the Retail and Tech sectors—where single-day events exceeded 10,000 layoffs. These outliers were treated as valid data points reflecting the volatile 'post-pandemic correction' phase." While the median layoff size across the dataset was 80 employees, the mean was significantly inflated to 250 due to outlier events in the SF Bay Area and Seattle hubs."

## 🚀Business recommendations:
Based on the analysis, the following strategic actions are recommended:
1. Talent Acquisition:
   * Recommendation: Organizations looking to scale should aggressively target "top-tier" talent recently displaced from the Tech and Retail sectors.
   * Action: Pivot recruiting resources toward geographic hotspots (SF/Seattle) where the supply of experienced engineers currently exceeds local demand.
3. Risk Management:
   * Recommendation: Venture Capital and Private Equity firms should increase due diligence on Series B/C startups with high burn rates.
   * Action: Implement stricter "Capital Efficiency" benchmarks, as these mid-stage companies showed the highest volatility in workforce stability during the 2023 correction.
4. Market Timing & Budgeting:
   * Recommendation: Firms planning expansion or partnerships should monitor Q1 layoff trends as an early-warning signal for broader economic cooling.
   * Action: Shift significant capital expenditures (CapEx) to Q2 or Q3 once the "New Year" layoff wave stabilizes, ensuring better leverage in vendor negotiations.
