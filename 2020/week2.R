library(tidyverse)
library(lubridate)
library(tidytuesdayR)

# Get data via tidytuesdayR
tuesdata <- tidytuesdayR::tt_load(2020, week = 2)
rainfall <- tuesdata$rainfall
temperature_df <- tuesdata$temperature

# Plot the max and min of temperatures at each location ----
# Separate the date; keep only 2000 onwards
temperature_recent <- temperature_df %>%
  separate(date, c("year", "month", "day")) %>%
  filter(year >= 2010)

temperature_grouped <- temperature_recent %>%
  group_by(city_name, temp_type, year) %>%
  summarise(mean = round(mean(temperature, na.rm = TRUE), 2)) %>%
  group_by(city_name, year) %>%
  mutate(city_annual_mean = round(mean(mean), 2))

ggplot(data = temperature_grouped, mapping = aes(x = as.numeric(year), y = city_annual_mean, colour = city_name)) +
  geom_line() +
  labs(x = "Year",
       y = "Annual mean temperature (celsius)",
       colour = "City") +
  theme_linedraw()


# Box fill of temperautre. 
temperature_cleaned <- temperature_df %>%
  filter(temp_type == "max") %>%
  mutate(year = year(date)) %>%
  mutate(month_n = month(date)) %>%
  filter(year >= 1970) %>%
  mutate(month = factor(months(date), levels = c("January", "February", "March", "April", "May", "June", "July", "August", "September", "October", "November", "December"))) %>%
  group_by(year, month, month_n) %>%
  summarise(temp = mean(temperature, na.rm = TRUE))

ggplot(data = temperature_cleaned, mapping = aes(x = year, y = reorder(month, -month_n), fill = temp)) +
  geom_tile(linetype = "dotted", color = "white", size = .2) +
  scale_fill_gradientn(colors=c("#2c7bb6", "#abd9e9", "#fdae61", "#d7191c")) +
  scale_x_discrete(breaks=seq(1970, 2020, 10), limits = seq(1970, 2020, 10)) +
  labs(x = "Year",
       y = "Month",
       fill = "Temperature (max average)",
       title = "Australian temperatures") +
  theme_minimal()


# Box fill of rainfall
rainfall_cleaned <- rainfall %>%
  filter(year >= 1970) %>%
  rename(month_n = month) %>%
  mutate(month = factor(recode(month_n, "01" = "Jan", "02" = "February", "03" = "March", "04" = "April", "05" = "May", "06" = "June", 
                                 "07" = "July", "08" = "August", "09" = "September", "10" = "October", "11" = "November", "12" = "December"))) %>%
  group_by(year, month, month_n) %>%
  summarise(rainf = sum(rainfall, na.rm = TRUE))

ggplot(data = rainfall_cleaned, mapping = aes(x = year, y = reorder(month, -as.numeric(month_n)), fill = rainf)) +
  geom_tile(linetype = "dotted", color = "white", size = .2) +
  scale_fill_gradientn(colors=c("aliceblue", "cornflowerblue", "blue2", "blue4")) +
  scale_x_discrete(breaks=seq(1970, 2020, 10), limits = seq(1970, 2020, 10)) +
  labs(x = "Year",
       y = "Month",
       fill = "rainfall (mm)",
       title = "Australian sum of rainfall levels") +
  theme_minimal()
 