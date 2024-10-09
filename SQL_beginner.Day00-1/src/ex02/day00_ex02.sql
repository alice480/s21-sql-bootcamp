SELECT name, rating
FROM pizzeria
WHERE (3.5 <= rating) AND (rating <= 5)
ORDER BY rating;

SELECT name, rating
FROM pizzeria
WHERE rating BETWEEN 3.5 AND 5
ORDER BY rating;