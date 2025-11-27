-- Top skills demanded for Data Analyst jobs in remote locations

WITH top_skills AS (
SELECT
    job_postings_fact.job_id,
    skill_id
FROM job_postings_fact
LEFT JOIN skills_job_dim ON job_postings_fact.job_id = skills_job_dim.job_id
WHERE 
    job_title_short = 'Data Analyst' AND 
    job_location = 'Anywhere' AND
    salary_year_avg IS NOT NULL
)

SELECT
    top_skills.skill_id,
    skills,
    COUNT(*) AS total_jobs
FROM top_skills
LEFT JOIN skills_dim ON top_skills.skill_id = skills_dim.skill_id
GROUP BY
    skills,top_skills.skill_id
ORDER BY
    total_jobs DESC
LIMIT 5;           
