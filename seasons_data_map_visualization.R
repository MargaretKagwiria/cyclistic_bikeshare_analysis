library(data.table)
library(tidyr)
library(tibble)
library(purrr)
library(stringr)
library(readr)
library(dplyr)
library(forcats)
library(ggplot2)
library(hms)
library(hablar)
library(gifski)
library(gganimate)

spring_data = list.files(path = "/Users/maggie/Documents/cyclistic_bikeshare/spring_data", pattern = "*.csv", full.names = TRUE) %>% 
  lapply(fread) %>% 
  bind_rows() 
spring_data = spring_data[complete.cases(spring_data),]
glimpse(spring_data)

which_state <- "illinois"
county_info <- map_data("county", region=which_state)

base_map <- ggplot(data = county_info, mapping = aes(x = long, y = lat, group = group)) +
  geom_polygon(color = "black", fill = "white") +
  coord_quickmap() +
  theme_void()
base_map

min_long <- min(spring_data$start_lng)
max_long <- max(spring_data$start_lng)
min_lat <- min(spring_data$start_lat)
max_lat <- max(spring_data$start_lat)
map_with_data <- base_map +
  geom_point(data = spring_data, aes(x = start_lng, y = start_lat, color=member_casual, group=member_casual)) +
  coord_quickmap(xlim = c(min_long, max_long),  ylim = c(min_lat, max_lat))

map_with_data

fwrite(spring_data, "clean_spring_data.csv")


summer_data = list.files(path = "/Users/maggie/Documents/cyclistic_bikeshare/summer_data", pattern = "*.csv", full.names = TRUE) %>% 
  lapply(fread) %>% 
  bind_rows() 
summer_data = summer_data[complete.cases(summer_data),]
glimpse(summer_data)

which_state <- "illinois"
county_info <- map_data("county", region=which_state)

base_map <- ggplot(data = county_info, mapping = aes(x = long, y = lat, group = group)) +
  geom_polygon(color = "black", fill = "white") +
  coord_quickmap() +
  theme_void()

min_long <- min(summer_data$start_lng)
max_long <- max(summer_data$start_lng)
min_lat <- min(summer_data$start_lat)
max_lat <- max(summer_data$start_lat)
map_with_data <- base_map +
  geom_point(data = summer_data, aes(x = start_lng, y = start_lat, color=member_casual, group=member_casual)) +
  coord_quickmap(xlim = c(min_long, max_long),  ylim = c(min_lat, max_lat))

map_with_data

fwrite(summer_data, "clean_summer_data.csv")


winter_data = list.files(path = "/Users/maggie/Documents/cyclistic_bikeshare/winter_data", pattern = "*.csv", full.names = TRUE) %>% 
  lapply(fread) %>% 
  bind_rows() 
winter_data = spring_data[complete.cases(winter_data),]
glimpse(winter_data)

which_state <- "illinois"
county_info <- map_data("county", region=which_state)

base_map <- ggplot(data = county_info, mapping = aes(x = long, y = lat, group = group)) +
  geom_polygon(color = "black", fill = "white") +
  coord_quickmap() +
  theme_void()
base_map

min_long <- min(winter_data$start_lng)
max_long <- max(winter_data$start_lng)
min_lat <- min(winter_data$start_lat)
max_lat <- max(winter_data$start_lat)
map_with_data <- base_map +
  geom_point(data = winter_data, aes(x = start_lng, y = start_lat, color=member_casual, group=member_casual)) +
  coord_quickmap(xlim = c(min_long, max_long),  ylim = c(min_lat, max_lat))

map_with_data

fwrite(winter_data, "clean_winter_data.csv")
  

autumn_data = list.files(path = "/Users/maggie/Documents/cyclistic_bikeshare/autumn_data", pattern = "*.csv", full.names = TRUE) %>% 
  lapply(fread) %>% 
  bind_rows() 
autumn_data = autumn_data[complete.cases(autumn_data),]
glimpse(autumn_data)

which_state <- "illinois"
county_info <- map_data("county", region=which_state)

base_map <- ggplot(data = county_info, mapping = aes(x = long, y = lat, group = group)) +
  geom_polygon(color = "black", fill = "white") +
  coord_quickmap() +
  theme_void()
base_map

min_long <- min(autumn_data$start_lng)
max_long <- max(autumn_data$start_lng)
min_lat <- min(autumn_data$start_lat)
max_lat <- max(autumn_data$start_lat)
map_with_data <- base_map +
  geom_point(data = autumn_data, aes(x = start_lng, y = start_lat, color=member_casual, group=member_casual)) +
  coord_quickmap(xlim = c(min_long, max_long),  ylim = c(min_lat, max_lat))

map_with_data

fwrite(autumn_data, "clean_autumn_data.csv")

