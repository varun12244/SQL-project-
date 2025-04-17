use imdb;

---- /* 1. What are the top 10 highest-rated movies? */ ----
select Series_Title, IMDB_Rating from imdb
order by IMDB_Rating desc
limit 10;

---- 2. How many movies are in the dataset? ----
select count(*) as `Total Movies`from imdb;

---- 3. What are the unique certificates in the dataset? ----
select distinct certificate from imdb;

---- 4. List all movies in the "Action" genre. ----
select Series_Title from imdb
where genre like "%action%";

---- 5. Which movies were released after 2010? ----
select Series_Title from imdb
where Released_Year > 2010;

---- 6. How many movies were released each year? ----
select Released_Year, count(*) as Total from imdb
group by Released_Year
order by released_year;


---- 7. What is the average IMDb rating for each genre? ----
select distinct Genre,avg(imdb_rating) as `Average Rating`
from imdb
group by genre
order by `Average Rating` desc;

---- 8. List all movies directed by Christopher Nolan, along with their IMDb ratings ----
select Series_Title, imdb_rating from imdb
where director = "Christopher Nolan"
order by imdb_rating desc;

---- 9. What are the top 5 genres with the most movies? ----
select genre,count(*) as `Total Movies` from imdb
group by genre
order by `Total Movies` desc
limit 5;

---- 9. What are the top 5 highest-grossing movies? ----
 select Series_Title, Gross from imdb
order by gross desc
limit 5;

---- 10. Who is the most frequent lead actor (Star1) in the dataset? ----
select star1 as `Lead Actor`,count(*) as `Movie Counts` from imdb
group by `Lead Actor`
order by `Movie Counts` desc
limit 1;

---- 11. List all movies with a runtime longer than 150 minutes ----
select Series_Title from imdb
where Runtime > 150
order by runtime desc;

---- 12. Calculate the total gross revenue for each genre. ----
select genre,sum(gross) as Total_Gross from imdb
group by genre
order by Total_Gross desc;



---- 13. Find the highest-rated movie for each director. ----
select Director,series_Title,imdb_rating
from imdb as m
where imdb_rating = (select max(imdb_rating) from imdb
where director = m.director)
order by imdb_rating desc;

---- 14. What is the average IMDb rating for movies released in each decade? ----
select floor(released_year/10)*10 as  Decade,round(avg(imdb_rating),2) as rating
from imdb
group by decade
order by decade;

---- 15. How does the IMDb rating correlate with the Metascore? ----
select imdb_rating,meta_score from imdb
where meta_score is not null
order by imdb_rating desc;

---- 16. What is the total gross revenue for each director, and who has the highest total? ----
select director,sum(gross) as Total_Gross from imdb
group by director
order by Total_Gross desc;

---- 17. Rank the top 10 movies by IMDb rating and display their gross earnings. ----
SELECT series_title, imdb_rating, gross,
       RANK() OVER (ORDER BY imdb_rating DESC) AS imdb_rank,
       RANK() OVER (ORDER BY gross DESC) AS gross_rank
FROM imdb
LIMIT 10;