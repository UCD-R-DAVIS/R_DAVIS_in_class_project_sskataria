surveys<-read.csv("data/portal_data_joined.csv")
surveys_base <- surveys[1:5000, c("species_id", "weight", "plot_type")]
surveys_base$species_id <- as.factor(surveys_base$species_id)
surveys_base$plot_type <- as.factor(surveys_base$plot_type)
surveys_base <- surveys_base[complete.cases(surveys_base), ]
## Challeneg==
challenge_base <- surveys_base[surveys_base$weight > 150, ]
