# Load Packages
library(haven)
library(tidyverse)
library(sandwich)
library(lmtest)
library(multiwayvcov)
library(fixest)
library(stargazer)
library(skimr)
cat("All packages loaded successfully\n")


# Load and inspect raw data
source("scripts/01_load_data.R")

# Balance table (Table 1)
# source("scripts/02_balance.R")

# Takeup (Table 2)
# source("scripts/03_takeup.R")

# 4. Business investment (Table 4)
# source("scripts/04_business.R")

# 5. Consumption (Table 5)
# source("scripts/05_consumption.R")

# 6. Nepal descriptive extension
# source("scripts/06_nepal.R")

cat("Master script loaded.\n")