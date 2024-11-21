library(tidyverse)

mloa <- read_csv("https://raw.githubusercontent.com/ucd-r-davis/R-DAVIS/master/data/mauna_loa_met_2001_minute.csv")

mloa_2 <- mloa %>%
  filter(!is.na(rel_humid), !is.na(temp_C_2m), !is.na(windSpeed_m_s))

mloa_2<- mloa_2%>%
  mutate(datetime = ymd_hm(paste0(year,"-", month, "-", day," ", hour24, ":", min),
                           tz = "UTC")) %>%
  mutate(datetimeLocal = with_tz(datetime, tz = "Pacific/Honolulu"))

## Mean hourly temp--

monthly_mean_temp <- mloa_2 %>%
  mutate(month = month(datetimeLocal), hour = hour(datetimeLocal)) %>%
  group_by(month, hour) %>%
  summarize(mean_temp = mean(temp_C_2m))


## gg plot--

ggplot(monthly_mean_temp, aes(x = month, y = mean_temp, color = as.factor(hour))) +
  geom_point() +
  scale_color_viridis_d() +
  labs(title = "Mean Monthly Temperature at Mauna Loa",
       x = "Month",
       y = "Mean Temperature (°C)") +
  theme_minimal()
  