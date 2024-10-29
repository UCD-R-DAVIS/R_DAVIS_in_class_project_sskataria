library(tidyverse)
read.csv("data/portal_data_joined.csv")
surveys%>%
  filter(weight>30 & weight<60)
print(surveys%>%head(6))


##biggest critters--

biggest_critters<-surveys%>%
  filter(!is.na(weight))%>%
  group_by(species_id, sex)%>%
  summarise(max_weight=max(weight))%>%
  arrange(max_weight)

print(biggest_critters)

##exploring na--

surveys%>%
  filter(!is.na(weight))%>%
  group_by(species)%>%
  tally()

surveys%>%
  filter(!is.na(weight))%>%
  group_by(weight)%>%
  tally()

surveys%>%
  filter(!is.na(weight))%>%
  group_by(plot_id)%>%
  tally()

##surveys avg weight--

surveys_avg_weight<-surveys%>%
  group_by(species, sex) %>%
  mutate(avg_weight = mean(weight)) %>%
  select(species, sex, weight, avg_weight)

print(surveys_avg_weight)

surveys_avg_weight <- surveys_avg_weight %>%
  mutate(above_average = weight > avg_weight)

print(surveys_avg_weight)
