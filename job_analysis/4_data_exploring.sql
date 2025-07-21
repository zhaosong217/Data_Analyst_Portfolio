-- general looks like
SELECT *
FROM
    job_postings_fact
LIMIT 5;

-- total jobs
SELECT
    COUNT(job_id)
FROM
    job_postings_fact;

-- total companies
SELECT
    COUNT(DISTINCT(job_postings_fact.company_id)) AS total_companies
FROM
    job_postings_fact;

-- total jobs posted by each country
SELECT
    job_country,
    COUNT(job_id) AS total_jobs
FROM
    job_postings_fact
GROUP BY
    job_country
ORDER BY
    total_jobs DESC;

-- job posting platforms
SELECT
    job_via,
    COUNT(job_via) AS job_count
FROM
    job_postings_fact
GROUP BY
    job_via
ORDER BY
    job_count DESC;

-- the distribution of postings for each month
SELECT
    EXTRACT(MONTH FROM job_posted_date) as postings_month,
    COUNT(job_id) AS total_jobs
FROM
    job_postings_fact
WHERE
    job_country = 'Sweden' AND
    EXTRACT(YEAR FROM job_posted_date) = 2023
GROUP BY
    EXTRACT(MONTH FROM job_posted_date)

-- the distribution of postings for each hour
SELECT
    EXTRACT(HOUR FROM job_posted_date) as Hour,
    COUNT(job_id) AS Jobs_posted_by_hour
FROM
    job_postings_fact
WHERE
    job_country = 'Sweden'
GROUP BY
    Hour;

-- job schedule types
SELECT
    job_types,
    COUNT(*) AS job_count
FROM (
    SELECT
        CASE
            WHEN job_schedule_type LIKE '%Full-time%' THEN 'Full-time'
            WHEN job_schedule_type LIKE '%Part-time%' THEN 'Part-time'
            WHEN job_schedule_type LIKE '%Internship%' THEN 'Internship'
            WHEN job_schedule_type LIKE '%Temp work%' THEN 'Temp work'
            ELSE 'Others'
        END AS job_types
    FROM
        job_postings_fact
) AS sub
GROUP BY
    job_types
ORDER BY
    job_count DESC;

-- jobs by position
SELECT
    job_title_short,
    COUNT(*) AS position_count
FROM
    job_postings_fact
GROUP BY
    job_title_short
ORDER BY
    position_count DESC;

-- average yearly salary by position
SELECT
    job_title_short,
    ROUND(AVG(salary_year_avg)) AS average_yearly_salary
FROM
    job_postings_fact
GROUP BY
    job_title_short
ORDER BY
    average_yearly_salary DESC;

-- top5 skills by each position and total jobs posting
WITH skill_counts AS (
    SELECT
        job_title_short,
        skills_dim.skills,
        COUNT(skills_job_dim.job_id) AS total_jobs
    FROM
        job_postings_fact
    INNER JOIN skills_job_dim ON skills_job_dim.job_id = job_postings_fact.job_id
    INNER JOIN skills_dim ON skills_dim.skill_id = skills_job_dim.skill_id
    WHERE
        job_country = 'Sweden'
    GROUP BY
        job_title_short,
        skills_dim.skills
),
ranked_skills AS (
    SELECT
        job_title_short,
        skills,
        total_jobs,
        ROW_NUMBER() OVER (PARTITION BY job_title_short ORDER BY total_jobs DESC) AS skill_rank
    FROM skill_counts
)
SELECT
    job_title_short,
    skills,
    total_jobs
FROM
    ranked_skills
WHERE
    skill_rank <= 5
ORDER BY
    job_title_short,
    skill_rank;

-- top5 skills by each position and salary
WITH skill_salary AS (
    SELECT
        job_title_short,
        skills_dim.skills,
        ROUND(AVG(salary_year_avg)) AS salary
    FROM
        job_postings_fact
    INNER JOIN skills_job_dim ON skills_job_dim.job_id = job_postings_fact.job_id
    INNER JOIN skills_dim ON skills_dim.skill_id = skills_job_dim.skill_id
    WHERE
        salary_year_avg IS NOT NULL
    GROUP BY
        job_title_short,
        skills_dim.skills
),

ranked_skills AS (
    SELECT
        job_title_short,
        skills,
        salary,
        ROW_NUMBER() OVER(PARTITION BY job_title_short ORDER BY salary DESC) as rank
    FROM
        skill_salary
)

SELECT
    job_title_short,
    skills,
    salary
FROM
    ranked_skills
WHERE
    rank <= 5
ORDER BY
    job_title_short,
    salary DESC


-- top 10 companies of posting
SELECT
    name,
    job_country,
    COUNT(job_id) AS position_count
FROM
    job_postings_fact
INNER JOIN company_dim ON company_dim.company_id = job_postings_fact.company_id
GROUP BY
    job_country,
    name
ORDER BY
    position_count DESC
LIMIT 11;

-- The most popular job posting platform
SELECT
    job_via,
    COUNT(job_id) AS total_jobs
FROM
    job_postings_fact
WHERE
    job_country = 'Sweden'
GROUP BY
    job_via
ORDER BY
    total_jobs DESC
LIMIT 10;

-- top skills in Data Analyst position
SELECT
    skills_dim.skills,
    COUNT(job_postings_fact.job_id) AS total_jobs
FROM
    job_postings_fact
INNER JOIN skills_job_dim ON skills_job_dim.job_id = job_postings_fact.job_id
INNER JOIN skills_dim ON skills_dim.skill_id = skills_job_dim.skill_id
WHERE
    job_country = 'Sweden' AND
    job_title_short = 'Data Analyst'
GROUP BY
    skills_dim.skills
ORDER BY
    total_jobs DESC
LIMIT 5;

-- top postings by companies in Data Analyst position
-- ⚠️As lots of salary data in Sweden is missing, this query 
-- shows the global situation
SELECT
    company_dim.name,
    job_country,
    ROUND(AVG(salary_year_avg)) as salary,
    COUNT(job_postings_fact.job_id) as total_jobs
FROM
    job_postings_fact
INNER JOIN company_dim ON company_dim.company_id = job_postings_fact.company_id
WHERE
    salary_year_avg IS NOT NULL AND
    -- job_country = 'Sweden' AND
    job_title_short = 'Data Analyst'
GROUP BY
    company_dim.name,
    job_country
ORDER BY
    salary DESC,
    total_jobs DESC;

