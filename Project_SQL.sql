Select * from appleStore_description_combined

**Exploratory data analysis**

--check the number of unique apps in the appstore:
Select count(distinct(id)) as uniqueAppIDs
from AppleStore;


Select count(distinct(id)) as uniqueAppID
from appleStore_description_combined

--check for any missing values in key fields:

select Count(*) as MissingValues
FROM AppleStore
where track_name is NULL OR user_rating is NULL or prime_genre is NULL;

select Count(*) as MissingValues
FROM appleStore_description_combined
where app_desc is NULL;

--Find out the number of apps per genre:

Select prime_genre, count(DISTINCT id) as NoOfApps
from AppleStore
group by prime_genre
order by NoOfApps DESC

--Get an overview of apps rating:
select MIN(user_rating) as Minimum_Rating,
Max(user_rating) AS MAX_RATING, 
AVG(user_rating) AS AVG_RATING
FROM AppleStore

--Determine whether paid apps have higher ratings than free apps?AppleStore
select avg(user_rating) as Avg_ratings_Free
from AppleStore
where price = 0;

select avg(user_rating) as Avg_ratings_Free
from AppleStore
where price > 0

--We can combine the above to queries with CASE!

Select CASE	
			when price > 0 then 'Paid'
            else 'Free'
       end as App_type,
       avg(user_rating) as AVG_rating
from AppleStore
group by App_Type

--Check if apps with more language supported have higher ratings:

Select CASE	
			When lang_num < 10 then '<10 Languages'
            when lang_num BETWEEN 10 and 30 then '10-30 Languages'
            else '>30 Languages'
       end as Language_bucket,
       avg(user_rating) as Avg_Rating
from AppleStore
GROUP BY Language_bucket
Order by Avg_Rating DESC

--check genre with low ratings:

Select prime_genre, AVG(user_rating) as average_ratings
from AppleStore
group by prime_genre
order by average_ratings ASC
limit 10

--Check if there is a correlation between the length of the app description and the user rating:

select CASE
			when length(app_desc) <500 then 'Short'
            when  length(app_desc) BETWEEN 500 and 1000 then 'Medium'
            else 'Long'
       end as description_length_bucket,
       avg(user_rating) as Average_Rating
from AppleStore as A, appleStore_description_combined as B
where A.id= B.id
group by description_length_bucket
order by Average_Rating DESC

--check the top rated apps for each genre:

WITH RankedApps AS (
    SELECT 
        prime_genre, 
        track_name, 
        user_rating,
        ROW_NUMBER() OVER (PARTITION BY prime_genre ORDER BY user_rating DESC) AS rank
    FROM AppleStore
)
SELECT prime_genre, track_name, user_rating
FROM RankedApps
WHERE rank = 1;




