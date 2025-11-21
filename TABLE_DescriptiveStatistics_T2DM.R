# ================================================================
# Script: TABLE_DescriptiveStatistics_T2DM.R
# Purpose: Compute descriptive statistics for the T2DM dataset
# Description:
#   - Defines helper functions for numeric mode and skewness.
#   - Loads the T2DM dataset from an external .Rdata file.
#   - Computes summary statistics (mean, median, mode, SD, skewness,
#     range, min, max) for HbA1c, BMI, fasting glucose, and age.
#   - Formats the results into a styled table using the gt() package.
# ================================================================

# Mode function for numeric variables
get_mode <- function(x) {
  ux <- unique(x)                          # unique values
  ux[which.max(tabulate(match(x, ux)))]    # returns most frequent value
}

# Manual skewness function (avoids external packages)
skewness_manual <- function(x) {
  m <- mean(x)                             # mean
  s <- sd(x)                               # standard deviation
  n <- length(x)                           # number of observations
  sum(((x - m) / s)^3) / n                 # skewness formula
}

library(dplyr)
library(gt)

# Load dataset containing T2DM object
load(file ="dataset.Rdata")

# Compute summary statistics for each T2DM variable
stats_T2DM <- tibble(
  Statistic = c("Mean", "Median", "Mode", "SD", "Skewness",
                "Range", "Min", "Max"),
  
  HbA1c = c(mean(T2DM$hba1c),
            median(T2DM$hba1c),
            get_mode(T2DM$hba1c),
            sd(T2DM$hba1c),
            skewness_manual(T2DM$hba1c),
            diff(range(T2DM$hba1c)),
            min(T2DM$hba1c),
            max(T2DM$hba1c)),
  
  BMI = c(mean(T2DM$bmi),
          median(T2DM$bmi),
          get_mode(T2DM$bmi),
          sd(T2DM$bmi),
          skewness_manual(T2DM$bmi),
          diff(range(T2DM$bmi)),
          min(T2DM$bmi),
          max(T2DM$bmi)),
  
  `Fasting glucose` = c(mean(T2DM$glucose_fasting),
                        median(T2DM$glucose_fasting),
                        get_mode(T2DM$glucose_fasting),
                        sd(T2DM$glucose_fasting),
                        skewness_manual(T2DM$glucose_fasting),
                        diff(range(T2DM$glucose_fasting)),
                        min(T2DM$glucose_fasting),
                        max(T2DM$glucose_fasting)),
  
  Age = c(mean(T2DM$age),
          median(T2DM$age),
          get_mode(T2DM$age),
          sd(T2DM$age),
          skewness_manual(T2DM$age),
          diff(range(T2DM$age)),
          min(T2DM$age),
          max(T2DM$age))
)

# Generate formatted table using gt()
stats_T2DM %>%
  gt() %>%
  tab_header(
    title = "Descriptive Statistics for the T2DM Group",
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
      rows = seq(1, nrow(stats_T2DM), 2)  # alternating row shading
    )
  ) %>%
  tab_options(
    table.border.top.color = "white",
    table.border.bottom.color = "white",
    column_labels.font.weight = "bold",
    heading.align = "center"
  )
