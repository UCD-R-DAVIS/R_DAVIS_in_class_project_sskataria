install.packages("tidyverse")
month_day_year<-select(surveys,month,day,year)
#filtering by equals-
#year_1981<-filter(surveys,year==1981)-
library(tidyverse)
surveys<-read.csv("data/portal_data_joined.csv")

#Filetering by range-
the80s<-surveys[surveys$year%in%1981:1983,]
thetidy80s<-filter(surveys,year%in%1981:1983)

#review, you should never do-
#& sign makes more strict data, or operator makes it loose-
#multi step proces-
small_animals<-filter(surveys,weight<5)
#select small animals,record id, plot id--
#nested functions-#filter weight <5, select all 3 ids as selected above, select the command-
#same process using pipe#
#cmnd shift M-
#., operation-

#line breaks-
#codes can also be broken into multiple lines, after open prenthesis,pipe etc, play around a bit with diff code lines you can go in the next line--
#mini tiny little data frame for low volume data-

#mutate : adds a new column-
surveys<-surveys%>%
    mutate(.,weight_kg=weight/1000)
surveys <- surveys %>%
  mutate(weight_kg = weight/1000)
ave_weight<-surveys%>%
filter(!is.na(weight))%>%  
  
  
  
surveys%>%
group_by(sex)%>%  
  
  #sort/arrange-