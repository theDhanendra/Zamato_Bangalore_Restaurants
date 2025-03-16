CREATE DATABASE zomatoRes;
USE zomatoRes;
SELECT * FROM cleaned_zomato;

-- 1. Find Total Restaurants by Restaurant Type
 SELECT Rest_type, COUNT(*) AS total_restaurants FROM cleaned_zomato
 GROUP BY rest_type
 ORDER BY total_restaurants DESC;
 
 # 2. Find Top Location with Most Restaurants
SELECT location, COUNT(*) AS Total_Restaurants FROM cleaned_zomato
GROUP BY location
ORDER BY Total_Restaurants DESC
LIMIT 10;

# 3. Find Most Popular restauirant types based on votes
SELECT rest_type, SUM(votes) AS Total_Votes  FROM cleaned_zomato
GROUP BY rest_type
ORDER BY total_votes DESC
LIMIT 5;

# Most Reviewed Restaurants
SELECT name, location, votes FROM cleaned_zomato
GROUP BY name, location, votes
ORDER BY votes DESC LIMIT 10;

# Average cost for two by location
SELECT Location, ROUND(AVG(Cost_for_2),2) AS Average_Cost FROM cleaned_zomato
GROUP BY location;

# Find Most Expensive and Cheapest Restaurants
# Expensive Restaurants
SELECT name, location, cost_for_2 FROM cleaned_zomato
GROUP BY name, location, cost_for_2
ORDER BY cost_for_2 DESC;

# Cheapest Restaurants
SELECT name, location, cost_for_2 FROM cleaned_zomato
ORDER BY cost_for_2 ASC;

# Does Higher Cost Mean Higher Ratings?
SELECT cost_for_2, ROUND(AVG(ratings),2) AS Average_Rating FROM cleaned_zomato
GROUP BY cost_for_2
ORDER BY cost_for_2 DESC;

# Find Top 5 Restaurants based on Ratings
SELECT name, ROUND(AVG(ratings),2) AS Avg_Rating FROM cleaned_zomato
GROUP BY name
ORDER BY Avg_Rating DESC LIMIT 5;

# Top 5 area base on FRatings
SELECT Location, ROUND(AVG(ratings),2) AS Avg_Rating FROM cleaned_zomato
GROUP BY Location
ORDER BY Avg_Rating DESC LIMIT 5;

# Which Area have the most restaurants with table bookings?
SELECT location, COUNT(*) "Table_Bookings" FROM cleaned_zomato
WHERE Book_Table = 'Yes'
GROUP BY location
ORDER BY Table_Bookings DESC;

# Best Location for Opening New Restaurants (High Demand, Low Competition)
SELECT Location, COUNT(*) AS total_restaurants, ROUND(AVG(ratings), 2) AS avg_rating
FROM cleaned_zomato
GROUP BY Location
HAVING total_restaurants < 100 AND avg_rating > 3.0
ORDER BY avg_rating DESC;

# List all restaurants that offer online ordering and have a rating of 4.0 or higher.
SELECT Name, Ratings
FROM cleaned_zomato
WHERE Online_Order = 'Yes' AND Ratings >= 4.0;

# Count the number of restaurants that serve 'North Indian' cuisine.
SELECT COUNT(*) AS North_Indian_Restaurants FROM cleaned_zomato
WHERE Cuisines LIKE '%northindian%';

#Show the names and costs for two of  cheapest restaurants that categorized as "high" in the Rate_Category.
SELECT DISTINCT(name), cost_for_2 FROM cleaned_zomato
WHERE Rate_Category = 'High'
ORDER BY cost_for_2 ASC;

# Calculate the percentage of restaurants that offer table booking out of the total number of restaurants.
SELECT ROUND((SUM(CASE WHEN Book_Table = 'Yes' THEN 1 ELSE 0 END) *100.0 / COUNT(*)),2) AS Table_Booking_Per
FROM cleaned_zomato;

# Find all restaurants where the average cost for two is below ₹600 and offer table booking.
SELECT name, ROUND(AVG(cost_for_2),2) AS Average_Cost, Book_Table FROM cleaned_zomato
WHERE Book_Table = 'Yes'
GROUP BY Name, Book_Table
HAVING Average_Cost < 700;

# Retrieve the top 5 cuisines offered by the highest number of restaurants.
SELECT cuisines, COUNT(*) AS Cuisine_Count FROM cleaned_zomato
GROUP BY Cuisines
ORDER BY Cuisine_Count DESC LIMIT 5;

# Show the count of restaurants in each Rate_Category and their corresponding average cost for two.
SELECT Rate_Category, COUNT(*) AS Restaurant_Count, AVG(Cost_for_2) AS Avg_Cost
FROM cleaned_zomato
GROUP BY Rate_Category;


SELECT * FROM cleaned_zomato
