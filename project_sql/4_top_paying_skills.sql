WITH top_skills AS (
SELECT
    job_postings_fact.job_id,
    skill_id,
    salary_year_avg
FROM job_postings_fact
LEFT JOIN skills_job_dim ON job_postings_fact.job_id = skills_job_dim.job_id
WHERE 
    job_title_short = 'Data Analyst' AND 
    job_location = 'Anywhere' AND
    salary_year_avg IS NOT NULL
)

SELECT
    skills,
    ROUND(AVG(salary_year_avg),0) AS total_salary
FROM top_skills
LEFT JOIN skills_dim ON top_skills.skill_id = skills_dim.skill_id
GROUP BY
    skills
ORDER BY
    total_salary DESC
LIMIT 5;  