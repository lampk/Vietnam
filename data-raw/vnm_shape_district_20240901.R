## code to prepare `vnm_shape_district_20240901` dataset goes here
library(tidyverse)
library(sf)

vnm_shape_district_20240901 <- readRDS(file = file.path("data-raw", "source_data", "vnm_commune_alldata.rds")) %>%
  group_by(VID_2) %>%
  summarise(
    district = district[1],
    VID_2 = VID_2[1],
    VID_2_type = VID_2_type[1],
    VID_2_level = VID_2_type[1],
    VID_2_urb_class = VID_2_urb_class[1],
    province = province[1],
    VID_1 = VID_1[1],
    VID_1_type = VID_1_type[1],
    VID_1_level = VID_1_level[1],
    VID_1_urb_class = VID_1_urb_class[1],
    geometry = sf::st_union(geometry),
    .groups = "drop"
    ) %>%
  st_as_sf()

usethis::use_data(vnm_shape_district_20240901, overwrite = TRUE)
