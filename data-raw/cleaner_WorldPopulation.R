library(tidyverse)
library(readxl)
library(usethis)

WorldPopulation <- read_excel('C:\\Users\\lmaul\\OneDrive\\Documents\\MaultWorldPopulation\\data-raw\\World_Population.xlsx', range = 'A17:BZ306')

names(WorldPopulation) <- c("Unused1", "Unused2", "Country Name", "Unused3", "Unused4",
                            "Type", "Unused5", paste(1950:2020))

WorldPopulation <- WorldPopulation %>%
  filter(Type == "Country/Area") %>%
  select('Country Name', '1950':'2020')

WorldPopulation <- WorldPopulation %>%
  mutate(across(`1950`:`2020`, ~ as.numeric(as.character(.))))

use_data(WorldPopulation)
