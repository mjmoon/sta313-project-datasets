library(dplyr)
library(readxl) # required to read Excel files
original_dir <- "ONT-SA/original"
target_dir <- "ONT-SA"
# historic ---------------------------------------------------------------------
## https://data.ontario.ca/dataset/social-assistance-caseloads
sa_hist <- read_excel( # read file
  file.path(original_dir, "historical_sa_recipients_dataset_en.xlsx")
  )
sa_hist |>
  mutate(Beneficiaries = as.numeric(Beneficiaries)) |> # to numbers
  rename_with(tolower) |> # rename attributes
  write.csv( # write file
    file.path(target_dir, "ont-sa-historical.csv"),
    row.names = FALSE
  )
# characteristics --------------------------------------------------------------
## https://data.ontario.ca/dataset/ontario-social-assistance-case-characteristics-by-census-metropolitan-area
sa_character_odsp_cma <- read_excel( # read file (sheet 1)
  file.path(original_dir, "sa_characteristics_by_cma_dataset_en.xlsx"),
  sheet = 1
  ) |>
  rename_with(tolower) # rename attributes
sa_character_ow_cma <- read_excel( # read file (sheet 2)
  file.path(original_dir, "sa_characteristics_by_cma_dataset_en.xlsx"),
  sheet = 2
  ) |>
  rename_with(tolower) # rename attributes
sa_character_odsp_prv <- read_excel( # read file (sheet 3)
  file.path(original_dir, "sa_characteristics_by_cma_dataset_en.xlsx"),
  sheet = 3
  ) |>
  rename_with(tolower) # rename attributes
sa_character_ow_prv <- read_excel( # read file (sheet 4)
  file.path(original_dir, "sa_characteristics_by_cma_dataset_en.xlsx"),
  sheet = 4
 ) |>
  rename_with(tolower) # rename attributes
# set year, month
sa_character_odsp_cma |>
  rename(cma_code = "cma code") |> 
  mutate( # define year and month attributes as numbers
    year = as.numeric(substr(month, 1, 4)),
    month = as.numeric(substr(month, 5, 6))
  ) |>
  # select and sowrt attributes
  select(-program) |>
  select(year, month, everything()) |>
  write.csv( # write file
    file.path(target_dir, "ont-sa-characteristic-odsp-cma.csv"),
    row.names = FALSE
  )
sa_character_ow_cma |>
  rename(cma_code = "cma code") |> 
  mutate( # define year and month attributes as numbers
    year = as.numeric(substr(month, 1, 4)),
    month = as.numeric(substr(month, 5, 6))
  ) |>
  # select and sowrt attributes
  select(-program) |>
  select(year, month, everything()) |>
  write.csv( # write file
    file.path(target_dir, "ont-sa-characteristic-ow-cma.csv"), 
    row.names = FALSE
  )
sa_character_odsp_prv |>
  mutate( # define year and month attributes as numbers
    year = as.numeric(substr(month, 1, 4)),
    month = as.numeric(substr(month, 5, 6))
  ) |>
  # select and sowrt attributes
  select(-c(province, program)) |>
  select(year, month, everything()) |>
  write.csv( # write file
    file.path(target_dir, "ont-sa-characteristic-odsp-ont.csv"), 
    row.names = FALSE
  )
sa_character_ow_prv |>
  mutate( # define year and month attributes as numbers
    year = as.numeric(substr(month, 1, 4)),
    month = as.numeric(substr(month, 5, 6))
  ) |>
  # select and sort attributes
  select(-c(province, program)) |>
  select(year, month, everything()) |>
  write.csv( # write file
    file.path(target_dir, "ont-sa-characteristic-ow-ont.csv"), 
    row.names = FALSE
  )
