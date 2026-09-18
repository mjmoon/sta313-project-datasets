library(dplyr)
library(readxl)
original_dir <- "ONT-SA/original"
target_dir <- "ONT-SA"
# historic
# https://data.ontario.ca/dataset/social-assistance-caseloads
sa_hist <- read_excel(
  file.path(original_dir, "historical_sa_recipients_dataset_en.xlsx")
  )
sa_hist |>
  mutate(Beneficiaries = as.numeric(Beneficiaries)) |>
  rename_with(tolower) |>
  write.csv(
    file.path(target_dir, "ont-sa-historical.csv"),
    row.names = FALSE
  )
# https://data.ontario.ca/dataset/ontario-social-assistance-case-characteristics-by-census-metropolitan-area
sa_character_odsp_cma <- read_excel(
  file.path(original_dir, "sa_characteristics_by_cma_dataset_en.xlsx"),
  sheet = 1
  ) |>
  rename_with(tolower)
sa_character_ow_cma <- read_excel(
  file.path(original_dir, "sa_characteristics_by_cma_dataset_en.xlsx"),
  sheet = 2
  ) |>
  rename_with(tolower)
sa_character_odsp_prv <- sa_character_ow <- read_excel(
  file.path(original_dir, "sa_characteristics_by_cma_dataset_en.xlsx"),
  sheet = 3
  ) |>
  rename_with(tolower)
sa_character_ow_prv <- read_excel(
  file.path(original_dir, "sa_characteristics_by_cma_dataset_en.xlsx"),
  sheet = 4
 ) |>
  rename_with(tolower)
# set year, month
sa_character_odsp_cma |>
  rename(cma_code = "cma code") |>
  mutate(
    year = as.numeric(substr(month, 1, 4)),
    month = as.numeric(substr(month, 5, 6))
  ) |>
  select(-program) |>
  select(year, month, everything()) |>
  write.csv(
    file.path(target_dir, "ont-sa-characteristic-odsp-cma.csv"),
    row.names = FALSE
  )
sa_character_ow_cma |>
  rename(cma_code = "cma code") |>
  mutate(
    year = as.numeric(substr(month, 1, 4)),
    month = as.numeric(substr(month, 5, 6))
  ) |>
  select(-program) |>
  select(year, month, everything()) |>
  write.csv(
    file.path(target_dir, "ont-sa-characteristic-ow-cma.csv"), 
    row.names = FALSE
  )
sa_character_odsp_prv |>
  mutate(
    year = as.numeric(substr(month, 1, 4)),
    month = as.numeric(substr(month, 5, 6))
  ) |>
  select(-c(province, program)) |>
  select(year, month, everything()) |>
  write.csv(
    file.path(target_dir, "ont-sa-characteristic-odsp-ont.csv"), 
    row.names = FALSE
  )
sa_character_ow_prv |>
  mutate(
    year = as.numeric(substr(month, 1, 4)),
    month = as.numeric(substr(month, 5, 6))
  ) |>
  select(-c(province, program)) |>
  select(year, month, everything()) |>
  write.csv(
    file.path(target_dir, "ont-sa-characteristic-ow-ont.csv"), 
    row.names = FALSE
  )
