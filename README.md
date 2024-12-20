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

## 🔍 Exploratory Data Analysis (EDA)

### Missing Values in Key Fields
The dataset was checked for missing values in essential fields, such as `track_name`, `user_rating`, and `prime_genre`. Additionally, app descriptions were analyzed for missing values.

- **Result**: No missing values were found in the `AppleStore` table or in the `app_desc` field of the `appleStore_description_combined` table.

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

## SQL Queries and Insights

### 1. **Exploratory Data Analysis**

- **Number of Unique Apps**:
  ```sql
  SELECT COUNT(DISTINCT(id)) AS uniqueAppIDs
  FROM AppleStore;

---

### Number of Apps Per Genre
The distribution of apps across genres was analyzed.  
- **Result**: The **Games** genre has the highest number of apps, followed by **Entertainment** and **Education**.

---

### Paid vs Free Apps: Ratings Comparison
- **Insight**: Paid apps generally have higher average ratings compared to free apps.

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
