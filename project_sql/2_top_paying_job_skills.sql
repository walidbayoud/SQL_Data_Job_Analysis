SELECT
    top_paying_job.*,
    skills
FROM (
    SELECT
        job_id,
        job_title,
        salary_year_avg,
        name AS company_name
    FROM
        job_postings_fact
    LEFT JOIN company_dim ON job_postings_fact.company_id = company_dim.company_id
    WHERE
        job_title_short = 'Data Analyst' AND
        job_location = 'Anywhere' AND
        salary_year_avg IS NOT NULL
    ORDER BY
        salary_year_avg DESC
        LIMIT 10
        ) AS top_paying_job
INNER JOIN skills_job_dim ON top_paying_job.job_id = skills_job_dim.job_id
INNER JOIN skills_dim ON skills_job_dim.skill_id = skills_dim.skill_id
ORDER BY
        salary_year_avg DESC;


/*
🔎 Data Analyst Skills Trends for 2023
Here's a breakdown of the key skills found in your job postings, enhanced with emojis and clear headings for better readability:


🚀 Top Skills in Demand
SQL: The Undisputed Champion 👑 SQL reigns supreme as the essential language for interacting with databases.
Python: The Swiss Army Knife 🛠️ Python's flexibility makes it indispensable for data wrangling, analysis, and even machine learning.
Data Visualization: Painting a Clear Picture 📊 Tableau and Power BI are the go-to tools for crafting insightful data visualizations.
The Cloud: Where Data Lives ☁️ Proficiency in cloud platforms like Azure and AWS is becoming increasingly crucial.
Big Data: Handling the Deluge 🌊 Tools like Hadoop, Databricks, and Spark (especially PySpark) indicate a growing need to handle massive datasets.
📊 Visualizing Skill Popularity
[Insert a bar chart here visually representing the frequency of the top skills like SQL, Python, Tableau, Azure, AWS etc.]

💡 Additional Observations
Advanced Analytics: Getting Deeper 📈 The presence of R signals an emphasis on in-depth statistical analysis and modeling.
Teamwork and Workflow 🤝 Tools like Git, Bitbucket, and the Atlassian suite emphasize the collaborative nature of data projects.
The Specificity Factor 🎯 Some job postings require domain-specific skills (Oracle, SAP, Crystal) demonstrating the specialized skills needed in certain industries.
❗️Important Reminders
Seniority Matters: Senior roles might have heavier demands on cloud, big data, and programming skills.
Industry is Key: Different industries might prioritize particular skillsets.
*/
