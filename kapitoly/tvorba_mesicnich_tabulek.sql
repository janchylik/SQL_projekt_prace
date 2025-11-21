SELECT *
FROM job_postings_fact
LIMIT 10;

-- leden
CREATE TABLE leden_prace AS 
    SELECT *
    FROM job_postings_fact
    WHERE EXTRACT(MONTH FROM job_posted_date) = 1;

-- únor
CREATE TABLE unor_prace AS
    SELECT *
    FROM job_postings_fact
    WHERE EXTRACT(MONTH FROM job_posted_date) = 2;

--březen
CREATE TABLE brezen_prace AS
    SELECT *
    FROM job_postings_fact
    WHERE EXTRACT(MONTH FROM job_posted_date) = 3;


