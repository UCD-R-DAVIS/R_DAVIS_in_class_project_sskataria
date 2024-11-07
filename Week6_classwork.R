library(tidyverse)

surveys_complete <- read_csv("data/portal_data_joined.csv") %>% 
  filter(complete.cases(.))


ggplot(data = surveys, mapping=aes(x= weight, y= hindfoot_length)) +
  geom_point(aes(color= genus)) +
  geom_smooth()



ggplot(data = surveys, mapping=aes(x= weight, y= hindfoot_length, color= genus)) +
  geom_point() +
  geom_smooth()


##ggplot(data = surveys_wide, aes(x= weight, y= hindfoot_length))+
##geom_boxplot

head(surveys_complete %>% count(year, species_id))
head(surveys_complete%>% group_by(year, species_id))%>% tally()




## facet_wrap(~species_id)--

yearly_counts <- surveys_complete %>%
  count(year, species_id) 

ggplot(data = yearly_counts, mapping = aes(x = year, y = n)) +
  geom_line()

facet_wrap(~species_id)

theme_bw()
library(ggthemes)
theme_dark()

library(tigris)
library(sf)

##ca_counties= tigris::counties(state= "CA", class="sf")--
install.packages("ggthemes")
library(tigris)
library(ggthemes)
install.packages(tigris)
library(tigris)
install.packages("tigris")
library(tigris)

install.packages("sf")

install.packages("sf")

library(sf)

ca_counties= tigris::counties(state = "CA", class("sf"))
