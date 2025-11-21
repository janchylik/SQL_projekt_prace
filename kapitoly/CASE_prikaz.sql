SELECT
    job_title_short,
    job_location
FROM
job_postings_fact;


SELECT
    job_title_short,
    CASE
        WHEN job_location = 'Anywhere' THEN 'Remote'
        WHEN job_location = 'New York, NY' THEN 'Local'
        ELSE 'Onsite'
    END AS location_category,
    COUNT (job_id) AS number_of_jobs
FROM 
    job_postings_fact
WHERE
    job_title_short = 'Data Analyst'
GROUP BY 
    job_title_short,
    location_category
ORDER BY
    job_title_short,
    number_of_jobs DESC;

