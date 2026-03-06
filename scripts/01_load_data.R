# Load Banerjee dataset
df_main <- read_dta("data/raw/2013-0533_data_baseline.dta")

# Load NLSS IV
df_nlss <-read_dta("data/raw/NLSS oct 20.dta")

# Save clean working copies
saveRDS(df_main, "data/clean/banerjee_clean.rds")
saveRDS(df_nlss, "data/clean/nlss_clean.rds")

cat("Data Loaded and saved to data/clean \n")