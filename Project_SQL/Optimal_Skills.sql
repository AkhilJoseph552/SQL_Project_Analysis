/*
What are the most optimal skills to learn (aka it's in high demand and a high-paying skill)?
- Identify skills in high demand and associated with high average salaries for Data Analyst roles
- Concentrates on remote positions with specified salaries
- Why? Targets skills that offer job security (high demand) and financial benefits (high salaries),
  offering strategic insights for career development in data analysis
*/

with skill_demand AS (
    SELECT 
    skills_dim.skill_id,
    skills, 
        count(skills_job_dim.job_id) as demand_count
    from job_postings_fact
    INNER JOIN skills_job_dim ON job_postings_fact.job_id = skills_job_dim.job_id
    INNER JOIN skills_dim on skills_job_dim.skill_id = skills_dim.skill_id
    where job_title_short = 'Data Analyst' and job_work_from_home = TRUE and salary_year_avg IS NOT NULL
    GROUP BY skills_dim.skill_id
),
 avg_salary_skills as (
    SELECT
    skills_dim.skill_id,
    round(avg(salary_year_avg),2) as average_salary
    from job_postings_fact
    INNER JOIN skills_job_dim ON job_postings_fact.job_id = skills_job_dim.job_id
    INNER JOIN skills_dim on skills_job_dim.skill_id = skills_dim.skill_id
    where job_title_short = 'Data Analyst' and salary_year_avg IS NOT NULL and job_work_from_home = TRUE
    GROUP BY skills_dim.skill_id
)

select skill_demand.skill_id,
skill_demand.skills,
demand_count,
average_salary
from  skill_demand
inner join avg_salary_skills on skill_demand.skill_id = avg_salary_skills.skill_id
WHERE demand_count > 10
ORDER BY 
average_salary DESC,
demand_count DESC
LIMIT 25

    
