# 📊 Global Layoff Anslysis

## 🖼️Contxt
In a volatile economic climate, organizations require clear visibility into labor market shifts to make informed decisions regarding talent acquisition and competitive positioning. Decision-makers need to evaluate industry risk, geographic hotspots, and the correlation between funding stages and long-term stability to optimize capital investments. This analysis provides data-driven insights into corporate budgeting and strategic capital allocation.

## 🧩Business Problems

* **Problem** 1: How should leadership adjust hiring strategies during an economic downturn?\
**Objective**: Determine if there are specific industry clusters or temporal trends evident during economic headwinds.

* **Problem 2**: Does a venture capital investment strategy carry higher risk during periods of macroeconomic volatility?\
**Objective**: Evaluate the correlation between funding levels and layoff intensity to determine if smaller startups maintain sufficient capital efficiency.
  
## 🔍Exploratory Data Analysis (EDA)

1. Geography impact: Which countries and cities emerged as "hotspots" for workforce reductions?  
2. Industry/comnpany Impact: Which industries/companies were hit the hardest?
3. Temporal Trends: Which quarters or years saw the highest spikes in layoffs?
4. Company Stage: Which company stage saw the highest layoff percentage? 
5. Correlations: Is there a correlation between the amount of funds raised and percentage laid off?
6. Outliers identification.

## 🎯Key Findings & Insights
1. **Industry Concentration**: An early-pandemic collapse in Travel and Transportation, followed by a sustained contraction in Hardware and Retail from 2023 through 2025. During this latter period, Hardware and Retail consistently dominated the layoff rankings, eventually accounting for 23% of total global reductions as firms recalibrated following post-pandemic hiring surges.

   
      <img width="600" height="400" alt="image" src="https://github.com/user-attachments/assets/5100e6d7-cbb5-4a2a-85fd-d91958bdcdfc" />



2. **Temporal Spikes**: Layoff activity peaked during Q1 and Q2 in most of the years in the span of the dataset (except for 2022), suggesting that the firms are performing aggressive seasonal budget re-alignments to start the fiscal year. The spike in 2022 was likely driven by aggressive Federal Reserve interest rate hikes. This created a significant anomaly where a small number of 'Big Tech' outliers accounted for a disproportionate volume of total layoffs, particularly during the surge in Q3 and Q4.


      <img width="600" height="400" alt="image" src="https://github.com/user-attachments/assets/e6daa164-cc4a-4a91-bd52-ce51752fbbb2" />


    
3. **Geographic Hotspots**: The United States topped the list for total layoffs for six consecutive years. Among the American cities, San Francisco and Seattle, primary headquarters for "Big Tech" companies, emerged as the volume leaders for layoffs, reflecting a significant contraction within the headquarters of Big Tech.
   

      <img width="600" height="400" alt="image" src="https://github.com/user-attachments/assets/6c2bf055-927d-425f-9125-ce865859ac03" />



4. **Company Stage vs Percentage Layoffs**: While Public companies accounted for the highest total volume of layoffs, Seed to Series B firms experienced the most severe workforce reductions by percentage, suggesting that early-stage ventures are more sensitive to negative market environment.


      <img width="600" height="400" alt="image" src="https://github.com/user-attachments/assets/93e34521-e214-4e9e-9527-15b40af803c7" />


   
5. **Correlations**: A inverse relationship: low funding, early-stage companies (Seed, Series A) tend to have higher layoff percentage due to their lack of capital buffers. Prolonged macroeconomic volatility often triggers funding drought, forcing vulnerable companies toward near-total liquidations. Public companies and those with >$1B in funding tend to have lower percentages (often 10%–20%) despite accounting for the highest absolute headcount losses.
   

      <img width="600" height="400" alt="image" src="https://github.com/user-attachments/assets/b1a31f0d-db61-470e-a958-0c6fc608235e" />




6. **Outliers**: The dataset identifies several significant outliers within the Big Tech sector, where single-day events exceeded 10,000 layoffs These outliers were treated as valid data points reflecting the volatile 'post-pandemic correction' phase." The observation that the mean is greater than the median suggests a right-skewed distribution, driven by several extremely large layoff events.


      <img width="600" height="400" alt="image" src="https://github.com/user-attachments/assets/0461ab10-4ab5-4906-93fd-f0901b9444a1" />


## 🚀 Recommendations:
1. Hiring Strategy:
   * Recommendation 1: Companies should reserve hiring budgets during Q1/ Q2 and focus on Q3 to onboard high-performing full-time talent while reallocating capital from cost centers to revenue centers.
   * Recommendation 2: Companies should consider shifting toward more flexible contract_based staffing.

3. Risk Management:
   * Recommendation: Venture Capital and Private Equity firms must implement more rigorous due diligence and stricter "Capital Efficiency" benchmarks for early-stage startups, as these ventures exhibit heightened sensitivity to macroeconomic shifts and carry a disproportionate risk of failure.
  
## 📈Dashboard

<img width="1414" height="780" alt="image" src="https://github.com/user-attachments/assets/942a4046-b6e0-4d7c-b962-d9c80d4ecbbf" />


## 🛠️Tools & Technologies Used
1.  Database: SQL (SQL Server) 
2.  Power BI: Dashboard, data visualization.
3.  Dataset Source: Kaggle
