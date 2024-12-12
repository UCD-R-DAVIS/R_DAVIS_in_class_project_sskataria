library(tidyverse)

url <- "https://raw.githubusercontent.com/UCD-R-DAVIS/R-DAVIS/refs/heads/main/data/tyler_activity_laps_12-6.csv"

tyler_data <- read_csv(url)

##2--

running_laps <- tyler_data %>%
  filter(sport == 'running') %>%
  filter(total_elapsed_time_s >= 60) %>%
  filter(minutes_per_mile < 10 & minutes_per_mile > 5)

##3--

running_laps <- running_laps %>%
  mutate(
    pace_cat = case_when(
      minutes_per_mile < 6 ~ 'fast',
      minutes_per_mile >= 6 & minutes_per_mile < 8 ~ 'medium',
      TRUE ~ 'slow'), form = case_when(
        year == 2024 ~ 'new form',
        TRUE ~ 'old form'))

spm_summary <- running_laps %>%
  group_by(form, pace_cat) %>%
  summarize(avg_spm = mean(steps_per_minute, na.rm = TRUE)) %>%
  pivot_wider(id_cols = form, values_from = avg_spm, names_from = pace_cat) %>%
  select(form, slow, medium, fast)

##4--

time_periods <- running_laps %>%
  filter(form == 'new form') %>%
  mutate(months = ifelse(month %in% 1:6, 'early 2024', 'late 2024')) %>%
  group_by(months) %>%
  summarize(
    min_spm = min(steps_per_minute, na.rm = TRUE),
    median_spm = median(steps_per_minute, na.rm = TRUE),
    mean_spm = mean(steps_per_minute, na.rm = TRUE),
    max_spm = max(steps_per_minute, na.rm = TRUE))


##5--

running_laps %>%
  ggplot(aes(x = minutes_per_mile, y = steps_per_minute, color = form)) +
  geom_point(alpha = 0.6) +
  geom_smooth(method = "lm", se = FALSE) +  # Linear trendlines
  labs(
    title = "Relationship Between Speed and Strides-Per-Minute",
    x = "Speed (mph)",
    y = "Strides Per Minute",
    color = "Form") + theme_minimal()


##8--

post_intervention <-  running_laps %>%
  filter(form == "new form") %>%
  mutate(
    months = ifelse(month %in% 1:6, "early 2024", "late 2024"))

post_intervention <- post_intervention %>%
  group_by(timestamp) %>%
  mutate(lap_rank = row_number()) %>%
  ungroup() %>%
  filter(lap_rank <= 3)

post_intervention%>%
  ggplot(aes(x = lap_rank, y = steps_per_minute, color = minutes_per_mile)) +
  geom_line(size = 1.2, alpha = 0.8,) +
  geom_point(size = 3) +
  scale_color_gradient(low = "blue", high = "red") +
  labs(
    title = "Strides-Per-Minute vs. Lap Rank (New Form)",
    x = "Lap Rank",
    y = "Strides Per Minute",
    color = "Speed (mph)"
  ) +
  theme_minimal(base_size = 14)
