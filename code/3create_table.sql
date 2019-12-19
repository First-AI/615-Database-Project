## 1. Actor
CREATE TABLE Actor (
    Name VARCHAR(255) NOT NULL,
    Gender CHAR(10) NOT NULL,
    PRIMARY KEY (Name)
);

# load data
LOAD DATA LOCAL INFILE '/home/bzhang34/db/Actor.csv' 
INTO TABLE Actor 
FIELDS TERMINATED BY ',' 
ENCLOSED BY '"'
LINES TERMINATED BY '\n'
IGNORE 1 LINES;

## 2. Award
CREATE TABLE Award (
    Ceremony VARCHAR(255) NOT NULL,
    Award_Name VARCHAR(255) NOT NULL,
    PRIMARY KEY (Ceremony,Award_Name)
);

LOAD DATA LOCAL INFILE '/home/bzhang34/db/Award.csv' 
INTO TABLE Award 
FIELDS TERMINATED BY ',' 
ENCLOSED BY '"'
LINES TERMINATED BY '\n'
IGNORE 1 LINES;

## 3. Director
CREATE TABLE Director (
    Director_Name VARCHAR(255) NOT NULL,
    Director_Gender CHAR(10) NOT NULL,
    PRIMARY KEY (Director_Name)
);

LOAD DATA LOCAL INFILE '/home/bzhang34/db/Director.csv' 
INTO TABLE Director 
FIELDS TERMINATED BY ',' 
ENCLOSED BY '"'
LINES TERMINATED BY '\n'
IGNORE 1 LINES;


## 4. Award_by_directors
CREATE TABLE Award_by_directors (
    Director_Name VARCHAR(255) NOT NULL,
    Ceremony VARCHAR(255) NOT NULL,
    Award_Name VARCHAR(255) NOT NULL,
    Year INT(4) NOT NULL,
    Outcome VARCHAR(255) NOT NULL,
    FOREIGN KEY (Director_Name) REFERENCES Director(Director_Name),
    FOREIGN KEY (Ceremony) REFERENCES Award(Ceremony),
    FOREIGN KEY (Award_Name) REFERENCES Award(Award_Name)
);

LOAD DATA LOCAL INFILE '/home/bzhang34/db/Award_by_directors.csv' 
INTO TABLE Award_by_directors 
FIELDS TERMINATED BY ',' 
ENCLOSED BY '"'
LINES TERMINATED BY '\n'
IGNORE 1 LINES;

## 5. MovieDetails
CREATE TABLE MovieDetails (
    ID INT(10) NOT NULL,
    Genres VARCHAR(255) NOT NULL,
    IMDB_ID CHAR(100) NOT NULL,
    Original_Language CHAR(10) NOT NULL,
    Original_Title VARCHAR(255) NOT NULL,
    Release_Date VARCHAR(255) NOT NULL,
    Runtime INT(10) NOT NULL,
    Spoken_Languages VARCHAR(100) NOT NULL,
    Status CHAR(25) NOT NULL,
    Title VARCHAR(255) NOT NULL,
    Number_Spoken_Languages INT(10) NOT NULL,
    IMDB_Link VARCHAR(100) NOT NULL,
    PRIMARY KEY (ID)
);

LOAD DATA LOCAL INFILE '/home/bzhang34/db/MovieDetails.csv' 
INTO TABLE MovieDetails 
FIELDS TERMINATED BY ',' 
ENCLOSED BY '"'
LINES TERMINATED BY '\n'
IGNORE 1 LINES;

## 6. Investment
CREATE TABLE Investment (
    ID INT(10) NOT NULL,
    Budget INT(100) NOT NULL,
    Revenue INT(100) NOT NULL,
    FOREIGN KEY (ID) REFERENCES MovieDetails(ID)
);

LOAD DATA LOCAL INFILE '/home/bzhang34/db/Investment.csv' 
INTO TABLE Investment 
FIELDS TERMINATED BY ',' 
ENCLOSED BY '"'
LINES TERMINATED BY '\n'
IGNORE 1 LINES;

## 7. Voting
CREATE TABLE Voting (
    ID INT(10) NOT NULL,
    Vote_Count INT(10) NOT NULL,
    Vote_Average DECIMAL(2,1) NOT NULL,
    Popularity DECIMAL(4,4) NOT NULL,
    FOREIGN KEY (ID) REFERENCES MovieDetails(ID)
);

LOAD DATA LOCAL INFILE '/home/bzhang34/db/Voting.csv' 
INTO TABLE Voting 
FIELDS TERMINATED BY ',' 
ENCLOSED BY '"'
LINES TERMINATED BY '\n'
IGNORE 1 LINES;

## 8. Language
CREATE TABLE Language (
    Language CHAR(5) NOT NULL,
    Country CHAR(5) NOT NULL,
    Language_Fullname CHAR(30) NOT NULL,
    PRIMARY KEY (Language)
);

LOAD DATA LOCAL INFILE '/home/bzhang34/db/Language.csv' 
INTO TABLE Language 
FIELDS TERMINATED BY ',' 
ENCLOSED BY '"'
LINES TERMINATED BY '\n'
IGNORE 1 LINES;

## 9. Casting
CREATE TABLE Casting (
    ID INT(10) NOT NULL,
    Name VARCHAR(255) NOT NULL,
    FOREIGN KEY (ID) REFERENCES MovieDetails(ID),
    FOREIGN KEY (Name) REFERENCES Actor(Name)
);

LOAD DATA LOCAL INFILE '/home/bzhang34/db/Casting.csv' 
INTO TABLE Casting 
FIELDS TERMINATED BY ',' 
ENCLOSED BY '"'
LINES TERMINATED BY '\n'
IGNORE 1 LINES;

## 10. DirectedBy
CREATE TABLE DirectedBy (
    ID INT(10) NOT NULL,
    Director_Name VARCHAR(255) NOT NULL,
    FOREIGN KEY (ID) REFERENCES MovieDetails(ID),
    FOREIGN KEY (Director_Name) REFERENCES Director(Director_Name)
);

LOAD DATA LOCAL INFILE '/home/bzhang34/db/DirectedBy.csv' 
INTO TABLE DirectedBy 
FIELDS TERMINATED BY ',' 
ENCLOSED BY '"'
LINES TERMINATED BY '\n'
IGNORE 1 LINES;

## 11. Language_by_directors
CREATE TABLE Language_by_directors (
    Director_Name VARCHAR(255) NOT NULL,
    Language CHAR(5) NOT NULL,
    Language_Fullname CHAR(30) NOT NULL,
    FOREIGN KEY (Director_Name) REFERENCES Director(Director_Name),
    FOREIGN KEY (Language) REFERENCES Language(Language),
    FOREIGN KEY (Language_Fullname) REFERENCES Language(Language_Fullname)
);

LOAD DATA LOCAL INFILE '/home/bzhang34/db/Language_by_directors.csv' 
INTO TABLE Language_by_directors 
FIELDS TERMINATED BY ',' 
ENCLOSED BY '"'
LINES TERMINATED BY '\n'
IGNORE 1 LINES;

## 12. ProductionDetails
CREATE TABLE ProductionDetails (
    ID INT(10) NOT NULL,
    Producer_Name VARCHAR(255) NOT NULL,
    Screenplay_Name VARCHAR(255) NOT NULL,
    Editor_Name VARCHAR(255) NOT NULL,
    Production_Country CHAR(50) NOT NULL,
    Production_Company CHAR(150) NOT NULL,
    FOREIGN KEY (ID) REFERENCES MovieDetails(ID)
);

LOAD DATA LOCAL INFILE '/home/bzhang34/db/ProductionDetails.csv' 
INTO TABLE ProductionDetails 
FIELDS TERMINATED BY ',' 
ENCLOSED BY '"'
LINES TERMINATED BY '\n'
IGNORE 1 LINES;



