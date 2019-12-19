## preprocess dataset
library(data.table)
library(dplyr)

## 1. AllMoviesCastingRaw.csv
cast.raw = fread("./data/raw/AllMoviesCastingRaw.csv") %>% data.frame
write.csv(cast.raw,"./data/proc/Casting.csv",row.names = F)

## 2. language to country
lang.raw = fread("./data/raw/language to country.csv") %>% data.frame
write.csv(lang.raw,"./data/proc/Language.csv",row.names = F)

## 3. language by director
dirlang.raw = fread("./data/raw/MostCommonLanguageByDirector.csv") %>% data.frame
write.csv(dirlang.raw,"./data/proc/LanguageByDirector.csv",row.names = F)

## 4. Movie details
md.raw = fread("./data/raw/AllMoviesDetailsCleaned.csv") %>% data.frame
write.csv(md.raw,"./data/proc/MovieDetails.csv",row.names = F)

## 5. DirectorAward
da.raw = fread("./data/raw/220k_awards_by_directors.csv") %>% data.frame
write.csv(da.raw,"./data/proc/AwardByDirector.csv",row.names = F)
