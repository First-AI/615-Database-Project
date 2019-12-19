library(dplyr)
library(data.table)
library(tidyr)
options(stringsAsFactors = F)


tmp1 = fread("./data/proc/AwardByDirector.csv") %>% data.frame()
tmp2 = fread("./data/proc/Casting.csv") %>% data.frame()
tmp3 = fread("./data/proc/MovieDetails.csv") %>% data.frame
tmp4 = fread("./data/proc/Language.csv") %>% data.frame
tmp5 = fread("./data/proc/language-codes.csv") %>% data.frame
colnames(tmp5)=c("Language","Language_Fullname")

## 1. Award
award = tmp1[,c("ceremony","category")] %>% unique
colnames(award)=c("Ceremony","Award_Name")
write.csv(award,"./data/final/Award.csv",row.names = F)

## 2. AwardByDirectors
awd.by.dir = tmp1[,c("director_name","ceremony","category","year","outcome")] %>% unique
colnames(awd.by.dir)=c("Director_Name","Ceremony","Award_Name","Year","Outcome")
write.csv(awd.by.dir,"./data/final/Award_by_directors.csv",row.names = F)

## 3. Director
director = tmp2[,c("director_name","director_gender")] %>% unique
colnames(director)=c("Director_Name","Director_Gender")
director$Director_Gender=ifelse(director$Director_Gender==0,"Unknown",
                                ifelse(director$Director_Gender==1,"F","M"))
write.csv(director,"./data/final/Director.csv",row.names = F)

## 4. DirectedBy
directedby = tmp2[,c("id","director_name")] %>% unique
colnames(directedby)=c("ID","Director_Name")
write.csv(directedby,"./data/final/DirectedBy.csv",row.names = F)

## 5. MovieDetails
moviedetails = tmp3[,c("id","genres","imdb_id","original_language","original_title","release_date",
                       "runtime","spoken_languages","status","title","spoken_languages_number")] %>% unique
colnames(moviedetails)=c("ID","Genres","IMDB_ID","Original_Language","Original_Title","Release_Date",
                         "Runtime","Spoken_Languages","Status","Title","Number_Spoken_Languages")
moviedetails$IMDB_Link = paste0("https://www.imdb.com/title/",moviedetails$IMDB_ID,"/")
moviedetails$Runtime[is.na(moviedetails$Runtime)] = 'NULL'
write.csv(moviedetails,"./data/final/MovieDetails.csv",row.names = F)

## 6. Investment
invest = tmp3[,c("id","budget","revenue")] %>% unique ##0: unknown
colnames(invest)=c("ID","Budget","Revenue")
write.csv(invest,"./data/final/Invest.csv",row.names = F)

## 7. Votings
voting = tmp3[,c("id","vote_count","vote_average","popularity")] 
colnames(voting)=c("ID","Vote_Count","Vote_Average","Popularity")
voting$Popularity = as.numeric(voting$Popularity)
voting$Popularity[is.na(voting$Popularity)] <- 0 ## small numbers, round to 0.
write.csv(voting,"./data/final/Voting.csv",row.names = F)

## 8. Language
lan = left_join(tmp4,tmp5) %>% unique
write.csv(lan,"./data/final/Language.csv",row.names = F)

## 9. Language By Directors
lan.by.dir1 = tmp1[,c("director_name","original_language")] %>% unique
colnames(lan.by.dir1) = c("Director_Name","Language")
lan.by.dir = left_join(lan.by.dir1,lan[,-2])
write.csv(lan.by.dir,"./data/final/Language_by_directors.csv",row.names = F)

## 10. Actors
actors = rbind(cbind(tmp2$actor1_name,tmp2$actor1_gender),
               cbind(tmp2$actor2_name,tmp2$actor2_gender),
               cbind(tmp2$actor3_name,tmp2$actor3_gender),
               cbind(tmp2$actor4_name,tmp2$actor4_gender),
               cbind(tmp2$actor5_name,tmp2$actor5_gender)) %>% unique %>% data.frame
colnames(actors) = c("Name","Gender")
actors$Gender=as.numeric(actors$Gender)
actors$Gender=ifelse(actors$Gender==0,"Unknown",
                     ifelse(actors$Gender==1,"F","M"))
actors = actors[-which(actors$Name=="none"),]
write.csv(actors,"./data/final/Actor.csv",row.names = F)

## 11. Casting
casting = tmp2[,c(1,2,4,6,8,10)] %>% gather(key,Name,actor1_name:actor5_name) %>% select(id,Name) %>% arrange(id) %>% unique
casting = casting[-which(casting$Name %in% c("none","None")),]
colnames(casting)=c("ID","Name")
write.csv(casting,"./data/final/Casting.csv",row.names = F)

## 12. ProducedBy
prod.by = inner_join(tmp2[,c("id","producer_name","screeplay_name","editor_name")],tmp3[,c("id","production_countries","production_companies")]) %>% unique
colnames(prod.by) = c("ID","Producer_Name","Screenplay_Name","Editor_Name","Production_Country","Production_Company")
write.csv(prod.by,"./data/final/ProductionDetails.csv",row.names = F)

