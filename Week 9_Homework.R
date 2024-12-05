for(i in unique(surveys$taxa)){
  my_current_taxon <- surveys[surveys$taxa == i,]
  longest_species_names <- mytaxon[nchar(mytaxon$species) == max(nchar(mytaxon$species)),] %>% select(species)
  print(paste0("The longest species name(s) among ", i, "s is/are: "))
  print(unique(longestnames$species))
}

## Part 2--

mloa <- read_csv("https://raw.githubusercontent.com/ucd-cepb/R-DAVIS/master/data/mauna_loa_met_2001_minute.csv")

columns_of_interest <- mloa %>%
  select("windDir", "windSpeed_m_s", "baro_hPa", "temp_C_2m", "temp_C_10m", "temp_C_towertop", "rel_humid", "precip_intens_mm_hr")
columns_of_interest %>% map(~max(.x, na.rm = TRUE))

## Part 3--

C_to_F <- function(tempC) {
  tempF <- tempC * 1.8 + 32
  return(tempF)
}

mloa$temp_F_2m <- C_to_F(mloa$temp_C_2m)
mloa$temp_F_10m <- C_to_F(mloa$temp_C_10m)
mloa$temp_F_towertop <- C_to_F(mloa$temp_C_towertop)

## Bonus--

mloa %>%
  select(c("temp_C_2m", "temp_C_10m", "temp_C_towertop")) %>%
  map_df(C_to_F) %>%
  rename("temp_F_2m" = "temp_C_2m", "temp_F_10m" = "temp_C_10m", "temp_F_towertop" = "temp_C_towertop") %>%
  bind_cols(mloa)


