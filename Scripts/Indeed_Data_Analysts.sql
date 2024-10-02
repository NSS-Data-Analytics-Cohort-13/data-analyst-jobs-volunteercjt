    How many rows are in the data_analyst_jobs table?
	
SELECT COUNT(*)
FROM indeed_data_analysts

    Write a query to look at just the first 10 rows. What company is associated with the job posting on the 10th row?

SELECT *
FROM indeed_data_analysts
LIMIT 10

    How many postings are in Tennessee? How many are there in either Tennessee or Kentucky?

SELECT *
FROM indeed_data_analysts
WHERE location = 'TN'

    How many postings in Tennessee have a star rating above 4?

SELECT *
FROM indeed_data_analysts
WHERE location = 'TN'
AND star_rating > 4

    How many postings in the dataset have a review count between 500 and 1000?

SELECT *
FROM indeed_data_analysts
WHERE review_count BETWEEN 500 AND 1000


    Show the average star rating for companies in each state. The output should show the state as state and the average rating for the state as avg_rating. Which state shows the highest average rating?
	
SELECT AVG(star_rating) AS avg_rating, location
FROM indeed_data_analysts
GROUP BY location
ORDER BY avg_rating DESC


SELECT AVG(star_rating), company, location
FROM indeed_data_analysts
GROUP BY 2, 3

    Select unique job titles from the data_analyst_jobs table. How many are there?
	
SELECT DISTINCT title
FROM indeed_data_analysts

    How many unique job titles are there for California companies?

SELECT DISTINCT title
FROM indeed_data_analysts
WHERE location = 'CA'

    Find the name of each company and its average star rating for all companies that have more than 5000 reviews across all locations. How many companies are there with more that 5000 reviews across all locations?

SELECT company, AVG(star_rating)
FROM indeed_data_analysts
WHERE company IS NOT null
GROUP BY company
HAVING MIN(review_count) > 5000
ORDER BY company

    Add the code to order the query in #9 from highest to lowest average star rating. Which company with more than 5000 reviews across all locations in the dataset has the highest star rating? What is that rating?

SELECT company, AVG(star_rating) AS avg_star_rating
FROM indeed_data_analysts
WHERE company IS NOT null
GROUP BY company
HAVING MIN(review_count) > 5000
ORDER BY avg_star_rating DESC


    Find all the job titles that contain the word ‘Analyst’. How many different job titles are there?
	
SELECT title
FROM indeed_data_analysts
WHERE title LIKE '%Analyst%'

    How many different job titles do not contain either the word ‘Analyst’ or the word ‘Analytics’? What word do these positions have in common?

SELECT DISTINCT title
FROM indeed_data_analysts
WHERE UPPER(title) NOT LIKE '%ANALYST%' 
AND UPPER(title) NOT LIKE '%ANALYTICS%'