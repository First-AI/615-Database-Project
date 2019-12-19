##  Code for Final Project - Movie database

### Step1: Preprocess
* Download the raw dataset from https://www.kaggle.com/stephanerappeneau/350-000-movies-from-themoviedborg.
* Please ensure to download and install latest version of R to reproduce this step; Also, please install the packages: data.table, dplyr, tidyr
* Run the './code/1preprocess.R' in either local computer or on CS cluster
```
## CS Cluster
if necessary: module load R
Rscript ./code/1preprocess.R
```

### Step 2: Finalize the dataset
* Run the './code/2generate_table.R' in either local computer or on CS cluster
```
## CS Cluster
if necessary: module load R
Rscript ./code/2generate_table.R
```
### Step3: Load the final dataset into MySQL dbase
* Drop all the tables
* Create tables using DDL and load the final dataset using './code/3create_table.sql'
```
log in the dbase
\. FILEPATH_3create_table.sql
```

### Step4: SQL queries
* Run the example queries listed in the report using './code/sql_summary.sql'
* Boyang Zhang was primarily responsible for part 1 queries, as listed in 'sql-part1-boyang.sql' and Feng Zhang was primarily responsible for part 2 queries, as listed in 'sql-part2-feng.sql'. The './code/sql_summary.sql' file is concatenating part1 and part 2 queries.
```
log in the dbase
\. FILEPATH_sql_summary.sql
```

### Step5: GUI
* User can use this link: http://ugrad.cs.jhu.edu/~fzhang43/movie.html to select and browse their movie of interest.
