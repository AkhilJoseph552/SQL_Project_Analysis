/*
 What are the top skills based on salary?
- Look at the average salary associated with each skill for Data Analyst positions
- Focuses on roles with specified salaries, regardless of location
- Why? It reveals how different skills impact salary levels for Data Analysts and 
  helps identify the most financially rewarding skills to acquire or improve
*/

SELECT
    skills,
    round(avg(salary_year_avg),2) as average_salary
from job_postings_fact
INNER JOIN skills_job_dim ON job_postings_fact.job_id = skills_job_dim.job_id
INNER JOIN skills_dim on skills_job_dim.skill_id = skills_dim.skill_id
where job_title_short = 'Data Analyst' and salary_year_avg IS NOT NULL and job_work_from_home = TRUE
GROUP BY skills
ORDER BY average_salary DESC
LIMIT 25

/* BreakDown results for the query

- Big Data & Analytical Processing: Analysts command top salaries by mastering large-scale data tools (PySpark, Couchbase) and core engineering libraries (Pandas, NumPy).
- DevOps & Lifecycle Infrastructure: High compensation goes to professionals managing development workflows (Bitbucket, GitLab) and containerized infrastructure (Kubernetes).
- Cloud & Platform Engineering: Specialized knowledge in cloud ecosystems (GCP, Databricks) and enterprise search systems (Elasticsearch) yields premium financial returns.

*/
