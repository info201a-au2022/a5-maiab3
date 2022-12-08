library(dplyr)
library(tidyverse)

# reading in the file
c02_data <- read.csv("https://raw.githubusercontent.com/owid/co2-data/master/owid-co2-data.csv")

# part 1: 3 relevant values of interest
# which year had the highest GDP?
highest <- c02_data %>% 
  filter(gdp == max(gdp, na.rm = TRUE)) %>% 
  pull(year)

# what was the average c02 emissions rate in 2018 per country?
change <- c02_data %>% 
  select(country, year, co2) %>% 
  filter(year == "2018") %>% 
  replace(is.na(.), 0) %>% 
  group_by(country) %>% 
  summarise(avg_c02_emissions = mean(co2, na.rm = TRUE)) 

# how have these averages changed over the last 30 years (since 1990)?
avg_change <- c02_data %>% 
  select(country, year, co2) %>% 
  filter(year == "1990") %>% 
  replace(is.na(.), 0) %>% 
  group_by(country) %>% 
  summarise(avg_c02_emissions = mean(co2, na.rm = TRUE)) 

first <- change$avg_c02_emissions
second <- avg_change$avg_c02_emissions
difference <- first - second 