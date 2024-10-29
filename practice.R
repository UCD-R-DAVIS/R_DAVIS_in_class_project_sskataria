library(tidyverse)
read.csv("data/portal_data_joined.csv")

summary(surveys$hindfoot_length)

surveys$hindfoot_length<29.29

surveys$hindfoot_cat<-ifelse(surveys$hindfoot_length<29.29, yes = "big", no="small")
head(survey$hindfoot_cat)
head(surveys$hindfoot_cat)

head(surveys$hindfoot_length)

surveys$hindfoot_lenth<-ifelse(surveys$hindfoot_length<mean(surveys$hindfoot_length, na.rm = TRUE), yes = "big", no="small")

head(surveys$hindfoot_lenth)
head(surveys$hindfoot_cat)

surveys%>%
  mutate(hindfoot_cat=case_when(hindfoot_length>29.29~"small",is.na(hindfoot_length)~NA_character_,
                                TRUE~"big"))%>%
  select(hindfoot_length,hindfoot_cat)%>%
  head()


surveys%>%
  mutate(hindfoot_cat=case_when(hindfoot_length>31.5~"small",hindfoot_length>29~"medium",
                                is.na(hindfoot_length)~NA_character_,
                                TRUE~"big"))%>%
  select(hindfoot_length,hindfoot_cat)%>%
  group_by(hindfoot_cat)%>%
  tally()


summary(iris$Petal.Length)
print(iris)


tail<-read.csv("data/portal_data_joined.csv")
head(tail)
dim(tail)

tail2<-read.csv("data/tail_length.csv")
head(tail2)
dim(tail2)
