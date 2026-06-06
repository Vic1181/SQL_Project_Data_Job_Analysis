/* 
-Add the specific skills needed for these top paying roles
*/



WITH top_paying_jobs AS (
    SELECT
    j.job_id,
    j.job_title,
    c.name AS company_name,
    j.salary_year_avg
FROM
    job_postings_fact AS j
LEFT JOIN 
    company_dim AS c
ON 
    j.company_id = c.company_id
WHERE
    job_title_short = 'Data Analyst' AND job_location = 'Anywhere' AND salary_year_avg IS NOT NULL
ORDER BY 
    salary_year_avg DESC
LIMIT 
    10
)

SELECT 
    top_paying_jobs.*,
    skills
FROM top_paying_jobs
INNER JOIN skills_job_dim 
ON top_paying_jobs.job_id = skills_job_dim.job_id
INNER JOIN skills_dim 
ON skills_job_dim.skill_id = skills_dim.skill_id
ORDER BY
    salary_year_avg DESC;
