-- spojeni 2 nebo vice SELECT prikazu
-- musi mit stejny pocet sloupcu, stejny datovy typ

SELECT
    job_title_short,
    company_id,
    job_location
FROM
    leden_prace

UNION
-- spojeni s mesicem unor
SELECT
    job_title_short,
    company_id,
    job_location
FROM
    unor_prace

UNION
-- spojeni s mesicem brezen
SELECT
    job_title_short,
    company_id,
    job_location
FROM
    brezen_prace;


-- UNION ALL
-- zapojuje duplikaty

SELECT
    job_title_short,
    company_id,
    job_location
FROM
    leden_prace

UNION ALL
-- spojeni s mesicem unor
SELECT
    job_title_short,
    company_id,
    job_location
FROM
    unor_prace

UNION ALL
-- spojeni s mesicem brezen
SELECT
    job_title_short,
    company_id,
    job_location
FROM
    brezen_prace;

--Practice problem

SELECT 
    q1_job_postings.job_title_short,
    q1_job_postings.job_location,
    q1_job_postings.job_via,
    q1_job_postings.job_posted_date::DATE,
    q1_job_postings.salary_year_avg
FROM (
    SELECT * 
    FROM leden_prace
    UNION ALL
    SELECT *
    FROM unor_prace
    UNION ALL
    SELECT *
    FROM brezen_prace
) AS q1_job_postings
WHERE 
    q1_job_postings.salary_year_avg > 70000 AND
    q1_job_postings.job_title_short = 'Data Analyst'
ORDER BY 
    q1_job_postings.salary_year_avg DESC;
