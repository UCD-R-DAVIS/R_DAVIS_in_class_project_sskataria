library(tidyverse)

gapminder <- read_csv("https://ucd-r-davis.github.io/R-DAVIS/data/gapminder.csv")


gapminder%>%
  filter(!is.na(lifeExp))%>%
  group_by(continent, year)%>%
  summarise(mean_lifeExp= mean(lifeExp))%>%
  ggplot(aes(x= year, y= mean_lifeExp, color= continent))+
  geom_line()+
  geom_point()

##Challenge--

gapminder%>%
  filter(!is.na(lifeExp))%>%
  group_by(continent, year)%>%
  summarise(mean_lifeExp= mean(lifeExp))%>%
  ggplot(aes(x= year, y= mean_lifeExp, color= continent))+
  geom_line()+
  geom_point(alpha= 0.5)

## Question 2--
## scale_x_log10() is compressing a large amount of data and distributing
## it in the plot which is more visually appealing and easier to read--

## geom_smooth() is adding a black dashed line in the plot which portrays
## the relationship or trend between x axis and y axis, it is helpful in 
##showing the overall trends in a plot--

##Question 3--

countries <- c("Brazil", "China", "El Salvador", "Niger", "United States")

gapminder%>% 
  filter(country %in% countries)%>%
  ggplot(aes(x = country, y = lifeExp)) +
  geom_boxplot(alpha = 0) +
  geom_jitter(alpha = 0.3, color = "tomato") +
  ggtitle("Life Expectancy of Five Countries") +
    xlab("Country") + ylab("Life Expectancy") +
  facet_wrap(~country)
  
  
  
                                        
  
  
  
