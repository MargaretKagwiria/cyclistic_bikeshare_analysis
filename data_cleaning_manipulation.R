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


raw_data = list.files(path = "/Users/maggie/Documents/cyclistic_bikeshare/dataset", pattern = "*.csv", full.names = TRUE) %>% 
  lapply(read.csv) %>% 
  bind_rows()

glimpse(raw_data)

raw_data = raw_data %>% 
  distinct() %>% 
  distinct(ride_id, .keep_all = TRUE)

spring = c("Mar","Apr","May")
summer = c("Jun","Jul","Aug")
autumn = c("Sep","Oct","Nov")
winter = c("Dec","Jan","Feb")

manipulated_data = raw_data %>% 
  convert(dtm(started_at, ended_at)) %>% 
  mutate(month = format(started_at, "%b")) %>% 
  mutate(day = format(started_at, "%a")) %>% 
  mutate(duration = as_hms(difftime(ended_at, started_at))) %>% 
  mutate(season = case_when(month %in% spring ~ "Spring",
                            month %in% summer ~ "Summer",
                            month %in% autumn ~ "Autumn",
                            month %in% winter ~ "Winter"))

glimpse(manipulated_data)

complete_data = manipulated_data[complete.cases(manipulated_data),]
glimpse(complete_data)

which_state <- "illinois"
county_info <- map_data("county", region=which_state)

base_map <- ggplot(data = county_info, mapping = aes(x = long, y = lat, group = group)) +
  geom_polygon(color = "black", fill = "white") +
  coord_quickmap() +
  theme_void()
base_map

map_with_data <- base_map +
  geom_point(data = complete_data, aes(x = start_lng, y = start_lat, group=member_casual))
map_with_data

min_long <- min(manipulated_data$start_lng)
max_long <- max(manipulated_data$start_lng)
min_lat <- min(manipulated_data$start_lat)
max_lat <- max(manipulated_data$start_lat)
map_with_data <- base_map +
  geom_point(data = complete_data, aes(x = start_lng, y = start_lat, color=member_casual, group=member_casual)) +
  coord_quickmap(xlim = c(min_long, max_long),  ylim = c(min_lat, max_lat))

map_with_data

fwrite(raw_data, "combined_raw_data.csv")
fwrite(manipulated_data, "manipulated_data.csv")
fwrite(complete_data, "complete_clean_data.csv")

