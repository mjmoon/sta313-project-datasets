library(dplyr)
library(stringi) # functions for working with strings
library(readr) # functions to read text files to tibble (tidyverse table type)
library(readxl) # required to read Excel files
original_dir <- "ONT-SCHOOL/original"
target_dir <- "ONT-SCHOOL"
# school info and student demographics -----------------------------------------
## https://data.ontario.ca/dataset/school-information-and-student-demographics
## read a list of file names
files <- dir(file.path(original_dir, "demographic"), full.names = TRUE)
attributes_to_keep <- c(
  "board_number",
  "board_name",
  "board_type",
  "school_number",
  "school_name",
  "school_type",
  "school_special_condition_code",
  "school_level",
  "school_language",
  "grade_range",
  "street",
  "municipality",
  "city",
  "postal_code",
  "enrolment",
  "latitude",
  "longitude",
  "percentage_of_students_whose_first_language_is_not_english",
  "percentage_of_students_whose_first_language_is_not_french",
  "percentage_of_students_who_are_new_to_canada_from_a_non_english_speaking_country",
  "percentage_of_students_who_are_new_to_canada_from_a_non_french_speaking_country",
  "percentage_of_students_receiving_special_education_services",
  "percentage_of_students_identified_as_gifted",
  "percentage_of_grade_3_students_achieving_the_provincial_standard_in_reading",
  "percentage_of_grade_3_students_achieving_the_provincial_standard_in_writing",
  "percentage_of_grade_3_students_achieving_the_provincial_standard_in_mathematics",
  "percentage_of_grade_6_students_achieving_the_provincial_standard_in_reading",
  "percentage_of_grade_6_students_achieving_the_provincial_standard_in_writing",
  "percentage_of_grade_6_students_achieving_the_provincial_standard_in_mathematics",
  "percentage_of_grade_9_students_achieving_the_provincial_standard_in_mathematics",
  "percentage_of_grade_9_students_achieving_the_provincial_standard_in_academic_mathematics",
  "percentage_of_grade_9_students_achieving_the_provincial_standard_in_applied_mathematics",
  "percentage_of_students_that_passed_the_grade_10_osslt_on_their_first_attempt",
  "percentage_of_school_aged_children_who_live_in_low_income_households",
  "percentage_of_students_whose_parents_have_no_degree_diploma_or_certificate"
)
demos <- list(length = length(files)) # create an empty list
for (i in seq(length(files))) { # read files and save in the list
  f <- files[[i]] # file path
  demos[[i]] <- read_excel(f) |> # read file
    rename_with(tolower) |> # rename attributes
    rename_with(
      function(x) stri_replace_all(stri_trim(x), "_", regex = "[\\s|-]")
    ) |> 
    rename_with(
      function(x) stri_replace_all(x, "", regex = ",")
    ) |> 
    select(any_of(attributes_to_keep)) |> # select attributes
    mutate( # set as numbers to avoid conflicts when combining
      longitude = as.numeric(longitude),
      latitude = as.numeric(latitude)
    )
  demos[[i]][["year"]] <- stri_extract(f, regex = "20\\d\\d-20\\d\\d") # set year
  demos[[i]] <- demos[[i]] |>
    select(year, everything()) # sort attributes
}
## combine into a single data set
demo_info <- bind_rows(demos) 
demo_info <- demo_info |>
  mutate(
    # remove "%" signs from all "percentage_" attributes and save as numbers
    across(
      starts_with("percentage_"),
      function(x) stri_replace(x, "", regex = "\\%") |> as.numeric()
    )
  )
## write file
write.csv(
  demo_info, 
  file.path(target_dir, "ont-school-demo-info.csv"), 
  row.names = FALSE
)
# enrolments by grade in elementary schools ------------------------------------
## https://data.ontario.ca/dataset/enrolment-by-grade-in-elementary-schools
## read a list of file names
files <- dir(file.path(original_dir, "enrollment-elementary"), full.names = TRUE)
enrlmnts <- list(length = length(files)) # create an empty list
attributes_to_keep <- c(
  "year",
  "board_number",
  "board_name",
  "board_type",
  "junior_kindergarten_enrolment",
  "kindergarten_enrolment",
  "grade_1_enrolment",
  "grade_2_enrolment",
  "grade_3_enrolment",
  "grade_4_enrolment",
  "grade_5_enrolment",
  "grade_6_enrolment",
  "grade_7_enrolment",
  "grade_8_enrolment",
  "total_enrolment"
)
for (i in seq(length(files))) { # read files and save in the list
  f <- files[[i]] # file path
  enrlmnts[[i]] <- read_delim(f, delim = "|", col_types = "c") |> # values are separated by "|"
    rename_with(tolower) |> # rename attributes
    rename_with(
      function(x) stri_replace_all(stri_trim(x), "_", regex = "[\\s|-]")
    ) |>
    # use consistent names and data types to avoid conflicts when combining
    rename_with(
      function(x) stri_paste(x, "_enrolment"),
      .cols = matches("kindergarten$")
    ) |>
    rename_with(
      function(x) stri_paste(x, "_enrolment"),
      .cols = matches("\\d$")
    ) |>
    mutate(across(ends_with("enrolment"), as.numeric)) 
  enrlmnts[[i]][["year"]] <- stri_extract(f, regex = "20\\d\\d-20\\d\\d")  # set year
  # select and sort attributes
  # drop board type and retrieve from demo info for consistency
  enrlmnts[[i]] <- enrlmnts[[i]] |>
    select(all_of(attributes_to_keep[-4]))  
}
## combine and write file
bind_rows(enrlmnts) |>
  filter(!is.na(board_number)) |> # remove empty/total rows
  left_join(
    demo_info |>
      select(board_number, board_type) |>
      distinct(),
    by = "board_number"
  ) |>
  select(all_of(attributes_to_keep)) |> # sort attributes
  write.csv(
    file.path(target_dir, "ont-school-enrlmnt-elementary.csv"), 
    row.names = FALSE
  )
# enrolments by grade in secondary schools -------------------------------------
## https://data.ontario.ca/dataset/enrolment-by-grade-in-secondary-schools
## read a list of file names
files <- dir(file.path(original_dir, "enrollment-secondary"), full.names = TRUE)
enrlmnts <- list(length = length(files)) # create an empty list
attributes_to_keep <- c(
  "year",
  "board_number",
  "board_name",
  "board_type",
  "grade_9_enrolment",
  "grade_10_enrolment",
  "grade_11_enrolment",
  "grade_12_enrolment",
  "total_enrolment"
)
for (i in seq(length(files))) { # read files and save in the list
  f <- files[[i]] # file path
  enrlmnts[[i]] <- read_delim(f, delim = "|", col_types = "c") |> # values are separated by "|"
    rename_with(tolower) |> # rename attributes
    rename_with(
      function(x) stri_replace_all(stri_trim(x), "_", regex = "[\\s|-]")
    ) |>
    rename_with( # fix typos in column names
      function(x) stri_replace(x, "enrolment", regex = "enorlment")
    ) |>
    # use consistent to avoid conflicts when combining
    mutate(across(ends_with("enrolment"), as.numeric))
  enrlmnts[[i]][["year"]] <- stri_extract(f, regex = "20\\d\\d-20\\d\\d") # set year
  # select and sort attributes
  # drop board type and retrieve from demo info for consistency
  enrlmnts[[i]] <- enrlmnts[[i]] |>
    select(all_of(attributes_to_keep[-4]))  
}
## combine and write file
bind_rows(enrlmnts) |>
  filter(!is.na(board_number)) |> # remove empty/total rows
  left_join(
    demo_info |>
      select(board_number, board_type) |>
      distinct(),
    by = "board_number"
  ) |>
  select(all_of(attributes_to_keep)) |> # sort attributes
  write.csv(
    file.path(target_dir, "ont-school-enrlmnt-secondary.csv"), 
    row.names = FALSE
  )
# enrolments by course in secondary schools ------------------------------------
files <- dir(file.path(original_dir, "enrollment-secondary-course"), full.names = TRUE)
enrlmnts <- list(length = length(files)) # create an empty list
attributes_to_keep <- c(
  "year",
  "course_code",
  "course_description",
  "grade",
  "pathway_or_destination",
  "enrolment"
)
for (i in seq(length(files))) { # read files and save in the list
  f <- files[[i]] # file path
  enrlmnts[[i]] <- read_excel(f) |> 
    rename_with(tolower) |> # rename attributes
    rename_with(
      function(x) stri_replace_all(stri_trim(x), "_", regex = "[\\s|-]")
    )
  enrlmnts[[i]][["year"]] <- stri_extract(f, regex = "20\\d\\d-20\\d\\d") # set year
  enrlmnts[[i]] <- enrlmnts[[i]] |>
    select(all_of(attributes_to_keep)) # select and sort attributes
}
## combine and write file
bind_rows(enrlmnts) |>
  write.csv(
    file.path(target_dir, "ont-school-enrlmnt-secondary-courses.csv"),
    row.names = FALSE
  )
