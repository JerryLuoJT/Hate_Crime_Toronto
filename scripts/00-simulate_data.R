#### Preamble ####
# Purpose: Simulate the data
# Author: Jingtao Luo
# Date: 27 September 2024
# Contact: jingtao.luo@mail.utoronto.ca
# License: MIT
# Pre-requisites: Understand the raw data
# Any other information needed? n/a


#### Workspace setup ####
library(tidyverse)
#### Simulate data ####
#set the seed for random genergating
set.seed(003)

# generates 1161 hate crimes with unique id
data_size <- 1161
# Simulate 'year' variable from 2018-2023
year <- sample(2018:2023, data_size, replace = TRUE)

# Simulate 'bias_type' variable
bias_type <- sample(c("religious", "race", "gender", "sex", 
                      "language", "ethnicity"), data_size, replace = TRUE)

# Create the data frame
simulated_data <- data.frame(year, bias_type)

###Test Data###
simulated_data[!complete.cases(simulated_data), ]





