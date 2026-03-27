--Create staging table

--SELECT * INTO stg_layoffs FROM layoffs;


-- DATA CLEANING

-- Remove duplicates

WITH duplicate_check AS (
SELECT *,
		ROW_NUMBER() OVER(PARTITION BY company, location, total_laid_off, date, 
		percentage_laid_off ORDER BY company) AS row_num
FROM stg_layoffs
)

DELETE FROM duplicate_check
WHERE row_num > 1;

--Standardizing data

UPDATE stg_layoffs
SET company = 'Built Technologies'
WHERE company LIKE 'Built Technologies%'

UPDATE stg_layoffs
SET location = REPLACE(location, ', Non-U.S.', '')
WHERE location LIKE '%, Non-U.S.';

-- Delete recordes where both total_laid_off and percentage_laid_off are null

DELETE
FROM stg_layoffs 
where total_laid_off is null and  percentage_laid_off is null;

-- Update missing country name

UPDATE stg_layoffs  
SET country = CASE 
    WHEN location like 'Montreal%' THEN 'Canada'
    WHEN location like 'Berlin%' THEN 'Germany'
    END 
WHERE country IS NULL OR country = '';

--Replace null value on text columns to 'Unknown'

UPDATE stg_layoffs
SET location = 'Unknown'
WHERE location IS NULL;

UPDATE stg_layoffs
SET industry = 'Unknown'
WHERE industry IS NULL;

UPDATE stg_layoffs
SET stage = 'Unknown'
WHERE stage IS NULL;



-- EDA

-- Top 10 Countries with most total layoffs over time

SELECT TOP 10 country, SUM(total_laid_off) AS total_layoff
FROM stg_layoffs
GROUP BY country
HAVING SUM(total_laid_off) IS NOT NULL
ORDER BY total_layoff DESC;

-- Top 10 industries with most total layoffs over time

SELECT TOP 10 industry, SUM(total_laid_off) AS total_layoff
FROM stg_layoffs
GROUP BY industry
HAVING SUM(total_laid_off) IS NOT NULL
ORDER BY total_layoff DESC;

-- Which cities in the United States or Canada are the "hotspots" for job losses?

WITH city_rank AS (
SELECT  YEAR(date) as layoff_year, country, 
        location, 
        SUM(total_laid_off) AS total_layoff,
        DENSE_RANK() OVER(PARTITION BY YEAR(date) ORDER BY SUM(total_laid_off) DESC) AS rank
FROM stg_layoffs
WHERE country in ('United States', 'Canada')
GROUP BY country, YEAR(date), location
HAVING SUM(total_laid_off) IS NOT NULL
)

SELECT layoff_year, country, location,total_layoff
FROM city_rank
WHERE rank <= 5;

-- Top industries with the most layoffs each year

WITH industry_rank AS (
SELECT  YEAR(date) as layoff_year, industry, SUM(total_laid_off) AS total_layoff,
        DENSE_RANK() OVER(PARTITION BY YEAR(date) ORDER BY SUM(total_laid_off) DESC) AS rank
FROM stg_layoffs
GROUP BY industry, YEAR(date)
HAVING SUM(total_laid_off) IS NOT NULL
)

SELECT layoff_year, industry, total_layoff, rank
FROM industry_rank
WHERE rank <= 5;

-- Top 5 companies in United States with most layoffs each year

WITH company_rank AS (
SELECT  YEAR(date) as layoff_year, country, company, SUM(total_laid_off) AS total_layoff,
        DENSE_RANK() OVER(PARTITION BY YEAR(date) ORDER BY SUM(total_laid_off) DESC) 
        AS company_rank
FROM stg_layoffs
WHERE country = 'United States'
GROUP BY country, YEAR(date), company
HAVING SUM(total_laid_off) IS NOT NULL
)

SELECT layoff_year, country, company, total_layoff, company_rank
FROM company_rank
WHERE company_rank <= 5;

-- Which year had the highest total layoffs? 

SELECT SUM(total_laid_off) AS total_layoff, YEAR( date) AS layoff_year
FROM stg_layoffs
GROUP BY YEAR( date)
HAVING SUM(total_laid_off) IS NOT NULL
ORDER BY SUM(total_laid_off) DESC;

-- Is there a specific quarter in the year where layoffs spike? 

WITH qtr_rank_cte AS (
SELECT  YEAR(date) as layoff_year, 
        datepart(quarter, date) as layoff_qtr, country, 
        SUM(total_laid_off) AS total_layoff,
        DENSE_RANK() OVER(PARTITION BY YEAR(date) ORDER BY SUM(total_laid_off) DESC) 
        AS qtr_rank
FROM stg_layoffs
WHERE country = 'United States'
GROUP BY country, YEAR(date), datepart(quarter, date)
HAVING SUM(total_laid_off) IS NOT NULL
)

SELECT layoff_year, layoff_qtr, country, total_layoff
FROM qtr_rank_cte
WHERE qtr_rank = 1;


-- What is the rolling total of layoffs in United States over time?

WITH rolling_layoffs AS (
SELECT country, YEAR( date) AS layoff_year, 
                SUM(total_laid_off) AS total_layoff
FROM stg_layoffs
WHERE country = 'United States'
GROUP BY country, YEAR( date)
HAVING SUM(total_laid_off) IS NOT NULL
)

SELECT country, layoff_year, total_layoff,
       SUM(total_layoff) OVER(ORDER BY layofF_year ASC) AS rolling_total
FROM rolling_layoffs
ORDER BY layoff_year ASC;



-- Which industries saw the most company closures? (percentage_laid_off = 1)

SELECT industry, COUNT(company) as num_closure
FROM stg_layoffs
WHERE percentage_laid_off = 1
GROUP BY industry
ORDER BY COUNT(company) DESC;


-- Is there a correlation between funds_raised and total_laid_off?

SELECT
      CASE WHEN funds_raised < 100 THEN 'Low Funding'
           WHEN funds_raised BETWEEN 100 AND 1000 THEN 'Medium Funding'
           WHEN funds_raised >1000 THEN 'High Funding'
           END AS funding_tier,
            ROUND(AVG(total_laid_off),2)  AS avg_layoffs,
            SUM(total_laid_off) AS total_layoffs,
            Count(company) as total_companies
FROM stg_layoffs
WHERE funds_raised IS NOT NULL 
GROUP BY 
        CASE 
        WHEN funds_raised < 100 THEN 'Low Funding'
        WHEN funds_raised BETWEEN 100 AND 1000 THEN 'Medium Funding'
        WHEN funds_raised > 1000 THEN 'High Funding'
    END
ORDER BY AVG(total_laid_off) DESC;

SELECT 
    (COUNT(*) * SUM(funds_raised * total_laid_off) - SUM(funds_raised) * SUM(total_laid_off)) / 
    NULLIF(SQRT(
        (COUNT(*) * SUM(SQUARE(funds_raised)) - SQUARE(SUM(funds_raised))) * 
        (COUNT(*) * SUM(SQUARE(total_laid_off)) - SQUARE(SUM(total_laid_off)))
    ), 0) AS correlation_coefficient
FROM stg_layoffs
WHERE funds_raised IS NOT NULL AND total_laid_off IS NOT NULL;

-- Funds_raised vs percentage_laid_off

SELECT 
    (COUNT(*) * SUM(funds_raised * percentage_laid_off) - SUM(funds_raised) * SUM(percentage_laid_off)) / 
    NULLIF(SQRT(
        (COUNT(*) * SUM(POWER(funds_raised, 2)) - POWER(SUM(funds_raised), 2)) * (COUNT(*) * SUM(POWER(percentage_laid_off, 2)) - POWER(SUM(percentage_laid_off), 2))
    ), 0) AS correlation_funding_vs_percentage
FROM stg_layoffs
WHERE funds_raised IS NOT NULL 
  AND percentage_laid_off IS NOT NULL;

-- What is the average percentage_laid_off across different company stages (e.g., Seed vs. Post-IPO)?

SELECT stage, ROUND(AVG(percentage_laid_off),2) AS avg_pct_layoff, ROUND(SUM(funds_raised),2) as funding
FROM stg_layoffs
WHERE stage IS NOT NULL
GROUP BY stage
ORDER BY ROUND(AVG(percentage_laid_off),2) DESC;

-- Identify outliers

WITH Quartiles AS (
    SELECT 
        PERCENTILE_CONT(0.25) WITHIN GROUP (ORDER BY total_laid_off) OVER () AS Q1,
        PERCENTILE_CONT(0.75) WITHIN GROUP (ORDER BY total_laid_off) OVER () AS Q3
    FROM stg_layoffs
    WHERE total_laid_off IS NOT NULL
),
Bounds AS (
    SELECT DISTINCT
        Q1,
        Q3,
        (Q3 - Q1) AS IQR,
        (Q1 - 1.5 * (Q3 - Q1)) AS lower_Bound,
        (Q3 + 1.5 * (Q3 - Q1)) AS upper_Bound
    FROM Quartiles
)

/*SELECT COUNT(company) AS outlier_count, 
        (select count(*) from stg_layoffs) as total_count,
        100.0*COUNT(company)/(select count(*) from stg_layoffs) as outlier_pct
FROM stg_layoffs
CROSS JOIN Bounds
WHERE total_laid_off > Upper_Bound;*/
 
       
SELECT company, total_laid_off, industry, Upper_Bound
FROM stg_layoffs
CROSS JOIN Bounds
WHERE total_laid_off > Upper_Bound
ORDER BY total_laid_off DESC;
