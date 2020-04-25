\#tidytuesday Week 4 2020 - Spotify Songs
================

[The Spotify Songs
dataset](https://github.com/rfordatascience/tidytuesday/blob/master/data/2020/2020-01-21/readme.md)
contains data on over 30,000 songs available on the streaming service,
Spotify. The dataset contains expected variables, such as the track
name, artist and album - as well as assigned variables likely ranked by
Spotify such as “danceability” and “acousticness”.

``` r
# Libraries
library(tidytuesdayR)
library(tidyverse)
```

    ## ── Attaching packages ────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────── tidyverse 1.3.0 ──

    ## ✓ ggplot2 3.2.1     ✓ purrr   0.3.3
    ## ✓ tibble  2.1.3     ✓ dplyr   0.8.3
    ## ✓ tidyr   1.0.0     ✓ stringr 1.4.0
    ## ✓ readr   1.3.1     ✓ forcats 0.4.0

    ## ── Conflicts ───────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────── tidyverse_conflicts() ──
    ## x dplyr::filter() masks stats::filter()
    ## x dplyr::lag()    masks stats::lag()

``` r
# Data
tt_data <- tt_load(2020, week = 4); 
```

    ## --- Downloading #TidyTuesday Information for 2020-01-21 ----

    ## --- Identified 1 files available for download ----

    ## --- Downloading files ---

    ## --- Download complete ---

``` r
data <- tt_data$spotify_songs %>%
  select(-c(track_id, track_album_id, playlist_id))
```

## Exploratory Data Analysis

``` r
#str(data)
```

## Music’s popularity over time?
