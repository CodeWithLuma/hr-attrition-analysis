-- Employee Attrition Analysis — IBM HR Analytics dataset
-- SQLite-compatible. Table: hr_attrition (one row per employee),
-- with the dataset's own column names, e.g. Attrition ('Yes'/'No'),
-- Department, JobRole, OverTime ('Yes'/'No'), MonthlyIncome,
-- YearsAtCompany, PerformanceRating.
--
-- Note on the data: this dataset is simulated data created by IBM for
-- education and analysis practice, not a real company's workforce.

-- 1. Overall attrition rate
-- Expected: 237 of 1,470 left, 16.1%.
SELECT
    COUNT(*) AS employees,
    SUM(CASE WHEN Attrition = 'Yes' THEN 1 ELSE 0 END) AS left_count,
    ROUND(100.0 * SUM(CASE WHEN Attrition = 'Yes' THEN 1 ELSE 0 END) / COUNT(*), 1) AS attrition_rate_pct
FROM hr_attrition;

-- 2. Attrition by department
SELECT
    Department,
    COUNT(*) AS employees,
    SUM(CASE WHEN Attrition = 'Yes' THEN 1 ELSE 0 END) AS left_count,
    ROUND(100.0 * SUM(CASE WHEN Attrition = 'Yes' THEN 1 ELSE 0 END) / COUNT(*), 1) AS attrition_rate_pct
FROM hr_attrition
GROUP BY Department
ORDER BY attrition_rate_pct DESC;

-- 3. Attrition by overtime
SELECT
    OverTime,
    COUNT(*) AS employees,
    SUM(CASE WHEN Attrition = 'Yes' THEN 1 ELSE 0 END) AS left_count,
    ROUND(100.0 * SUM(CASE WHEN Attrition = 'Yes' THEN 1 ELSE 0 END) / COUNT(*), 1) AS attrition_rate_pct
FROM hr_attrition
GROUP BY OverTime;

-- 4. Attrition by job role
SELECT
    JobRole,
    COUNT(*) AS employees,
    SUM(CASE WHEN Attrition = 'Yes' THEN 1 ELSE 0 END) AS left_count,
    ROUND(100.0 * SUM(CASE WHEN Attrition = 'Yes' THEN 1 ELSE 0 END) / COUNT(*), 1) AS attrition_rate_pct
FROM hr_attrition
GROUP BY JobRole
ORDER BY attrition_rate_pct DESC;

-- 5. Average monthly income: leavers vs stayers
-- Expected: leavers $4,787, stayers $6,832, overall average $6,503.
SELECT
    Attrition,
    COUNT(*) AS employees,
    ROUND(AVG(MonthlyIncome), 0) AS avg_monthly_income
FROM hr_attrition
GROUP BY Attrition;

-- 6. Attrition by years at the company (tenure band)
SELECT
    CASE
        WHEN YearsAtCompany <= 2 THEN '0-2 years'
        WHEN YearsAtCompany <= 5 THEN '3-5 years'
        WHEN YearsAtCompany <= 10 THEN '6-10 years'
        WHEN YearsAtCompany <= 20 THEN '11-20 years'
        ELSE '20+ years'
    END AS tenure_band,
    COUNT(*) AS employees,
    SUM(CASE WHEN Attrition = 'Yes' THEN 1 ELSE 0 END) AS left_count,
    ROUND(100.0 * SUM(CASE WHEN Attrition = 'Yes' THEN 1 ELSE 0 END) / COUNT(*), 1) AS attrition_rate_pct
FROM hr_attrition
GROUP BY tenure_band
ORDER BY MIN(YearsAtCompany);
