## code to prepare `vnm_shape_20240901` dataset goes here
library(tidyverse)
library(sf)

vnm_shape_commune_20240901 <- readRDS(file = file.path("data-raw", "source_data", "vnm_commune_alldata.rds")) %>%
  select(province, VID_1, VID_1_type, VID_1_level, VID_1_urb_class,
         district, VID_2, VID_2_type, VID_2_level, VID_2_urb_class,
         commune,  VID_3, VID_3_type, VID_3_level, VID_3_urb_class,
         urb_class, geocen_lon, geocen_lat, geometry) %>%
  st_as_sf()

usethis::use_data(vnm_shape_commune_20240901, overwrite = TRUE)
