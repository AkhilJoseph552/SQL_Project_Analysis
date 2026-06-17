/*
Question: What skills are required for the top-paying data analyst jobs?

- Use the top 10 highest-paying Data Analyst roles that are available remotely.
- Add the specific skills required for these roles
- Why? It provides a detailed look at which high-paying jobs demand certain skills, 
- helping job seeker understand which skills to develop that align with top salaries. 
*/

                            WITH top_paying_jobs AS (
                            SELECT 
                                job_id,
                                job_title,
                                salary_year_avg,
                                name as company_name 
                            FROM
                                job_postings_fact
                            LEFT JOIN company_dim ON job_postings_fact.company_id = company_dim.company_id
                            where 
                                job_title = 'Data Analyst' AND 
                                job_location = 'Anywhere' And 
                                salary_year_avg IS NOT NULL
                            ORDER BY 
                                salary_year_avg DESC
                            LIMIT 10
                            )

                            SELECT *, skills from top_paying_jobs
                            INNER JOIN skills_job_dim on 
                            top_paying_jobs.job_id = skills_job_dim.job_id
                            INNER JOIN skills_dim ON
                            skills_job_dim.skill_id = skills_dim.skill_id
                            ORDER BY salary_year_avg DESC

     /*Python is the clear leader, appearing in 7 of the highest-paying roles.
SQL is nearly universal, showing up in 6 roles.
R remains highly valued in analytics-focused positions.
Visualization tools (Looker, Tableau, Power BI) collectively appear frequently, reinforcing the importance of communicating insights.
Cloud skills (AWS) and data libraries (Pandas) are common differentiators in higher-paying positions.

[
  {
    "job_id": 1246069,
    "job_title": "Data Analyst",
    "salary_year_avg": "165000.0",
    "company_name": "Plexus Resource Solutions",
    "job_id (1)": 1246069,
    "skill_id": 1,
    "skill_id (1)": 1,
    "skills": "python",
    "type": "programming",
    "skills (1)": "python"
  },
  {
    "job_id": 1246069,
    "job_title": "Data Analyst",
    "salary_year_avg": "165000.0",
    "company_name": "Plexus Resource Solutions",
    "job_id (1)": 1246069,
    "skill_id": 56,
    "skill_id (1)": 56,
    "skills": "mysql",
    "type": "databases",
    "skills (1)": "mysql"
  },
  {
    "job_id": 1246069,
    "job_title": "Data Analyst",
    "salary_year_avg": "165000.0",
    "company_name": "Plexus Resource Solutions",
    "job_id (1)": 1246069,
    "skill_id": 76,
    "skill_id (1)": 76,
    "skills": "aws",
    "type": "cloud",
    "skills (1)": "aws"
  },
  {
    "job_id": 712473,
    "job_title": "Data Analyst",
    "salary_year_avg": "165000.0",
    "company_name": "Get It Recruit - Information Technology",
    "job_id (1)": 712473,
    "skill_id": 0,
    "skill_id (1)": 0,
    "skills": "sql",
    "type": "programming",
    "skills (1)": "sql"
  },
  {
    "job_id": 712473,
    "job_title": "Data Analyst",
    "salary_year_avg": "165000.0",
    "company_name": "Get It Recruit - Information Technology",
    "job_id (1)": 712473,
    "skill_id": 1,
    "skill_id (1)": 1,
    "skills": "python",
    "type": "programming",
    "skills (1)": "python"
  },
  {
    "job_id": 712473,
    "job_title": "Data Analyst",
    "salary_year_avg": "165000.0",
    "company_name": "Get It Recruit - Information Technology",
    "job_id (1)": 712473,
    "skill_id": 5,
    "skill_id (1)": 5,
    "skills": "r",
    "type": "programming",
    "skills (1)": "r"
  },
  {
    "job_id": 712473,
    "job_title": "Data Analyst",
    "salary_year_avg": "165000.0",
    "company_name": "Get It Recruit - Information Technology",
    "job_id (1)": 712473,
    "skill_id": 7,
    "skill_id (1)": 7,
    "skills": "sas",
    "type": "programming",
    "skills (1)": "sas"
  },
  {
    "job_id": 712473,
    "job_title": "Data Analyst",
    "salary_year_avg": "165000.0",
    "company_name": "Get It Recruit - Information Technology",
    "job_id (1)": 712473,
    "skill_id": 15,
    "skill_id (1)": 15,
    "skills": "matlab",
    "type": "programming",
    "skills (1)": "matlab"
  },
  {
    "job_id": 712473,
    "job_title": "Data Analyst",
    "salary_year_avg": "165000.0",
    "company_name": "Get It Recruit - Information Technology",
    "job_id (1)": 712473,
    "skill_id": 93,
    "skill_id (1)": 93,
    "skills": "pandas",
    "type": "libraries",
    "skills (1)": "pandas"
  },
  {
    "job_id": 712473,
    "job_title": "Data Analyst",
    "salary_year_avg": "165000.0",
    "company_name": "Get It Recruit - Information Technology",
    "job_id (1)": 712473,
    "skill_id": 182,
    "skill_id (1)": 182,
    "skills": "tableau",
    "type": "analyst_tools",
    "skills (1)": "tableau"
  },
  {
    "job_id": 712473,
    "job_title": "Data Analyst",
    "salary_year_avg": "165000.0",
    "company_name": "Get It Recruit - Information Technology",
    "job_id (1)": 712473,
    "skill_id": 185,
    "skill_id (1)": 185,
    "skills": "looker",
    "type": "analyst_tools",
    "skills (1)": "looker"
  },
  {
    "job_id": 712473,
    "job_title": "Data Analyst",
    "salary_year_avg": "165000.0",
    "company_name": "Get It Recruit - Information Technology",
    "job_id (1)": 712473,
    "skill_id": 186,
    "skill_id (1)": 186,
    "skills": "sas",
    "type": "analyst_tools",
    "skills (1)": "sas"
  },
  {
    "job_id": 456042,
    "job_title": "Data Analyst",
    "salary_year_avg": "151500.0",
    "company_name": "Get It Recruit - Healthcare",
    "job_id (1)": 456042,
    "skill_id": 0,
    "skill_id (1)": 0,
    "skills": "sql",
    "type": "programming",
    "skills (1)": "sql"
  },
  {
    "job_id": 456042,
    "job_title": "Data Analyst",
    "salary_year_avg": "151500.0",
    "company_name": "Get It Recruit - Healthcare",
    "job_id (1)": 456042,
    "skill_id": 1,
    "skill_id (1)": 1,
    "skills": "python",
    "type": "programming",
    "skills (1)": "python"
  },
  {
    "job_id": 456042,
    "job_title": "Data Analyst",
    "salary_year_avg": "151500.0",
    "company_name": "Get It Recruit - Healthcare",
    "job_id (1)": 456042,
    "skill_id": 5,
    "skill_id (1)": 5,
    "skills": "r",
    "type": "programming",
    "skills (1)": "r"
  },
  {
    "job_id": 405581,
    "job_title": "Data Analyst",
    "salary_year_avg": "145000.0",
    "company_name": "CyberCoders",
    "job_id (1)": 405581,
    "skill_id": 1,
    "skill_id (1)": 1,
    "skills": "python",
    "type": "programming",
    "skills (1)": "python"
  },
  {
    "job_id": 405581,
    "job_title": "Data Analyst",
    "salary_year_avg": "145000.0",
    "company_name": "CyberCoders",
    "job_id (1)": 405581,
    "skill_id": 4,
    "skill_id (1)": 4,
    "skills": "java",
    "type": "programming",
    "skills (1)": "java"
  },
  {
    "job_id": 405581,
    "job_title": "Data Analyst",
    "salary_year_avg": "145000.0",
    "company_name": "CyberCoders",
    "job_id (1)": 405581,
    "skill_id": 5,
    "skill_id (1)": 5,
    "skills": "r",
    "type": "programming",
    "skills (1)": "r"
  },
  {
    "job_id": 405581,
    "job_title": "Data Analyst",
    "salary_year_avg": "145000.0",
    "company_name": "CyberCoders",
    "job_id (1)": 405581,
    "skill_id": 9,
    "skill_id (1)": 9,
    "skills": "javascript",
    "type": "programming",
    "skills (1)": "javascript"
  },
  {
    "job_id": 405581,
    "job_title": "Data Analyst",
    "salary_year_avg": "145000.0",
    "company_name": "CyberCoders",
    "job_id (1)": 405581,
    "skill_id": 13,
    "skill_id (1)": 13,
    "skills": "c++",
    "type": "programming",
    "skills (1)": "c++"
  },
  {
    "job_id": 405581,
    "job_title": "Data Analyst",
    "salary_year_avg": "145000.0",
    "company_name": "CyberCoders",
    "job_id (1)": 405581,
    "skill_id": 182,
    "skill_id (1)": 182,
    "skills": "tableau",
    "type": "analyst_tools",
    "skills (1)": "tableau"
  },
  {
    "job_id": 405581,
    "job_title": "Data Analyst",
    "salary_year_avg": "145000.0",
    "company_name": "CyberCoders",
    "job_id (1)": 405581,
    "skill_id": 183,
    "skill_id (1)": 183,
    "skills": "power bi",
    "type": "analyst_tools",
    "skills (1)": "power bi"
  },
  {
    "job_id": 405581,
    "job_title": "Data Analyst",
    "salary_year_avg": "145000.0",
    "company_name": "CyberCoders",
    "job_id (1)": 405581,
    "skill_id": 187,
    "skill_id (1)": 187,
    "skills": "qlik",
    "type": "analyst_tools",
    "skills (1)": "qlik"
  },
  {
    "job_id": 479485,
    "job_title": "Data Analyst",
    "salary_year_avg": "145000.0",
    "company_name": "Level",
    "job_id (1)": 479485,
    "skill_id": 0,
    "skill_id (1)": 0,
    "skills": "sql",
    "type": "programming",
    "skills (1)": "sql"
  },
  {
    "job_id": 479485,
    "job_title": "Data Analyst",
    "salary_year_avg": "145000.0",
    "company_name": "Level",
    "job_id (1)": 479485,
    "skill_id": 1,
    "skill_id (1)": 1,
    "skills": "python",
    "type": "programming",
    "skills (1)": "python"
  },
  {
    "job_id": 479485,
    "job_title": "Data Analyst",
    "salary_year_avg": "145000.0",
    "company_name": "Level",
    "job_id (1)": 479485,
    "skill_id": 5,
    "skill_id (1)": 5,
    "skills": "r",
    "type": "programming",
    "skills (1)": "r"
  },
  {
    "job_id": 479485,
    "job_title": "Data Analyst",
    "salary_year_avg": "145000.0",
    "company_name": "Level",
    "job_id (1)": 479485,
    "skill_id": 27,
    "skill_id (1)": 27,
    "skills": "golang",
    "type": "programming",
    "skills (1)": "golang"
  },
  {
    "job_id": 479485,
    "job_title": "Data Analyst",
    "salary_year_avg": "145000.0",
    "company_name": "Level",
    "job_id (1)": 479485,
    "skill_id": 59,
    "skill_id (1)": 59,
    "skills": "elasticsearch",
    "type": "databases",
    "skills (1)": "elasticsearch"
  },
  {
    "job_id": 479485,
    "job_title": "Data Analyst",
    "salary_year_avg": "145000.0",
    "company_name": "Level",
    "job_id (1)": 479485,
    "skill_id": 76,
    "skill_id (1)": 76,
    "skills": "aws",
    "type": "cloud",
    "skills (1)": "aws"
  },
  {
    "job_id": 479485,
    "job_title": "Data Analyst",
    "salary_year_avg": "145000.0",
    "company_name": "Level",
    "job_id (1)": 479485,
    "skill_id": 77,
    "skill_id (1)": 77,
    "skills": "bigquery",
    "type": "cloud",
    "skills (1)": "bigquery"
  },
  {
    "job_id": 479485,
    "job_title": "Data Analyst",
    "salary_year_avg": "145000.0",
    "company_name": "Level",
    "job_id (1)": 479485,
    "skill_id": 81,
    "skill_id (1)": 81,
    "skills": "gcp",
    "type": "cloud",
    "skills (1)": "gcp"
  },
  {
    "job_id": 479485,
    "job_title": "Data Analyst",
    "salary_year_avg": "145000.0",
    "company_name": "Level",
    "job_id (1)": 479485,
    "skill_id": 93,
    "skill_id (1)": 93,
    "skills": "pandas",
    "type": "libraries",
    "skills (1)": "pandas"
  },
  {
    "job_id": 479485,
    "job_title": "Data Analyst",
    "salary_year_avg": "145000.0",
    "company_name": "Level",
    "job_id (1)": 479485,
    "skill_id": 106,
    "skill_id (1)": 106,
    "skills": "scikit-learn",
    "type": "libraries",
    "skills (1)": "scikit-learn"
  },
  {
    "job_id": 479485,
    "job_title": "Data Analyst",
    "salary_year_avg": "145000.0",
    "company_name": "Level",
    "job_id (1)": 479485,
    "skill_id": 185,
    "skill_id (1)": 185,
    "skills": "looker",
    "type": "analyst_tools",
    "skills (1)": "looker"
  },
  {
    "job_id": 479485,
    "job_title": "Data Analyst",
    "salary_year_avg": "145000.0",
    "company_name": "Level",
    "job_id (1)": 479485,
    "skill_id": 213,
    "skill_id (1)": 213,
    "skills": "kubernetes",
    "type": "other",
    "skills (1)": "kubernetes"
  },
  {
    "job_id": 1090975,
    "job_title": "Data Analyst",
    "salary_year_avg": "140500.0",
    "company_name": "Uber",
    "job_id (1)": 1090975,
    "skill_id": 0,
    "skill_id (1)": 0,
    "skills": "sql",
    "type": "programming",
    "skills (1)": "sql"
  },
  {
    "job_id": 1090975,
    "job_title": "Data Analyst",
    "salary_year_avg": "140500.0",
    "company_name": "Uber",
    "job_id (1)": 1090975,
    "skill_id": 1,
    "skill_id (1)": 1,
    "skills": "python",
    "type": "programming",
    "skills (1)": "python"
  },
  {
    "job_id": 1090975,
    "job_title": "Data Analyst",
    "salary_year_avg": "140500.0",
    "company_name": "Uber",
    "job_id (1)": 1090975,
    "skill_id": 5,
    "skill_id (1)": 5,
    "skills": "r",
    "type": "programming",
    "skills (1)": "r"
  },
  {
    "job_id": 1090975,
    "job_title": "Data Analyst",
    "salary_year_avg": "140500.0",
    "company_name": "Uber",
    "job_id (1)": 1090975,
    "skill_id": 35,
    "skill_id (1)": 35,
    "skills": "swift",
    "type": "programming",
    "skills (1)": "swift"
  },
  {
    "job_id": 1090975,
    "job_title": "Data Analyst",
    "salary_year_avg": "140500.0",
    "company_name": "Uber",
    "job_id (1)": 1090975,
    "skill_id": 181,
    "skill_id (1)": 181,
    "skills": "excel",
    "type": "analyst_tools",
    "skills (1)": "excel"
  },
  {
    "job_id": 1090975,
    "job_title": "Data Analyst",
    "salary_year_avg": "140500.0",
    "company_name": "Uber",
    "job_id (1)": 1090975,
    "skill_id": 182,
    "skill_id (1)": 182,
    "skills": "tableau",
    "type": "analyst_tools",
    "skills (1)": "tableau"
  },
  {
    "job_id": 1090975,
    "job_title": "Data Analyst",
    "salary_year_avg": "140500.0",
    "company_name": "Uber",
    "job_id (1)": 1090975,
    "skill_id": 185,
    "skill_id (1)": 185,
    "skills": "looker",
    "type": "analyst_tools",
    "skills (1)": "looker"
  },
  {
    "job_id": 1482852,
    "job_title": "Data Analyst",
    "salary_year_avg": "138500.0",
    "company_name": "Overmind",
    "job_id (1)": 1482852,
    "skill_id": 0,
    "skill_id (1)": 0,
    "skills": "sql",
    "type": "programming",
    "skills (1)": "sql"
  },
  {
    "job_id": 1482852,
    "job_title": "Data Analyst",
    "salary_year_avg": "138500.0",
    "company_name": "Overmind",
    "job_id (1)": 1482852,
    "skill_id": 1,
    "skill_id (1)": 1,
    "skills": "python",
    "type": "programming",
    "skills (1)": "python"
  },
  {
    "job_id": 1326467,
    "job_title": "Data Analyst",
    "salary_year_avg": "135000.0",
    "company_name": "EPIC Brokers",
    "job_id (1)": 1326467,
    "skill_id": 181,
    "skill_id (1)": 181,
    "skills": "excel",
    "type": "analyst_tools",
    "skills (1)": "excel"
  },
  {
    "job_id": 479965,
    "job_title": "Data Analyst",
    "salary_year_avg": "135000.0",
    "company_name": "InvestM Technology LLC",
    "job_id (1)": 479965,
    "skill_id": 0,
    "skill_id (1)": 0,
    "skills": "sql",
    "type": "programming",
    "skills (1)": "sql"
  },
  {
    "job_id": 479965,
    "job_title": "Data Analyst",
    "salary_year_avg": "135000.0",
    "company_name": "InvestM Technology LLC",
    "job_id (1)": 479965,
    "skill_id": 181,
    "skill_id (1)": 181,
    "skills": "excel",
    "type": "analyst_tools",
    "skills (1)": "excel"
  },
  {
    "job_id": 479965,
    "job_title": "Data Analyst",
    "salary_year_avg": "135000.0",
    "company_name": "InvestM Technology LLC",
    "job_id (1)": 479965,
    "skill_id": 183,
    "skill_id (1)": 183,
    "skills": "power bi",
    "type": "analyst_tools",
    "skills (1)": "power bi"
  }
]
 */