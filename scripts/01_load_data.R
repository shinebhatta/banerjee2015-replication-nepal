# Load Banerjee data set
df_baseline <- read_dta("data/raw/2013-0533_data_baseline.dta")
df_census <- read_dta("data/raw/2013-0533_data_census.dta")
df_el1_biz <- read_dta("data/raw/2013-0533_data_endline1businesstype.dta")
df_el1and2 <- read_dta("data/raw/2013-0533_data_endlines1and2.dta")
# Load NLSS IV
# df_nlss <-read_dta("data/raw/NLSS oct 20.dta")

df_baseline <- df_baseline %>% filter(!is.na(treatment))

# Save clean working copies
saveRDS(df_baseline, "data/clean/baseline.rds")
saveRDS(df_census,   "data/clean/census.rds")
saveRDS(df_el1_biz,  "data/clean/el1_biz.rds")
saveRDS(df_el1and2,  "data/clean/el1and2.rds")
# saveRDS(df_nlss, "data/clean/nlss_clean.rds")

cat("Data Loaded and saved to data/clean")