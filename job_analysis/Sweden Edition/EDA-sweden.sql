
SELECT
    skills_dim.skills,
    COUNT(job_postings_fact.job_id) AS total_jobs
FROM
    job_postings_fact
INNER JOIN skills_job_dim ON skills_job_dim.job_id = job_postings_fact.job_id
INNER JOIN skills_dim ON skills_dim.skill_id = skills_job_dim.skill_id
WHERE
    job_country = 'Sweden'
GROUP BY
    skills_dim.skills
ORDER BY
    total_jobs DESC;

SELECT
    job_title_short,
    ROUND(AVG(salary_year_avg)) AS salary,
    COUNT(job_id) AS total_jobs
FROM
    job_postings_fact
WHERE
    job_country = 'Sweden'
GROUP BY
    job_title_short
ORDER BY
    total_jobs DESC;

SELECT
    EXTRACT(HOUR FROM job_posted_date) AS hour,
    COUNT(job_id) AS total_jobs
FROM
    job_postings_fact
WHERE
    job_country = 'Sweden'
GROUP BY
    hour;

WITH skill_counts AS (
    SELECT
        job_title_short,
        skills_dim.skills,
        COUNT(job_postings_fact.job_id) AS total_jobs
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
        ROW_NUMBER() OVER(PARTITION BY job_title_short ORDER BY total_jobs DESC) AS rank
    FROM
        skill_counts
)

SELECT
    *
FROM
    ranked_skills
WHERE
    rank <= 5;