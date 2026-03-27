# Define all variable lists (exact translation)
hh_composition   <- c("hh_size", "adult", "children", "male_head", "head_age", "head_noeduc")
credit_access    <- c("spandana", "othermfi", "bank", "informal", "anyloan")
loan_amt         <- c("spandana_amt", "othermfi_amt", "bank_amt", "informal_amt", "anyloan_amt")
self_emp_activ   <- c("total_biz", "female_biz", "female_biz_pct")
consumption      <- c("total_exp_mo", "nondurable_exp_mo", "durables_exp_mo", "home_durable_index")

# Generate _allHH variables (exact translation of foreach loop)
businesses <- c("bizrev", "bizexpense", "bizinvestment", "bizemployees", "hours_weekbiz")
df_baseline <- df_baseline %>%
  mutate(across(all_of(businesses),
                ~if_else(total_biz == 0, 0, .),
                .names = "{.col}_allHH"))
businesses_allHH <- paste0(businesses, "_allHH")

allvars <- c(hh_composition, credit_access, loan_amt, self_emp_activ, businesses, businesses_allHH, consumption)

# Exact translation of the Stata loop
get_stats <- function(var, data) {
  tryCatch({
    
    # "sum var if treatment==0"
    ctrl <- data %>% filter(treatment == 0) %>% pull(.data[[var]])
    trt  <- data %>% filter(treatment == 1) %>% pull(.data[[var]])
    
    N        <-  N <- sum(!is.na(ctrl)) + sum(!is.na(trt))
    ctrl_mean <- mean(ctrl, na.rm = TRUE)
    ctrl_sd   <- sd(ctrl,   na.rm = TRUE)
    trt_mean  <- mean(trt,  na.rm = TRUE)
    trt_sd   <-  sd(trt,   na.rm = TRUE)
    
    # "reg var treatment, cluster(areaid)"
    fit      <- feols(as.formula(paste(var, "~ treatment")),
                      data = data, cluster = ~areaid)
    
    fit_tidy <- tidy(fit) %>% filter(term == "treatment")
    diff  <- fit_tidy$estimate
    p_val <- fit_tidy$p.value
    
    data.frame(
      Variable     = var,
      Obs          = N,
      Treatment    = round(trt_mean,  3),
      Treatment_SD = round(trt_sd,    3),
      Control_Mean = round(ctrl_mean, 3),
      Control_SD   = round(ctrl_sd,   3),
      Difference   = round(diff,      3),
      P_Value      = round(p_val,     3)
    )
    
  }, error = function(e) {
    data.frame(Variable = var, Obs = NA, Treatment = NA, Treatment_SD = NA, Control_Mean = NA, Control_SD = NA, Difference = NA, P_Value = NA)
  })
}

# Run and view
table_1a <- map_dfr(allvars, ~get_stats(.x, df_baseline))
View(table_1a)