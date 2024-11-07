##midterm--

## url<-, df<- read_csv(url), head(df), df%>%, filter(sport== running)%>%
## filter(sport== "running", & minutes_per_mile <=10 & minutes_per_mile >=5 & 
##total_time_elapsed...), then do mutate commands on miles, fast, medium and slow variables--
## mutate form, use if else for year, pivot wider?--

library(tidyverse)
library(ggplot2)


ggplot(diamonds, aes(x = clarity, y= carat, color= clarity)) + 
  geom_boxplot() + theme_classic() +
  scale_fill_brewer("Purd")



stat_smooth(method= "loess")
ggtitle("price")
ylab("carat")
install.packages("RColorBrewer")
library(RColorBrewer)


library(cowplot)
install.packages("cowplot")
library(cowplot)
library(cowplot)
