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

