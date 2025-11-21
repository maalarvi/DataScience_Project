# ================================================================
# Script: TABLE_DescriptiveStatistics_ND.R
# Purpose: Compute descriptive statistics for the ND dataset
# Description:
#   - Defines helper functions for numeric mode and skewness.
#   - Loads the ND dataset from an external .Rdata file.
#   - Computes summary statistics (mean, median, mode, SD, skewness,
#     range, min, max) for HbA1c, BMI, fasting glucose, and age.
#   - Formats the results into a table using the gt() package.
# ================================================================

# Mode function for numeric variables
get_mode <- function(x) {
  ux <- unique(x)                          # unique values
  ux[which.max(tabulate(match(x, ux)))]    # most frequent value
}

# Manual skewness function (avoids using external packages)
skewness_manual <- function(x) {
  m <- mean(x)                             # mean
  s <- sd(x)                               # standard deviation
  n <- length(x)                           # number of observations
  sum(((x - m) / s)^3) / n                 # skewness formula
}

library(dplyr)
library(gt)

# Load dataset containing ND object
load(file ="dataset.Rdata")

# Compute summary statistics for each variable in ND
stats_ND <- tibble(
  Statistic = c("Mean", "Median", "Mode", "SD", "Skewness",
                "Range", "Min", "Max"),
  
  HbA1c = c(mean(ND$hba1c),
            median(ND$hba1c),
            get_mode(ND$hba1c),
            sd(ND$hba1c),
            skewness_manual(ND$hba1c),
            diff(range(ND$hba1c)),
            min(ND$hba1c),
            max(ND$hba1c)),
  
  BMI = c(mean(ND$bmi),
          median(ND$bmi),
          get_mode(ND$bmi),
          sd(ND$bmi),
          skewness_manual(ND$bmi),
          diff(range(ND$bmi)),
          min(ND$bmi),
          max(ND$bmi)),
  
  `Fasting glucose` = c(mean(ND$glucose_fasting),
                        median(ND$glucose_fasting),
                        get_mode(ND$glucose_fasting),
                        sd(ND$glucose_fasting),
                        skewness_manual(ND$glucose_fasting),
                        diff(range(ND$glucose_fasting)),
                        min(ND$glucose_fasting),
                        max(ND$glucose_fasting)),
  
  Age = c(mean(ND$age),
          median(ND$age),
          get_mode(ND$age),
          sd(ND$age),
          skewness_manual(ND$age),
          diff(range(ND$age)),
          min(ND$age),
          max(ND$age))
)

# Generate formatted summary table using gt()
stats_ND %>%
  gt() %>%
  tab_header(
    title = "Descriptive Statistics for the ND Group",
    subtitle = "Summary of HbA1c, BMI, fasting glucose, and age"
  ) %>%
  fmt_number(
    columns = -Statistic,
    decimals = 2
  ) %>%
  cols_align(align = "center") %>%
  tab_style(
    style = cell_borders(color = "grey80", weight = px(1)),
    locations = cells_body()
  ) %>%
  tab_style(
    style = list(
      cell_fill(color = "grey95")
    ),
    locations = cells_body(
      rows = seq(1, nrow(stats_ND), 2)  # alternating grey fill
    )
  ) %>%
  tab_options(
    table.border.top.color = "white",
    table.border.bottom.color = "white",
    column_labels.font.weight = "bold",
    heading.align = "center"
  )

