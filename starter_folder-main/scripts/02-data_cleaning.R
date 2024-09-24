#### Preamble ####
# Purpose: Cleans the raw plane data recorded by two observers..... [...UPDATE THIS...]
# Author: Rohan Alexander [...UPDATE THIS...]
# Date: 6 April 2023 [...UPDATE THIS...]
# Contact: rohan.alexander@utoronto.ca [...UPDATE THIS...]
# License: MIT
# Pre-requisites: [...UPDATE THIS...]
# Any other information needed? [...UPDATE THIS...]

#### Workspace setup ####
library(tidyverse)
library(janitor)

#### Clean data ####
hc_raw_data <- read_csv("data/raw_data/Hate_Crimes_Open_Data.csv")
hc_clean_data <- clean_names(hc_raw_data)

#Select rows needed
hc_clean_data <- 
  hc_clean_data |>
  select(id,occurrence_year,age_bias,mental_or_physical_disability,race_bias,
         ethnicity_bias,language_bias,religion_bias,sexual_orientation_bias,
         gender_bias,multiple_bias, neighbourhood_158)

#For easier calculation, we delete the crimes with multiple bias
hc_clean_data <- hc_clean_data %>% filter(multiple_bias != "YES")
#So we don't need variable 'multiple_bias' anymore, we delete this variable
hc_clean_data <- hc_clean_data %>% select(-multiple_bias)
#For easier calculation, we don't consider crimes that didn't report the neighborhood
hc_clean_data <- hc_clean_data %>% filter(neighbourhood_158 != "NSA")


###Save Data###
write_csv(hc_clean_data,"data/analysis_data/cleanned_data.csv")


