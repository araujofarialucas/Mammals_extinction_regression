#Load packages
library(ape)
library(dplyr)
library(rmdd)
library(tidyverse)


#Load data

## IUCN
iucn <- read.csv("Data/iucn.csv") %>%
  rename(Species = scientificName) %>%
  rename(IUCN = redlistCategory) %>%
  select(Species, IUCN)

# IUCN taxonomy
iucn_taxonomy <- read.csv("Data/taxonomy.csv") %>%
  rename(Species = scientificName) %>%
  rename(Class = className) %>%
  rename(Order = orderName) %>%
  rename(Family = familyName) %>%
  rename(Genus = genusName) %>%
  select(Species, Class, Order, Family, Genus)

# Pantheria
pantheria <- read.delim("Data/PanTHERIA_1-0_WR05_Aug2008.txt",  na.strings = c("-999", "-999.00")) %>%
  rename(
    ACT = X1.1_ActivityCycle, #few
    BM = X5.1_AdultBodyMass_g, #half
    GL = X9.1_GestationLen_d, #few
    WA = X25.1_WeaningAge_d, #few
    LY = X16.2_LittersPerYear_EXT, #very few
    PD = X21.1_PopulationDensity_n.km2, #very few
    HR = X22.1_HomeRange_km2, #very few
    HRI = X22.2_HomeRange_Indiv_km2, #very few
    HBT = X12.1_HabitatBreadth) %>% #few
  select(ACT, BM, GL, WA, LY, PD, HR, HRI, HBT) %>%
  drop_na(HBT)

# Combine
combine <- read.csv("Data/trait_data_imputed.csv") %>%
  rename(
    ACT = activity_cycle,
    BM = adult_mass_g,
    GL = gestation_length_d,
    WA = weaning_age_d,
    LY = litters_per_year_n,
    PD = density_n_km2,
    HR = home_range_km2,
    HBT = habitat_breadth_n
  ) %>%
  select(ACT, BM, GL, WA, LY, PD, HR, HBT) %>%
  drop_na(HBT)

#








usethis::use_git()









