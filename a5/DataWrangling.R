library(dplyr)
library(tidyverse)

# Reading in + modifying the data set
df <- read.csv("https://raw.githubusercontent.com/owid/co2-data/master/owid-co2-codebook.csv")
df <- df[1]
data <- read.csv("https://raw.githubusercontent.com/owid/co2-data/master/owid-co2-data.csv")
data <- merge(df, data)

# part 1: 3 relevant values of interest
# which year had the highest GDP?
highest <- data %>% 
  filter(gdp == max(gdp, na.rm = TRUE)) %>% 
  pull(year)

# what was the average c02 emissions rate in 2018 per country?
change <- data %>% 
  select(country, year, co2) %>% 
  filter(year == "2018") %>% 
  replace(is.na(.), 0) %>% 
  group_by(country) %>% 
  summarise(avg_c02_emissions = mean(co2, na.rm = TRUE)) %>% 
  head(10)

# how have these averages changed over the last 30 years (since 1990)?
avg_change <- data %>% 
  select(country, year, co2) %>% 
  filter(year == "1990") %>% 
  replace(is.na(.), 0) %>% 
  group_by(country) %>% 
  summarise(avg_c02_emissions = mean(co2, na.rm = TRUE)) %>% 
  head(10)

first <- change$avg_c02_emissions
second <- avg_change$avg_c02_emissions
difference <- first - second 

new <- merge(avg_change, difference) %>% 
      rename(difference = y) %>% 
      head(10)
