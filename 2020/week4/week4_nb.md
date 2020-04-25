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
<<<<<<< HEAD
  select(-c(track_id, track_album_id, playlist_id)) %>%
  mutate(track_album_release_date = as.Date(track_album_release_date))

# EDA
data %>%
  count(playlist_genre)
```

    ## # A tibble: 6 x 2
    ##   playlist_genre     n
    ##   <chr>          <int>
    ## 1 edm             6043
    ## 2 latin           5155
    ## 3 pop             5507
    ## 4 r&b             5431
    ## 5 rap             5746
    ## 6 rock            4951

``` r
data %>%
  count(playlist_subgenre)
```

    ## # A tibble: 24 x 2
    ##    playlist_subgenre     n
    ##    <chr>             <int>
    ##  1 album rock         1065
    ##  2 big room           1206
    ##  3 classic rock       1296
    ##  4 dance pop          1298
    ##  5 electro house      1511
    ##  6 electropop         1408
    ##  7 gangster rap       1458
    ##  8 hard rock          1485
    ##  9 hip hop            1322
    ## 10 hip pop            1256
    ## # … with 14 more rows

## Ideas being considered:

  - Music popularity over time
      - per genre
  - Difference in song characteristics by genre

<!-- end list -->

``` r
names_characteristics <- data[,c(9:20)]

ggplot(data = data, mapping = aes(x = ))
```

![](week4_nb_files/figure-gfm/Song%20characteristics-1.png)<!-- -->

=======
  select(-c(track_id, track_album_id, playlist_id))
```

## Exploratory Data Analysis

``` r
#str(data)
```

>>>>>>> 045fa71365dfbe0971ac2b7f6fe525ce9f4833cc
## Music’s popularity over time?
