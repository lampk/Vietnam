## code to prepare `vnm_shape_province_20240901` dataset goes here
library(tidyverse)
library(readxl)

vnm_population_01 <- read_excel(path = file.path("data-raw", "source_data", "vnm_population_GSO_20240902.xlsx"), sheet = "population")
vnm_population_02 <- read_excel(path = file.path("data-raw", "source_data", "vnm_population_GSO_20240902.xlsx"), sheet = "crude_birth_rate")
vnm_population <- merge(vnm_population_01, vnm_population_02,
                        by = c("VID_1", "province", "year"),
                        all = TRUE)
usethis::use_data(vnm_population, overwrite = TRUE)
