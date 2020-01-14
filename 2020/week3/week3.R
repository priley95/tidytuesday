library(tidyverse)
library(ggwordcloud)
library(tidytuesdayR)

# Get the data
passwords <- readr::read_csv('https://raw.githubusercontent.com/rfordatascience/tidytuesday/master/data/2020/2020-01-14/passwords.csv')

passwords_cleaned <- passwords %>%
  mutate(category = as_factor(category)) %>%
  na.omit()

passwords_cool_macho <- passwords_cleaned %>%
  filter(category == "cool-macho")

# Wordcloud!!
ggplot(data = passwords_cleaned, mapping = aes(label = password, size = rev(rank))) +
  geom_text_wordcloud_area(area_corr = TRUE, rm_outside = TRUE) +
  scale_size_area(max_size = 20) +
  theme_minimal() +
  ggtitle("Hello")

ggplot(data = passwords_cool_macho, mapping = aes(label = password, size = font_size,
  color = factor(sample.int(10, nrow(passwords_cool_macho), replace = TRUE)))) +
  geom_text_wordcloud(shape = "circle") +
  theme_minimal()
