## Part1 - Boyang Zhang
## a. List the number of movies in each genre and their average rate.
# Drama
(SELECT 'Drama' AS MovieType,SUM(Vote_Count * Vote_Average)/SUM(Vote_Count) AS Avg_Vote FROM 
MovieDetails AS m INNER JOIN Voting AS v on v.ID=m.ID
WHERE Genres LIKE '%Drama%')
UNION
# Crime
(SELECT 'Crime' AS MovieType,SUM(Vote_Count * Vote_Average)/SUM(Vote_Count) AS Avg_Vote FROM 
MovieDetails AS m INNER JOIN Voting AS v on v.ID=m.ID
WHERE Genres LIKE '%Crime%')
UNION
# Comedy
(SELECT 'Comedy' AS MovieType,SUM(Vote_Count * Vote_Average)/SUM(Vote_Count) AS Avg_Vote FROM 
MovieDetails AS m INNER JOIN Voting AS v on v.ID=m.ID
WHERE Genres LIKE '%Comedy%')
UNION
# Action
(SELECT 'Action' AS MovieType,SUM(Vote_Count * Vote_Average)/SUM(Vote_Count) AS Avg_Vote FROM 
MovieDetails AS m INNER JOIN Voting AS v on v.ID=m.ID
WHERE Genres LIKE '%Action%')
UNION
# Thriller
(SELECT 'Thriller' AS MovieType,SUM(Vote_Count * Vote_Average)/SUM(Vote_Count) AS Avg_Vote FROM 
MovieDetails AS m INNER JOIN Voting AS v on v.ID=m.ID
WHERE Genres LIKE '%Thriller%')
UNION
# Documentary
(SELECT 'Documentary' AS MovieType,SUM(Vote_Count * Vote_Average)/SUM(Vote_Count) AS Avg_Vote FROM 
MovieDetails AS m INNER JOIN Voting AS v on v.ID=m.ID
WHERE Genres LIKE '%Documentary%')
UNION
# Adventure
(SELECT 'Adventure' AS MovieType,SUM(Vote_Count * Vote_Average)/SUM(Vote_Count) AS Avg_Vote FROM 
MovieDetails AS m INNER JOIN Voting AS v on v.ID=m.ID
WHERE Genres LIKE '%Adventure%')
UNION
# Science Fiction
(SELECT 'Science Fiction' AS MovieType,SUM(Vote_Count * Vote_Average)/SUM(Vote_Count) AS Avg_Vote FROM 
MovieDetails AS m INNER JOIN Voting AS v on v.ID=m.ID
WHERE Genres LIKE '%Science Fiction%')
UNION
# Animation
(SELECT 'Animation' AS MovieType,SUM(Vote_Count * Vote_Average)/SUM(Vote_Count) AS Avg_Vote FROM 
MovieDetails AS m INNER JOIN Voting AS v on v.ID=m.ID
WHERE Genres LIKE '%Animation%')
UNION
# Family
(SELECT 'Family' AS MovieType,SUM(Vote_Count * Vote_Average)/SUM(Vote_Count) AS Avg_Vote FROM 
MovieDetails AS m INNER JOIN Voting AS v on v.ID=m.ID
WHERE Genres LIKE '%Family%')
UNION
# Romance
(SELECT 'Romance' AS MovieType,SUM(Vote_Count * Vote_Average)/SUM(Vote_Count) AS Avg_Vote FROM 
MovieDetails AS m INNER JOIN Voting AS v on v.ID=m.ID
WHERE Genres LIKE '%Romance%')
UNION
# Mystery
(SELECT 'Mystery' AS MovieType,SUM(Vote_Count * Vote_Average)/SUM(Vote_Count) AS Avg_Vote FROM 
MovieDetails AS m INNER JOIN Voting AS v on v.ID=m.ID
WHERE Genres LIKE '%Mystery%')
UNION
# Music
(SELECT 'Music' AS MovieType,SUM(Vote_Count * Vote_Average)/SUM(Vote_Count) AS Avg_Vote FROM 
MovieDetails AS m INNER JOIN Voting AS v on v.ID=m.ID
WHERE Genres LIKE '%Music%')
UNION
# Horror
(SELECT 'Horror' AS MovieType,SUM(Vote_Count * Vote_Average)/SUM(Vote_Count) AS Avg_Vote FROM 
MovieDetails AS m INNER JOIN Voting AS v on v.ID=m.ID
WHERE Genres LIKE '%Horror%')
UNION
# Fantasy
(SELECT 'Fantasy' AS MovieType,SUM(Vote_Count * Vote_Average)/SUM(Vote_Count) AS Avg_Vote FROM 
MovieDetails AS m INNER JOIN Voting AS v on v.ID=m.ID
WHERE Genres LIKE '%Fantasy%')
UNION
# War
(SELECT 'War' AS MovieType,SUM(Vote_Count * Vote_Average)/SUM(Vote_Count) AS Avg_Vote FROM 
MovieDetails AS m INNER JOIN Voting AS v on v.ID=m.ID
WHERE Genres LIKE '%War%')
UNION
# History
(SELECT 'History' AS MovieType,SUM(Vote_Count * Vote_Average)/SUM(Vote_Count) AS Avg_Vote FROM 
MovieDetails AS m INNER JOIN Voting AS v on v.ID=m.ID
WHERE Genres LIKE '%History%')
UNION
# Western
(SELECT 'Western' AS MovieType,SUM(Vote_Count * Vote_Average)/SUM(Vote_Count) AS Avg_Vote FROM 
MovieDetails AS m INNER JOIN Voting AS v on v.ID=m.ID
WHERE Genres LIKE '%Western%')
UNION
# Foreign
(SELECT 'Foreign' AS MovieType,SUM(Vote_Count * Vote_Average)/SUM(Vote_Count) AS Avg_Vote FROM 
MovieDetails AS m INNER JOIN Voting AS v on v.ID=m.ID
WHERE Genres LIKE '%Foreign%')
UNION
# TV Movie
(SELECT 'TV Movie' AS MovieType,SUM(Vote_Count * Vote_Average)/SUM(Vote_Count) AS Avg_Vote FROM 
MovieDetails AS m INNER JOIN Voting AS v on v.ID=m.ID
WHERE Genres LIKE '%TV Movie%')


## c. List top 5 highest rated movies in each genre and their average rate.
# Drama
(SELECT 'Drama' AS MovieType,v.ID, Title,Vote_Average,@curRank1 := @curRank1 + 1 AS rank FROM 
MovieDetails AS m INNER JOIN Voting AS v on v.ID=m.ID, (SELECT @curRank1 := 0) r
WHERE Genres LIKE '%Drama%'
ORDER BY Vote_Average desc limit 5)
UNION
# Crime
(SELECT 'Crime' AS MovieType,v.ID, Title,Vote_Average,@curRank2 := @curRank2 + 1 AS rank FROM 
MovieDetails AS m INNER JOIN Voting AS v on v.ID=m.ID, (SELECT @curRank2 := 0) r
WHERE Genres LIKE '%Crime%'
ORDER BY Vote_Average desc limit 5)
UNION
# Comedy
(SELECT 'Comedy' AS MovieType,v.ID, Title,Vote_Average,@curRank3 := @curRank3 + 1 AS rank FROM 
MovieDetails AS m INNER JOIN Voting AS v on v.ID=m.ID, (SELECT @curRank3 := 0) r
WHERE Genres LIKE '%Comedy%'
ORDER BY Vote_Average desc limit 5)
UNION
# Action
(SELECT 'Action' AS MovieType,v.ID, Title,Vote_Average,@curRank4 := @curRank4 + 1 AS rank FROM 
MovieDetails AS m INNER JOIN Voting AS v on v.ID=m.ID, (SELECT @curRank4 := 0) r
WHERE Genres LIKE '%Action%'
ORDER BY Vote_Average desc limit 5)
UNION
# Thriller
(SELECT 'Thriller' AS MovieType,v.ID, Title,Vote_Average,@curRank5 := @curRank5 + 1 AS rank FROM 
MovieDetails AS m INNER JOIN Voting AS v on v.ID=m.ID, (SELECT @curRank5 := 0) r
WHERE Genres LIKE '%Thriller%'
ORDER BY Vote_Average desc limit 5)
UNION
# Documentary
(SELECT 'Documentary' AS MovieType,v.ID, Title,Vote_Average,@curRank6 := @curRank6 + 1 AS rank FROM 
MovieDetails AS m INNER JOIN Voting AS v on v.ID=m.ID, (SELECT @curRank6 := 0) r
WHERE Genres LIKE '%Documentary%'
ORDER BY Vote_Average desc limit 5)
UNION
# Adventure
(SELECT 'Adventure' AS MovieType,v.ID, Title,Vote_Average,@curRank7 := @curRank7 + 1 AS rank FROM 
MovieDetails AS m INNER JOIN Voting AS v on v.ID=m.ID, (SELECT @curRank7 := 0) r
WHERE Genres LIKE '%Adventure%')
UNION
# Science Fiction
(SELECT 'Science Fiction' AS MovieType,v.ID, Title,Vote_Average,@curRank8 := @curRank8 + 1 AS rank FROM 
MovieDetails AS m INNER JOIN Voting AS v on v.ID=m.ID, (SELECT @curRank8 := 0) r
WHERE Genres LIKE '%Science Fiction%'
ORDER BY Vote_Average desc limit 5)
UNION
# Animation
(SELECT 'Animation' AS MovieType,v.ID, Title,Vote_Average,@curRank9 := @curRank9 + 1 AS rank FROM 
MovieDetails AS m INNER JOIN Voting AS v on v.ID=m.ID, (SELECT @curRank9 := 0) r
WHERE Genres LIKE '%Animation%'
ORDER BY Vote_Average desc limit 5)
UNION
# Family
(SELECT 'Family' AS MovieType,v.ID, Title,Vote_Average,@curRank10 := @curRank10 + 1 AS rank FROM 
MovieDetails AS m INNER JOIN Voting AS v on v.ID=m.ID, (SELECT @curRank10 := 0) r
WHERE Genres LIKE '%Family%'
ORDER BY Vote_Average desc limit 5)
UNION
# Romance
(SELECT 'Romance' AS MovieType,v.ID, Title,Vote_Average,@curRank11 := @curRank11 + 1 AS rank FROM 
MovieDetails AS m INNER JOIN Voting AS v on v.ID=m.ID, (SELECT @curRank11 := 0) r
WHERE Genres LIKE '%Romance%'
ORDER BY Vote_Average desc limit 5)
UNION
# Mystery
(SELECT 'Mystery' AS MovieType,v.ID, Title,Vote_Average,@curRank12 := @curRank12 + 1 AS rank FROM 
MovieDetails AS m INNER JOIN Voting AS v on v.ID=m.ID, (SELECT @curRank12 := 0) r
WHERE Genres LIKE '%Mystery%'
ORDER BY Vote_Average desc limit 5)
UNION
# Music
(SELECT 'Music' AS MovieType,v.ID, Title,Vote_Average,@curRank13 := @curRank13 + 1 AS rank FROM 
MovieDetails AS m INNER JOIN Voting AS v on v.ID=m.ID, (SELECT @curRank13 := 0) r
WHERE Genres LIKE '%Music%'
ORDER BY Vote_Average desc limit 5)
UNION
# Horror
(SELECT 'Horror' AS MovieType,v.ID, Title,Vote_Average,@curRank14 := @curRank14 + 1 AS rank FROM 
MovieDetails AS m INNER JOIN Voting AS v on v.ID=m.ID, (SELECT @curRank14 := 0) r
WHERE Genres LIKE '%Horror%'
ORDER BY Vote_Average desc limit 5)
UNION
# Fantasy
(SELECT 'Fantasy' AS MovieType,v.ID, Title,Vote_Average,@curRank15 := @curRank15 + 1 AS rank FROM 
MovieDetails AS m INNER JOIN Voting AS v on v.ID=m.ID, (SELECT @curRank15 := 0) r
WHERE Genres LIKE '%Fantasy%'
ORDER BY Vote_Average desc limit 5)
UNION
# War
(SELECT 'War' AS MovieType,v.ID, Title,Vote_Average,@curRank16 := @curRank16 + 1 AS rank FROM 
MovieDetails AS m INNER JOIN Voting AS v on v.ID=m.ID, (SELECT @curRank16 := 0) r
WHERE Genres LIKE '%War%'
ORDER BY Vote_Average desc limit 5)
UNION
# History
(SELECT 'History' AS MovieType,v.ID, Title,Vote_Average,@curRank17 := @curRank17 + 1 AS rank FROM 
MovieDetails AS m INNER JOIN Voting AS v on v.ID=m.ID, (SELECT @curRank17 := 0) r
WHERE Genres LIKE '%History%'
ORDER BY Vote_Average desc limit 5)
UNION
# Western
(SELECT 'Western' AS MovieType,v.ID, Title,Vote_Average,@curRank18 := @curRank18 + 1 AS rank FROM 
MovieDetails AS m INNER JOIN Voting AS v on v.ID=m.ID, (SELECT @curRank18 := 0) r
WHERE Genres LIKE '%Western%'
ORDER BY Vote_Average desc limit 5)
UNION
# Foreign
(SELECT 'Foreign' AS MovieType,v.ID, Title,Vote_Average,@curRank19 := @curRank19 + 1 AS rank FROM 
MovieDetails AS m INNER JOIN Voting AS v on v.ID=m.ID, (SELECT @curRank19 := 0) r
WHERE Genres LIKE '%Foreign%'
ORDER BY Vote_Average desc limit 5)
UNION
# TV Movie
(SELECT 'TV Movie' AS MovieType,v.ID, Title,Vote_Average,@curRank20 := @curRank20 + 1 AS rank FROM 
MovieDetails AS m INNER JOIN Voting AS v on v.ID=m.ID, (SELECT @curRank20 := 0) r
WHERE Genres LIKE '%TV Movie%'
ORDER BY Vote_Average desc limit 5)


## e. List all the “Best Director Award” winning director and total number of movies that they directed in that year.

SELECT D.Director_Name AS Director_Name, SUM(!ISNULL(M.Year)) AS Num_Movies, A.Year FROM
(SELECT * FROM 
Award_by_directors
WHERE Award_Name = 'Best Director Award' AND Outcome = 'Won') AS A
INNER JOIN DirectedBy as D on D.Director_Name = A.Director_Name
LEFT JOIN 
(SELECT ID, YEAR(STR_TO_DATE(Release_Date, '%d/%m/%Y')) as Year FROM MovieDetails) as M on M.ID = D.ID and M.Year = A.Year
GROUP BY Director_Name
ORDER BY A.Year;

## f. List the genre, director, actor/actress of most popular movies in recent 5 years (2013-2017).
SELECT A.Year, Title, Genres, Actor_Name, Director_Name, A.Popularity FROM
(SELECT YEAR(STR_TO_DATE(Release_Date, '%d/%m/%Y')) AS Year, M.Title, M.Genres, C.Name as Actor_Name, D.Director_Name, Popularity FROM
MovieDetails as M INNER JOIN Casting as C on M.ID = C.ID
INNER JOIN Voting as V on V.ID = M.ID
INNER JOIN DirectedBy as D on D.ID = M.ID
WHERE YEAR(STR_TO_DATE(Release_Date, '%d/%m/%Y')) <=2017 AND YEAR(STR_TO_DATE(Release_Date, '%d/%m/%Y'))>=2013) AS A
INNER JOIN
(SELECT YEAR(STR_TO_DATE(Release_Date, '%d/%m/%Y')) AS Year, MAX(Popularity) AS Popularity FROM
MovieDetails as M INNER JOIN Casting as C on M.ID = C.ID
INNER JOIN Voting as V on V.ID = M.ID
INNER JOIN DirectedBy as D on D.ID = M.ID
WHERE YEAR(STR_TO_DATE(Release_Date, '%d/%m/%Y')) <=2017 AND YEAR(STR_TO_DATE(Release_Date, '%d/%m/%Y'))>=2013
GROUP BY YEAR(STR_TO_DATE(Release_Date, '%d/%m/%Y'))) AS B
ON A.Year = B.Year and A.Popularity = B.Popularity
ORDER BY A.Year, Title;

## h. List sci-fi movies produced before 2010 with rating over 8.0.

SELECT M.ID, Title, IMDB_ID, IMDB_Link, Release_Date, Runtime, Vote_Average FROM
MovieDetails AS M INNER JOIN Voting AS V on M.ID = V.ID
WHERE YEAR(STR_TO_DATE(Release_Date, '%d/%m/%Y')) < 2010 AND V.Vote_Average > 8 AND Genres LIKE '%Science Fiction%'
ORDER BY Vote_Average DESC, Release_Date DESC;

## j. List the movies with the highest rating produced in each country from Year 2008 to 2017.

SELECT M.ID, Title, Genres, IMDB_ID, IMDB_Link, Release_Date, Runtime, P.Production_Country, V.Vote_Average FROM
MovieDetails as M INNER JOIN ProductionDetails as P on M.ID = P.ID 
INNER JOIN Voting as V on M.ID = V.ID
INNER JOIN
(SELECT Production_Country, MAX(Vote_Average) as Highest_Rate FROM
MovieDetails as M INNER JOIN ProductionDetails as P on M.ID = P.ID 
INNER JOIN Voting as V on M.ID = V.ID
WHERE Production_Country <> 'none' AND YEAR(STR_TO_DATE(Release_Date, '%d/%m/%Y')) <=2017 AND YEAR(STR_TO_DATE(Release_Date, '%d/%m/%Y')) >=2008
GROUP BY Production_Country
HAVING MAX(Vote_Average)>0
ORDER BY MAX(Vote_Average)) AS B 
ON P.Production_Country = B.Production_Country AND V.Vote_Average = B.Highest_Rate
WHERE P.Production_Country <> 'none' AND YEAR(STR_TO_DATE(Release_Date, '%d/%m/%Y')) <=2017 AND YEAR(STR_TO_DATE(Release_Date, '%d/%m/%Y')) >=2008
ORDER BY P.Production_Country;

## k. List movies directed by Christopher Nolan that is not sci-fi and receives at least one award before year 2011. (Assume the released year and the award year should be the same)
SELECT distinct D.ID, Genres, IMDB_ID, IMDB_Link, Title,Release_Date,Runtime, D.Director_Name FROM
DirectedBy as D INNER JOIN MovieDetails as M on M.ID = D.ID
INNER JOIN Award_by_directors as A on A.Director_Name = D.Director_Name
WHERE D.Director_Name = 'Christopher Nolan' AND Genres NOT LIKE '%Science Fiction%' AND Outcome = 'Won'
AND YEAR(STR_TO_DATE(Release_Date, '%d/%m/%Y')) = Year and Year < 2011;


## l. List the female director who has received the largest number of awards and her language is not English.

SELECT D.Director_Name, count(*) AS Num_Awards FROM
Director AS D INNER JOIN  Award_by_directors AS A ON D.Director_Name = A.Director_Name
INNER JOIN Language_by_directors AS L on D.Director_Name = L.Director_Name
WHERE D.Director_Gender='F' AND Outcome='Won' AND Language_Fullname <> 'English'
GROUP BY Director_Name
ORDER BY count(*) DESC LIMIT 1;

## n. List the movies that was directed by directors who have received at least one award but its revenue is less than its budget. (Assume the Revenue and Budget are non-zero)

SELECT distinct A1.ID, IMDB_ID,Title,Release_Date, Budget, Revenue, A2.Director_Name FROM
(SELECT * FROM Investment as i
where Budget > Revenue and Budget>0 and Revenue >0) as A1
INNER JOIN
(SELECT distinct D.ID, A.Director_Name FROM
Award_by_directors as A INNER JOIN DirectedBy as D on A.Director_Name = D.Director_Name
WHERE Outcome='Won') as A2
ON A1.ID = A2.ID
INNER JOIN MovieDetails as M on M.ID = A1.ID
ORDER BY YEAR(STR_TO_DATE(Release_Date, '%d/%m/%Y')) DESC;

## p. List the production company whose movies receive the highest average rating.

SELECT Production_Company, SUM(Vote_Average * Vote_Count)/SUM(Vote_Count) as Average_Rate FROM
ProductionDetails as P INNER JOIN Voting as V 
ON P.ID = V.ID
GROUP BY Production_Company
HAVING SUM(Vote_Average * Vote_Count)/SUM(Vote_Count) = (
SELECT SUM(Vote_Average * Vote_Count)/SUM(Vote_Count) FROM
ProductionDetails as P INNER JOIN Voting as V 
ON P.ID = V.ID
GROUP BY Production_Company
ORDER BY SUM(Vote_Average * Vote_Count)/SUM(Vote_Count) DESC LIMIT 1
)
## Part2 - Feng Zhang
# b
SELECT Production_Country, Genres, COUNT(*) AS Numbers
FROM
    (SELECT *
    FROM MovieDetails
    WHERE Release_Date LIKE '%2017%') AS t1
    INNER JOIN ProductionDetails ON t1.ID = ProductionDetails.ID
WHERE Production_Country = 'United States of America' OR Production_Country = 'Canada' OR Production_Country = 'China'
GROUP BY Genres
ORDER BY Production_Country;

# d
SELECT Director_Name, Title, Genres, Production_Company
FROM
    (SELECT MovieDetails.ID, Genres, Title, Vote_Average
    FROM MovieDetails INNER JOIN Voting ON MovieDetails.ID = Voting.ID
    ORDER BY Vote_Average DESC LIMIT 10) AS t1
    INNER JOIN DirectedBy ON DirectedBy.ID = t1.ID
    INNER JOIN ProductionDetails ON ProductionDetails.ID = t1.ID;

# i
SELECT Title, Genres
FROM(
    SELECT Genres, Title, MAX(Vote_Average)
    FROM
        (SELECT MovieDetails.ID, Genres, Title
        FROM MovieDetails
        WHERE Release_Date LIKE '%2017%' OR Release_Date LIKE '%2016%' OR Release_Date LIKE             '%2015%' OR Release_Date LIKE '%2014%' OR Release_Date LIKE '%2013%' OR Release_Date             LIKE '%2012%' OR Release_Date LIKE '%2011%' OR Release_Date LIKE '%2010%' OR                     Release_Date LIKE '%2009%' OR Release_Date LIKE '%2008%' OR Release_Date LIKE '%2007%'
        GROUP BY Genres) AS t1 INNER JOIN Voting ON t1.ID = Voting.ID
    GROUP BY Genres) as t2;

# M
SELECT *
FROM
    (SELECT Name, COUNT(distinct Casting.ID) AS Number
    FROM Casting INNER JOIN MovieDetails ON Casting.ID = MovieDetails.ID
    WHERE Original_language = 'en'
    GROUP BY Name
    HAVING COUNT(distinct Casting.ID) > 100) as t1
ORDER BY Number DESC LIMIT 1;

# O
SELECT Name, COUNT(ID) AS Number
FROM Casting
GROUP BY Name
HAVING Number > 100;

