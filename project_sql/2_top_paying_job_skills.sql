/*
Question: What skills are required for the top-paying data analyst jobs?
- Use the top 10 highest-paying Data Analyst jobs from first query
- Add the specific skills required for these roles
- Why? It provides a detailed look at which high-paying jobs demand certain skills, 
    helping job seekers understand which skills to develop that align with top salaries
*/


WITH top_paying_jobs AS (
  SELECT
      job_id,
      job_title,
      salary_year_avg,
      job_posted_date,
      company_dim.name as company_name
  FROM
      job_postings_fact
  LEFT JOIN company_dim on job_postings_fact.company_id = company_dim.company_id
  WHERE
      job_title = 'Data Scientist' AND
      job_location = 'Anywhere' AND
      salary_year_avg IS NOT NULL
  ORDER BY 
      salary_year_avg DESC
  LIMIT 10
)

SELECT 
  top_paying_jobs.*,
  skills
FROM top_paying_jobs
INNER JOIN skills_job_dim ON top_paying_jobs.job_id = skills_job_dim.job_id
INNER JOIN skills_dim ON skills_job_dim.skill_id = skills_dim.skill_id
ORDER BY
  salary_year_avg DESC



/*
The analysis of the "skills" column reveals the most frequently mentioned skills across the top data scientist job postings:

Python - 10 occurrences
SQL - 8 occurrences
AWS, R, Spark, and Tableau - 3 occurrences each
Scala, MongoDB, Hadoop, and Cassandra - 2 occurrences each
Insights:
Python and SQL are by far the most in-demand skills, highlighting the importance of these tools in data science.
AWS, R, Spark, and Tableau show the growing need for familiarity with cloud services, statistical programming, big data processing, and visualization tools.
Skills in NoSQL databases (like MongoDB and Cassandra) and big data technologies (Hadoop and Spark) indicate a preference for candidates who can handle large-scale data and unstructured datasets.
[
  {
    "job_id": 1131472,
    "job_title": "Data Scientist",
    "salary_year_avg": "375000.0",
    "job_posted_date": "2023-07-31 14:05:21",
    "company_name": "Algo Capital Group",
    "skills": "sql"
  },
  {
    "job_id": 1131472,
    "job_title": "Data Scientist",
    "salary_year_avg": "375000.0",
    "job_posted_date": "2023-07-31 14:05:21",
    "company_name": "Algo Capital Group",
    "skills": "python"
  },
  {
    "job_id": 1131472,
    "job_title": "Data Scientist",
    "salary_year_avg": "375000.0",
    "job_posted_date": "2023-07-31 14:05:21",
    "company_name": "Algo Capital Group",
    "skills": "java"
  },
  {
    "job_id": 1131472,
    "job_title": "Data Scientist",
    "salary_year_avg": "375000.0",
    "job_posted_date": "2023-07-31 14:05:21",
    "company_name": "Algo Capital Group",
    "skills": "cassandra"
  },
  {
    "job_id": 1131472,
    "job_title": "Data Scientist",
    "salary_year_avg": "375000.0",
    "job_posted_date": "2023-07-31 14:05:21",
    "company_name": "Algo Capital Group",
    "skills": "spark"
  },
  {
    "job_id": 1131472,
    "job_title": "Data Scientist",
    "salary_year_avg": "375000.0",
    "job_posted_date": "2023-07-31 14:05:21",
    "company_name": "Algo Capital Group",
    "skills": "hadoop"
  },
  {
    "job_id": 1131472,
    "job_title": "Data Scientist",
    "salary_year_avg": "375000.0",
    "job_posted_date": "2023-07-31 14:05:21",
    "company_name": "Algo Capital Group",
    "skills": "tableau"
  },
  {
    "job_id": 158782,
    "job_title": "Data Scientist",
    "salary_year_avg": "275000.0",
    "job_posted_date": "2023-07-04 10:41:31",
    "company_name": "Algo Capital Group",
    "skills": "sql"
  },
  {
    "job_id": 158782,
    "job_title": "Data Scientist",
    "salary_year_avg": "275000.0",
    "job_posted_date": "2023-07-04 10:41:31",
    "company_name": "Algo Capital Group",
    "skills": "python"
  },
  {
    "job_id": 158782,
    "job_title": "Data Scientist",
    "salary_year_avg": "275000.0",
    "job_posted_date": "2023-07-04 10:41:31",
    "company_name": "Algo Capital Group",
    "skills": "java"
  },
  {
    "job_id": 158782,
    "job_title": "Data Scientist",
    "salary_year_avg": "275000.0",
    "job_posted_date": "2023-07-04 10:41:31",
    "company_name": "Algo Capital Group",
    "skills": "cassandra"
  },
  {
    "job_id": 158782,
    "job_title": "Data Scientist",
    "salary_year_avg": "275000.0",
    "job_posted_date": "2023-07-04 10:41:31",
    "company_name": "Algo Capital Group",
    "skills": "aws"
  },
  {
    "job_id": 158782,
    "job_title": "Data Scientist",
    "salary_year_avg": "275000.0",
    "job_posted_date": "2023-07-04 10:41:31",
    "company_name": "Algo Capital Group",
    "skills": "spark"
  },
  {
    "job_id": 158782,
    "job_title": "Data Scientist",
    "salary_year_avg": "275000.0",
    "job_posted_date": "2023-07-04 10:41:31",
    "company_name": "Algo Capital Group",
    "skills": "airflow"
  },
  {
    "job_id": 158782,
    "job_title": "Data Scientist",
    "salary_year_avg": "275000.0",
    "job_posted_date": "2023-07-04 10:41:31",
    "company_name": "Algo Capital Group",
    "skills": "hadoop"
  },
  {
    "job_id": 158782,
    "job_title": "Data Scientist",
    "salary_year_avg": "275000.0",
    "job_posted_date": "2023-07-04 10:41:31",
    "company_name": "Algo Capital Group",
    "skills": "tableau"
  },
  {
    "job_id": 1489914,
    "job_title": "Data Scientist",
    "salary_year_avg": "250000.0",
    "job_posted_date": "2023-10-04 16:03:51",
    "company_name": "Smith Hanley Associates",
    "skills": "sql"
  },
  {
    "job_id": 1489914,
    "job_title": "Data Scientist",
    "salary_year_avg": "250000.0",
    "job_posted_date": "2023-10-04 16:03:51",
    "company_name": "Smith Hanley Associates",
    "skills": "python"
  },
  {
    "job_id": 1489914,
    "job_title": "Data Scientist",
    "salary_year_avg": "250000.0",
    "job_posted_date": "2023-10-04 16:03:51",
    "company_name": "Smith Hanley Associates",
    "skills": "javascript"
  },
  {
    "job_id": 1489914,
    "job_title": "Data Scientist",
    "salary_year_avg": "250000.0",
    "job_posted_date": "2023-10-04 16:03:51",
    "company_name": "Smith Hanley Associates",
    "skills": "html"
  },
  {
    "job_id": 1489914,
    "job_title": "Data Scientist",
    "salary_year_avg": "250000.0",
    "job_posted_date": "2023-10-04 16:03:51",
    "company_name": "Smith Hanley Associates",
    "skills": "mongodb"
  },
  {
    "job_id": 1489914,
    "job_title": "Data Scientist",
    "salary_year_avg": "250000.0",
    "job_posted_date": "2023-10-04 16:03:51",
    "company_name": "Smith Hanley Associates",
    "skills": "vba"
  },
  {
    "job_id": 1489914,
    "job_title": "Data Scientist",
    "salary_year_avg": "250000.0",
    "job_posted_date": "2023-10-04 16:03:51",
    "company_name": "Smith Hanley Associates",
    "skills": "php"
  },
  {
    "job_id": 1489914,
    "job_title": "Data Scientist",
    "salary_year_avg": "250000.0",
    "job_posted_date": "2023-10-04 16:03:51",
    "company_name": "Smith Hanley Associates",
    "skills": "mongodb"
  },
  {
    "job_id": 1489914,
    "job_title": "Data Scientist",
    "salary_year_avg": "250000.0",
    "job_posted_date": "2023-10-04 16:03:51",
    "company_name": "Smith Hanley Associates",
    "skills": "aws"
  },
  {
    "job_id": 1489914,
    "job_title": "Data Scientist",
    "salary_year_avg": "250000.0",
    "job_posted_date": "2023-10-04 16:03:51",
    "company_name": "Smith Hanley Associates",
    "skills": "tensorflow"
  },
  {
    "job_id": 1489914,
    "job_title": "Data Scientist",
    "salary_year_avg": "250000.0",
    "job_posted_date": "2023-10-04 16:03:51",
    "company_name": "Smith Hanley Associates",
    "skills": "scikit-learn"
  },
  {
    "job_id": 1489914,
    "job_title": "Data Scientist",
    "salary_year_avg": "250000.0",
    "job_posted_date": "2023-10-04 16:03:51",
    "company_name": "Smith Hanley Associates",
    "skills": "excel"
  },
  {
    "job_id": 1489914,
    "job_title": "Data Scientist",
    "salary_year_avg": "250000.0",
    "job_posted_date": "2023-10-04 16:03:51",
    "company_name": "Smith Hanley Associates",
    "skills": "tableau"
  },
  {
    "job_id": 1489914,
    "job_title": "Data Scientist",
    "salary_year_avg": "250000.0",
    "job_posted_date": "2023-10-04 16:03:51",
    "company_name": "Smith Hanley Associates",
    "skills": "powerpoint"
  },
  {
    "job_id": 1538418,
    "job_title": "Data Scientist",
    "salary_year_avg": "204500.0",
    "job_posted_date": "2023-01-23 01:04:11",
    "company_name": "Grammarly",
    "skills": "sql"
  },
  {
    "job_id": 1538418,
    "job_title": "Data Scientist",
    "salary_year_avg": "204500.0",
    "job_posted_date": "2023-01-23 01:04:11",
    "company_name": "Grammarly",
    "skills": "python"
  },
  {
    "job_id": 1538418,
    "job_title": "Data Scientist",
    "salary_year_avg": "204500.0",
    "job_posted_date": "2023-01-23 01:04:11",
    "company_name": "Grammarly",
    "skills": "scala"
  },
  {
    "job_id": 1538418,
    "job_title": "Data Scientist",
    "salary_year_avg": "204500.0",
    "job_posted_date": "2023-01-23 01:04:11",
    "company_name": "Grammarly",
    "skills": "r"
  },
  {
    "job_id": 727817,
    "job_title": "Data Scientist",
    "salary_year_avg": "197500.0",
    "job_posted_date": "2023-11-01 23:02:27",
    "company_name": "Cisco",
    "skills": "sql"
  },
  {
    "job_id": 727817,
    "job_title": "Data Scientist",
    "salary_year_avg": "197500.0",
    "job_posted_date": "2023-11-01 23:02:27",
    "company_name": "Cisco",
    "skills": "python"
  },
  {
    "job_id": 727817,
    "job_title": "Data Scientist",
    "salary_year_avg": "197500.0",
    "job_posted_date": "2023-11-01 23:02:27",
    "company_name": "Cisco",
    "skills": "r"
  },
  {
    "job_id": 727817,
    "job_title": "Data Scientist",
    "salary_year_avg": "197500.0",
    "job_posted_date": "2023-11-01 23:02:27",
    "company_name": "Cisco",
    "skills": "snowflake"
  },
  {
    "job_id": 727817,
    "job_title": "Data Scientist",
    "salary_year_avg": "197500.0",
    "job_posted_date": "2023-11-01 23:02:27",
    "company_name": "Cisco",
    "skills": "sheets"
  },
  {
    "job_id": 448423,
    "job_title": "Data Scientist",
    "salary_year_avg": "195000.0",
    "job_posted_date": "2023-06-28 16:01:32",
    "company_name": "Storm2",
    "skills": "python"
  },
  {
    "job_id": 1693772,
    "job_title": "Data Scientist",
    "salary_year_avg": "190600.0",
    "job_posted_date": "2023-01-22 00:07:05",
    "company_name": "Tomorrow.io",
    "skills": "python"
  },
  {
    "job_id": 1693772,
    "job_title": "Data Scientist",
    "salary_year_avg": "190600.0",
    "job_posted_date": "2023-01-22 00:07:05",
    "company_name": "Tomorrow.io",
    "skills": "aws"
  },
  {
    "job_id": 37309,
    "job_title": "Data Scientist",
    "salary_year_avg": "186000.0",
    "job_posted_date": "2023-01-10 12:20:43",
    "company_name": "Grammarly",
    "skills": "sql"
  },
  {
    "job_id": 37309,
    "job_title": "Data Scientist",
    "salary_year_avg": "186000.0",
    "job_posted_date": "2023-01-10 12:20:43",
    "company_name": "Grammarly",
    "skills": "python"
  },
  {
    "job_id": 37309,
    "job_title": "Data Scientist",
    "salary_year_avg": "186000.0",
    "job_posted_date": "2023-01-10 12:20:43",
    "company_name": "Grammarly",
    "skills": "scala"
  },
  {
    "job_id": 37309,
    "job_title": "Data Scientist",
    "salary_year_avg": "186000.0",
    "job_posted_date": "2023-01-10 12:20:43",
    "company_name": "Grammarly",
    "skills": "r"
  },
  {
    "job_id": 64405,
    "job_title": "Data Scientist",
    "salary_year_avg": "185000.0",
    "job_posted_date": "2023-09-21 17:28:44",
    "company_name": "Mineral.ai",
    "skills": "sql"
  },
  {
    "job_id": 64405,
    "job_title": "Data Scientist",
    "salary_year_avg": "185000.0",
    "job_posted_date": "2023-09-21 17:28:44",
    "company_name": "Mineral.ai",
    "skills": "python"
  },
  {
    "job_id": 64405,
    "job_title": "Data Scientist",
    "salary_year_avg": "185000.0",
    "job_posted_date": "2023-09-21 17:28:44",
    "company_name": "Mineral.ai",
    "skills": "databricks"
  },
  {
    "job_id": 64405,
    "job_title": "Data Scientist",
    "salary_year_avg": "185000.0",
    "job_posted_date": "2023-09-21 17:28:44",
    "company_name": "Mineral.ai",
    "skills": "spark"
  },
  {
    "job_id": 910502,
    "job_title": "Data Scientist",
    "salary_year_avg": "185000.0",
    "job_posted_date": "2023-11-14 15:02:53",
    "company_name": "Brookwood Search & Selection",
    "skills": "sql"
  },
  {
    "job_id": 910502,
    "job_title": "Data Scientist",
    "salary_year_avg": "185000.0",
    "job_posted_date": "2023-11-14 15:02:53",
    "company_name": "Brookwood Search & Selection",
    "skills": "python"
  }
]
*/

