
-- SubQuerry

SELECT 
    company_id,
    name AS company_name  
FROM company_dim
WHERE company_id IN (
    SELECT 
        company_id
    FROM
        job_postings_fact
    WHERE
        job_no_degree_mention = true
    ORDER BY company_id
);

-- CTEs - common table expressions 
WITH company_job_count AS (--vytvoření dočasné tabulky
SELECT
    company_id,
    COUNT (*) AS total_jobs
FROM
    job_postings_fact
GROUP BY 
    company_id
)

SELECT --spojeni CTE s nasim querry co chceme zjistovat
    company_dim.name AS company_name,
    total_jobs
FROM company_dim
LEFT JOIN company_job_count
    ON company_job_count.company_id = company_dim.company_id
ORDER BY total_jobs DESC;

-- Practice problem
/* FInd the count of the number of remote job postings per skill
    - Display the top 5 skills by their demand in remote jobs
    - include skill ID, name and count of postings requiring the skills
*/

-- count pro kazdy 1 skill
WITH remote_job_skills AS (
SELECT 
    skill_id,
    COUNT(*) AS skill_count
FROM 
    skills_job_dim AS skills_to_job
INNER JOIN job_postings_fact AS job_postings
    ON skills_to_job.job_id = job_postings.job_id
WHERE 
    job_postings.job_work_from_home = true AND
    job_postings.job_title_short = 'Data Analyst'
GROUP BY skill_id
)
-- spojeni skill_id s nazvy skillu a nasledne vybrani nejvice objevovanych
SELECT 
    skill.skill_id,
    skills AS skill_name,
    skill_count
FROM remote_job_skills
INNER JOIN skills_dim AS skill
    ON remote_job_skills.skill_id = skill.skill_id
ORDER BY skill_count DESC
LIMIT 10;