##Pop diff--

gapminder_pop_diff <- gapminder %>%
  filter(year %in% c(2002, 2007)) %>%
  select(country, year, pop, continent) %>%
  spread(key = year, value = pop) %>%
  rename(pop_2002 = `2002`, pop_2007 = `2007`) %>%
  mutate(pop_diff = pop_2007 - pop_2002)

##gg plot--

ggplot(gapminder_pop_diff, aes(x = reorder(country, pop_diff), y = pop_diff, fill = continent)) +
  geom_bar(stat = "identity", color = "blue") +
  facet_wrap(~continent, scales = "free") + 
  scale_fill_brewer(palette = "Set3") +
  theme_minimal() +
  theme(
    axis.text.x = element_text(angle = 45, hjust = 1),
    strip.text = element_text(size = 12)) +
  labs(title = "Population Difference (2007 - 2002)",
       x= "Country", y= "Population Difference")


