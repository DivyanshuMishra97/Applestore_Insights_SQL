# 📊 Practical Data Analytics with SQL: App Store Analysis

## 📑 Project Description
This project explores and analyzes a comprehensive **App Store dataset** sourced from Kaggle. Using **SQL** and the **SQLiteOnline** tool, the analysis uncovers valuable insights into app ratings, genres, pricing models, and other key metrics. The primary goal is to provide actionable recommendations for app developers and businesses to create better-performing apps.

---

## 📂 Dataset Information
- **Source**: [Kaggle](https://www.kaggle.com)
- **Description**: The dataset includes details about apps in the App Store, such as:
  - **ID**: Unique app identifier
  - **Track Name**: App name
  - **Price**: App price (in USD)
  - **User Rating**: Average user rating
  - **Prime Genre**: App genre/category
  - **Lang Num**: Number of languages supported
  - **App Desc**: App description
- **Tool Used**: SQLiteOnline for database import and query execution.

---

## Objectives

1. Perform exploratory data analysis (EDA) to understand the dataset structure and identify key insights.
2. Answer business questions like:
   - Do paid apps have higher ratings than free apps?
   - Which genres have the lowest and highest ratings?
   - Does the number of languages supported correlate with higher ratings?
   - Does the length of the app description affect user ratings?
3. Provide actionable recommendations for app developers based on findings.

---

## 🔍 Exploratory Data Analysis (EDA)

## SQL Queries and Insights

### 1. **Exploratory Data Analysis**

- **Number of Unique Apps**:
  ```sql
  SELECT COUNT(DISTINCT(id)) AS uniqueAppIDs
  FROM AppleStore;
- Result: 7,197 unique apps.
---

- **Check for Missing Values in Key Fields**:
  ```sql
  SELECT COUNT(*) AS MissingValues 
  FROM AppleStore 
  WHERE track_name IS NULL OR user_rating IS NULL OR prime_genre IS NULL;
- Result: No missing values in key fields.
---

- **Number of Apps Per Genre**:
  ```sql
    SELECT prime_genre, COUNT(DISTINCT id) AS NoOfApps
    FROM AppleStore
    GROUP BY prime_genre
    ORDER BY NoOfApps DESC;
- Insight: The Games genre dominates the App Store in terms of the number of apps.
---

### 2. **Analysis of Ratings**

- **Overview of Ratings**:
  ```sql
      SELECT MIN(user_rating) AS Minimum_Rating,
      MAX(user_rating) AS Maximum_Rating,
      AVG(user_rating) AS Average_Rating
      FROM AppleStore;
- Result: 
      *Minimum Rating: 0.0
      *Maximum Rating: 5.0
      *Average Rating: ~3.5
  ---

- **Paid vs Free Apps Ratings**:
   ```sql
   SELECT CASE
             WHEN price > 0 THEN 'Paid'
             ELSE 'Free'
             END AS App_Type,
             AVG(user_rating) AS Average_Rating
   FROM AppleStore GROUP BY App_Type;
- Insight: Paid apps have higher average ratings compared to free apps.

---

### 3. **Additional Analysis**

- **Check if Apps with More Languages Have Higher Ratings**:
  ```sql
  SELECT CASE
              WHEN lang_num < 10 THEN '<10 Languages'
              WHEN lang_num BETWEEN 10 AND 30 THEN '10-30 Languages'
              ELSE '>30 Languages'
              END AS Language_Bucket,
              AVG(user_rating) AS Avg_Rating
  FROM AppleStore
  GROUP BY Language_Bucket
  ORDER BY Avg_Rating DESC;
- Insight: Apps supporting 10–30 languages have the highest average ratings.
---
- **Genres with Low Ratings**:
   ```sql
      SELECT prime_genre, AVG(user_rating) AS Average_Rating
      FROM AppleStore
      GROUP BY prime_genre
      ORDER BY Average_Rating ASC
      LIMIT 10;
- Insight: Finance and Book apps have the lowest average ratings, presenting opportunities for improvement.
---
- **Top Rated Apps Per Genre**:
   ```sql
   WITH RankedApps AS
    ( SELECT prime_genre, track_name, user_rating, ROW_NUMBER()
   OVER (PARTITION BY prime_genre ORDER BY user_rating DESC) AS Rank
   FROM AppleStore )
   SELECT prime_genre, track_name, user_rating
    FROM RankedApps
    WHERE Rank = 1;
 - Result: Identified the highest-rated app for each genre.
---
- **Correlation Between Description Length and Ratings:**:
   ```sql
  SELECT CASE
         WHEN LENGTH(app_desc) < 500 THEN 'Short'
         WHEN LENGTH(app_desc) BETWEEN 500 AND 1000 THEN 'Medium'
         ELSE 'Long'
       END AS description_length_bucket, 
       AVG(user_rating) AS Average_Rating
      FROM AppleStore AS A
      JOIN appleStore_description_combined AS B ON A.id = B.id
      GROUP BY description_length_bucket
      ORDER BY Average_Rating DESC;
 - Insight: Apps with longer descriptions tend to have better ratings.

---

## Final Recommendations
1. **Paid Apps Perform Better**: Developers should consider offering premium features to justify a paid app model.
2. **Language Support Matters**: Supporting **10–30 languages** can significantly enhance user ratings and reach.
3. **Opportunity in Low-Rated Genres**: Focus on **Finance** and **Book** apps to address gaps in user satisfaction.
4. **Leverage Long Descriptions**: Create detailed and engaging app descriptions to improve user ratings.
5. **Aim for Ratings Above 3.5**: Ensure that a new app meets the average threshold for success.
6. **Games and Entertainment Are Saturated**: While these genres are competitive, they offer a huge user base for innovative apps.

---

## 🛠 Tools and Technologies
- **SQL Database**: SQLite
- **Querying Tool**: SQLiteOnline
- **Dataset Source**: [Kaggle](https://www.kaggle.com)
- **Languages**: SQL

---

## 📬 Contact
- **Author**: Divyanshu Mishra  
- **Email**: [divyanshu.mishra@utdallas.edu](mailto:divyanshu.mishra@utdallas.edu)  
- **GitHub**: [Divyanshu Mishra](https://github.com/DivyanshuMishra97)
