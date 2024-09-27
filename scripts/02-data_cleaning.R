#### Preamble ####
# Purpose: Cleans the raw data based on three different variables
# Author: Jingtao Luo
# Date: 22 September 2024
# Contact: jingtao.luo@mail.utoronto.ca
# License: MIT
# Pre-requisites: Download the data. Instruction in '01-download_data.R'
# Any other information needed? n/a

#### Workspace setup ####
library(tidyverse)
library(janitor)

#### Clean data ####
hc_raw_data <- read_csv("data/raw_data/Hate_Crimes_Open_Data.csv")
hc_clean_data <- clean_names(hc_raw_data)

#Select rows needed and rows helps for cleaning
hc_clean_data <- 
  hc_clean_data |>
  select(id,occurrence_year,age_bias,mental_or_physical_disability,race_bias,
         ethnicity_bias,language_bias,religion_bias,sexual_orientation_bias,
         gender_bias,multiple_bias, neighbourhood_158)

#For easier calculation, I delete the crimes with multiple bias
hc_clean_data <- hc_clean_data %>% filter(multiple_bias != "YES")
#So I don't need variable 'multiple_bias' anymore, I delete this variable
hc_clean_data <- hc_clean_data %>% select(-multiple_bias)
#For easier calculation, I don't consider crimes that didn't report the neighborhood
hc_clean_data <- hc_clean_data %>% filter(neighbourhood_158 != "NSA")

#In order to count the bias more easily, I want to use only one column to show
#what kind of bias caused the crime. Here I create a new column to store the bias type
hc_clean_data <- hc_clean_data %>%
  mutate(bias_type = case_when(
    #Use case_when() function to store the bias columns to the new column. If the 
    #column is not 'NO'' or 'None' or one crime, then the crime has such bias.
    age_bias != "NO" ~ "Age",
    mental_or_physical_disability != "NO" ~ "Disability",
    race_bias != "None" ~ "Race",
    ethnicity_bias != "None" ~ "Ethnicity",
    language_bias != "None" ~ "Language",
    religion_bias != "None" ~ "Religion",
    sexual_orientation_bias != "None" ~ "Sex",
    gender_bias != "None" ~ "Gender"
  ))

#Select rows needed
hc_clean_data <- 
  hc_clean_data |>
  select(id,occurrence_year,bias_type, neighbourhood_158)

###Save Data###
write_csv(hc_clean_data,"data/analysis_data/cleanned_data.csv")
