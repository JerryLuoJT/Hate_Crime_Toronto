#### Preamble ####
# Purpose: Downloads and saves the data from Open Data Toronto.
# Author: Jingtao Luo
# Date: 22 September 2024
# Contact: jingtao.luo@mail.utoronto.ca
# License: MIT
# Pre-requisites: Download the corresponding data
# Any other information needed? n/a


#### Workspace setup ####
# install.packages('opendatatoronto')  
# install.packages('tidyverse')
# install.packages('dplyr')  
library(opendatatoronto)
library(tidyverse)
library(dplyr)

#### Download data ####

#Download Hate Crimes Open Data from https://open.toronto.ca/
#get package

package <- show_package("hate-crimes-open-data")
package

# get all resources for this package
resources <- list_package_resources("hate-crimes-open-data")

# identify datastore resources; by default, Toronto Open Data sets datastore resource format to CSV for non-geospatial and GeoJSON for geospatial resources
datastore_resources <- filter(resources, tolower(format) %in% c('csv', 'geojson'))

# load the first datastore resource as a sample
data <- filter(datastore_resources, row_number()==1) %>% get_resource()


#### Save data ####
# [...UPDATE THIS...]
# change the_raw_data to whatever name you assigned when you downloaded it.
write_csv(hc_raw_data, "data/raw_data/Hate_Crimes_Open_Data.csv") 

