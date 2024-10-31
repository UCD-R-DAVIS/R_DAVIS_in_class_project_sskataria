library(tidyverse)

surveys<-read.csv("data/portal_data_joined.csv")

surveys_wide<-surveys%>%
  group_by(genus, plot_type)%>%
  summarize(mean_hindfoot_length=mean(hindfoot_length, na.rm = TRUE))%>%
  pivot_wider(names_from = plot_type, values_from = mean_hindfoot_length)%>%
  arrange(Control)

summary_weight<-summary(surveys$weight)
print(summary_weight)


surveys%>% 
  mutate(weight_cat = ifelse(weight <= 20.00, "small",
                             ifelse(weight > 20.00 & weight < 48.00, "medium","large")))


surveys%>%
  mutate(weight_cat= case_when(weight<=20.00~"small", weight>20.00 & 
                                 weight < 48.00 ~ "medium", TRUE~"large"))




