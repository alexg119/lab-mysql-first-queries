use labs;

SELECT *
FROM applestore2;

/* QUESTION 1: Which are the different genres? /* ANSWER QUERY */

SELECT prime_genre
FROM applestore2
GROUP BY prime_genre;

/* QUESTION 2: Which is the genre with more apps rated? /* ANSWER QUERY */

SELECT prime_genre, SUM(rating_count_tot) AS no_of_ratings
FROM applestore2
GROUP BY prime_genre
ORDER BY SUM(rating_count_tot) DESC
LIMIT 1;

/* QUESTION 3: Which is the genre with more apps? /* ANSWER QUERY */

SELECT prime_genre, COUNT(track_name) AS no_of_apps
FROM applestore2
GROUP BY prime_genre
ORDER BY COUNT(track_name) DESC
LIMIT 1;

/* QUESTION 4: Which is the one with less? /* ANSWER QUERY */

SELECT prime_genre, COUNT(track_name) AS no_of_apps
FROM applestore2
GROUP BY prime_genre
ORDER BY COUNT(track_name) ASC
LIMIT 1;

/* QUESTION 5: Take the 10 apps most rated. /* ANSWER QUERY */

SELECT id, track_name, rating_count_tot
FROM applestore2
ORDER BY rating_count_tot DESC
LIMIT 10;

/* QUESTION 6: Take the 10 apps best rated by users. /* ANSWER QUERY */

SELECT id, track_name, user_rating
FROM applestore2
ORDER BY user_rating DESC
LIMIT 10;

/* QUESTION 7: Take a look on the data you retrieved in the question 5. Give some insights. /* ANSWER QUERY */

SELECT *
FROM applestore2
ORDER BY rating_count_tot DESC
LIMIT 10;

-- The top10 are either social media or mobile games (more mobile games). Despite facebook having the having the most ratings
-- it also has the lowest.

/* QUESTION 8: Take a look on the data you retrieved in the question 6. Give some insights. /* ANSWER QUERY */

SELECT *
FROM applestore2
ORDER BY user_rating DESC
LIMIT 10;

-- This data doesn't look representative. Only 3 apps on this list have over 100 in total rating count.

/* QUESTION 9: Now compare the data from questions 5 and 6. What do you see? /* ANSWER QUERY */

-- Question 6 seems to be games only. That indicates that games tend to get better user ratings than social media apps

/* QUESTION 10: How could you take the top 3 regarding the user ratings but also the number of votes? /* ANSWER QUERY */

SELECT id, track_name, user_rating, rating_count_tot
FROM applestore2
ORDER BY user_rating DESC, rating_count_tot DESC
LIMIT 3;

-- This lists all 5 star apps followed by the number of ratings

/* QUESTION 11: Does people care about the price? Do some queries, comment why are you doing them and the results
you retrieve. What is your conclusion? /* ANSWER QUERY */

SELECT price, SUM(rating_count_tot)
FROM applestore2
GROUP BY price
ORDER BY SUM(rating_count_tot) DESC;
-- LIMIT 10; to check the top10

/* Yes, more people seem to take the time to rate and download cheaper apps. There aren't any apps in the top 10 over 10$