# Load Packages
library(tidyverse)
library(haven)
library(fixest)
library(broom)
cat("All packages loaded successfully\n")


# Load and inspect raw data
source("scripts/01_load_data.R")

# Balance table (Table 1)
source("scripts/02_baseline.R")

# Descriptive Stats Control (Table 2)
# source("scripts/03_desciptiveCon.R")

# Borrowing (Table 3)
# source("scripts/04_borrowing.R")

# Consumption (Table 4)
# source("scripts/05_consumption.R")

# Business Creation outcomes (Table 5)
# source("scripts/06_busCreation.R")

# Treatment Effect on Pre-existing Business Outcomes (Table 6)
# source("scripts/07_preBusTreat.R")

# Treatment + Selection Effects New Business Outcomes (Table 7)
# source("scripts/08_newBusTreatSel.R")

# Labor Supply (Table 8)
# source("scripts/09_laborSupply.R")

# Social outcomes and women's empowerment (Table 9)
# source("scripts/10_socialWomen.R")

# Nepal descriptive extension
# source("scripts/nepal.R")

cat("Master script loaded.\n")