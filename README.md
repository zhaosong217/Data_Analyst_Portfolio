# Portfolio Introduction

## **1. Excel Project:**

[YouTube Analytics Data Exploration](https://github.com/zhaosong217/YouTube_Data_Analysis_600_rows)

*Dataset Source:* 

[Kaggle - YouTube Data for Analytics (600 rows)](https://www.kaggle.com/datasets/abdulwadood11220/youtube-data-for-analytics-600-rows)

**Key Accomplishments**

**Data Cleaning & Preparation (Microsoft Excel)**
  - Performed deduplication to ensure data integrity
  - Removed irrelevant columns to focus analysis
  - Extracted and standardized date/time/duration metrics
  - Organized video tags into a dedicated worksheet for tag analysis

**Exploratory Data Analysis**
  - Created dynamic visualizations to reveal dataset insights
  - Developed interactive dashboards using:
  - Pivot tables for multidimensional analysis
  - Slicers for user-controlled filtering
  - Implemented time-based animations to show trends across dates
  - Built category comparison tools for performance analysis

**Dashboard Screenshot**
<img width="2458" height="2046" alt="YouTube Data Analytics Excel 2 0" src="https://github.com/user-attachments/assets/c4ffdf70-e533-4d43-954d-bae0ca00d245" />

## **2. SQL & Tableau Project:**
[Job Data Analysis in 2023](https://github.com/zhaosong217/job_data_analysis)

*Dataset Source:*
[Google Drive](https://drive.google.com/drive/folders/1egWenKd_r3LRpdCf4SsqTeFZ1ZdY3DNx?usp=drive_link). 

The latest edition can be found in [Kaggle](https://www.kaggle.com/datasets/lukebarousse/data-analyst-job-postings-google-search).

In this dataset, there are 4 tables: job_postings_fact, company_dim, skills_job_dim and skills_dim. The following chart shows the relationship of these tables:
<img width="2014" height="1616" alt="relationship" src="https://github.com/user-attachments/assets/560bf9d8-5dbd-4f3b-9194-36f43502de1f" />

**Methodology:** SQL Data Exploration + Tableau Visualization
**Objective:** Identify high-demand skills and top-paying positions in the data job market

**Key Research Questions Explored**
- Market Overview
  - Total job postings and unique companies
  - Distribution of job schedules (remote, hybrid, in-office)
  - Posting frequency by month/platform to identify hiring trends
- Compensation Analysis
  - Positions with highest average yearly salaries
  - Salary variations across job categories
- Skill Demand Mapping
  - Most frequently required skills by position
  - Emerging skill trends in data-related roles

**SQL Techniques Applied**
|Category|Specific Skills Demonstrated|
|--------|--------|
|Query Fundamentals|SELECT, DISTINCT, WHERE, GROUP BY, ORDER BY|
|Conditional Logic|Comparison operators, LIKE with wildcards, HAVING|
|Data Aggregation|COUNT(), AVG(), SUM(), MAX()/MIN()|
|Table Relationships|INNER JOIN, LEFT/RIGHT JOIN, FULL OUTER JOIN|
|Advanced Querying|Subqueries, Common Table Expressions (CTEs)|
|Analytical Functions|Window functions (ROW_NUMBER())|
|Data Transformation|CASE statements for conditional categorization|

**Visualization Approach**
- Developed interactive Tableau dashboards to:
  - Compare salary distributions across job titles
  - Track monthly posting trends via animated time-series
  - Generate skill heatmaps for different positions
- Implemented cross-filtering for dynamic exploration
**Tableau Techniques Applied**

[Dashboard](https://public.tableau.com/views/SQL_job_analysis_job_platform/Dashboard1?:language=en-US&publish=yes&:sid=&:redirect=auth&:display_count=n&:origin=viz_share_link)
<img width="3734" height="1838" alt="Dashboard_1" src="https://github.com/user-attachments/assets/d7fbe70f-1980-42ff-9ef5-7112b021a8a7" />

## **3. Python Project:**

[Ken Jee YouTube Data Analysis](https://github.com/zhaosong217/ken_jee_youtube_analysis)

*Dataset Source:* 

[Kaggle - Ken Jee YouTube Data](https://www.kaggle.com/datasets/kenjee/ken-jee-youtube-data/data)

**Key Accomplishments**

Data Loading and Preparation:
- Successfully loaded four datasets: Aggregated_Metrics_By_Country_And_Subscriber_Status.csv, Aggregated_Metrics_By_Video.csv, All_Comments_Final.csv, and Video_Performance_Over_Time.csv.
- Created copies of the datasets (Country_df, Video_df, Comment_df, Aggregate_df) to ensure data integrity during analysis.
- Utilized essential Python libraries such as pandas, numpy, matplotlib, seaborn, plotly.express, nltk, textblob, and transformers for data manipulation, visualization, and text analysis.


Exploratory Data Analysis (EDA):
- Conducted an initial exploration of the Country_df dataset, displaying its first few rows, structure (info()), and statistical summary (describe()).
- Identified key columns in Country_df, including Video Title, Video Length, Views, Video Likes Added, User Comments Added, and others, which provided a foundation for further analysis.
- Analyzed the distribution of subscribers with Country_df['Is Subscribed'].value_counts(), indicating an interest in understanding subscriber behavior.

Visualization:
- Created a scatter plot to explore the relationship between Average view duration seconds and Subscribers lost using seaborn.scatterplot.
- The plot was customized with specific figure settings (e.g., removing top and right spines, setting y-axis limits) to enhance readability, though the regression line was commented out.


Analysis of Video Duration and Comments (Question 3):
- Merged relevant columns from Video_df (Video Title, External Video ID, Video Length) and Aggregate_df (Video, Comments added) using pd.merge with External Video ID and Video as keys, creating a new DataFrame video_length_comment.
- Grouped the merged DataFrame by Video Title and Video Length to calculate the total Comments added for each video, resulting in len_com_df with 223 unique video entries.
- Computed the Pearson correlation coefficient between Video Length and Comments added using corr(), yielding a value of 0.1712.
- Interpreted the correlation result, indicating a weak positive correlation between video duration and the number of comments, suggesting that longer videos tend to have slightly more comments, but the relationship is not strong.


Key Findings:
- The Pearson correlation coefficient of 0.1712 highlights that video length has a limited impact on the number of comments. This suggests that while longer videos may attract more comments to some extent, other factors (e.g., content quality, topic relevance, or audience engagement strategies) likely play a more significant role in driving comments.
- The analysis provides a clear, data-driven answer to one of the advanced targets, demonstrating the ability to extract and analyze relevant metrics from multiple datasets.

**Dashboard Screenshot**
<img width="1305" height="1353" alt="Dashboard" src="https://github.com/user-attachments/assets/c4c10656-0df1-4dab-b574-4b4488c002bb" />

