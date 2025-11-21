# ================================================================
# Script: TABLE_Outliers.R  (alternative variable naming version)
# Purpose: Generate an outlier summary table for T2DM and ND datasets
# Description:
#   - Loads the dataset containing ND and T2DM groups.
#   - Detects outliers for each variable using the IQR rule.
#   - Computes outlier counts, percentages, and min/max outlier values.
#   - Builds a comparative table for ND and T2DM.
#   - Formats the table using the gt() package.
# ================================================================

library(dplyr)
library(gt)

# Load combined dataset (must include ND and T2DM objects)
load(file ="dataset.Rdata")

# Function that identifies outlier indices using the IQR criterion
get_outliers <- function(x) {
  Q1 <- quantile(x, 0.25, na.rm = TRUE)
  Q3 <- quantile(x, 0.75, na.rm = TRUE)
  IQR_val <- Q3 - Q1
  
  # Compute lower and upper thresholds
  lower <- Q1 - 1.5 * IQR_val
  upper <- Q3 + 1.5 * IQR_val
  
  # Return indices of values outside the thresholds
  which(x < lower | x > upper)
}

# Variables to evaluate for outliers
vars <- c("hba1c", "bmi", "glucose_fasting", "age")

# Function that returns count, percent, min, and max for outliers
outlier_summary <- function(data, var) {
  idx <- get_outliers(data[[var]])
  count <- length(idx)
  pct <- round(100 * count / nrow(data), 2)   # % of outliers
  
  # If no outliers, min/max are represented with "-"
  if (count == 0) {
    return(c(count, pct, "-", "-"))
  } else {
    return(c(count,
             pct,
             min(data[[var]][idx]),
             max(data[[var]][idx])))
  }
}

# Construct final table with outlier statistics
table_outliers <- tibble(
  Variable = c("HbA1C", "BMI", "Fasting glucose", "Age"),
  
  # Outliers for T2DM group
  T2DM_Count = sapply(c("hba1c", "bmi", "glucose_fasting", "age"),
                      \(v) outlier_summary(T2DM, v)[1]),
  T2DM_Pct   = sapply(c("hba1c", "bmi", "glucose_fasting", "age"),
                      \(v) outlier_summary(T2DM, v)[2]),
  T2DM_Min   = sapply(c("hba1c", "bmi", "glucose_fasting", "age"),
                      \(v) outlier_summary(T2DM, v)[3]),
  T2DM_Max   = sapply(c("hba1c", "bmi", "glucose_fasting", "age"),
                      \(v) outlier_summary(T2DM, v)[4]),
  
  # Outliers for ND group
  ND_Count = sapply(c("hba1c", "bmi", "glucose_fasting", "age"),
                    \(v) outlier_summary(ND, v)[1]),
  ND_Pct   = sapply(c("hba1c", "bmi", "glucose_fasting", "age"),
                    \(v) outlier_summary(ND, v)[2]),
  ND_Min   = sapply(c("hba1c", "bmi", "glucose_fasting", "age"),
                    \(v) outlier_summary(ND, v)[3]),
  ND_Max   = sapply(c("hba1c", "bmi", "glucose_fasting", "age"),
                    \(v) outlier_summary(ND, v)[4])
)

# Format and display the final table using gt()
table_outliers %>%
  gt() %>%
  tab_header(
    title = "Outlier Summary",
    subtitle = "T2DM vs ND groups (IQR criterion)"
  ) %>%
  cols_label(
    Variable = "",
    T2DM_Count = "Count",
    T2DM_Pct = "%",
    T2DM_Min = "Min",
    T2DM_Max = "Max",
    ND_Count = "Count",
    ND_Pct = "%",
    ND_Min = "Min",
    ND_Max = "Max"
  ) %>%
  tab_spanner(
    label = "T2DM outliers",
    columns = c(T2DM_Count, T2DM_Pct, T2DM_Min, T2DM_Max)
  ) %>%
  tab_spanner(
    label = "ND outliers",
    columns = c(ND_Count, ND_Pct, ND_Min, ND_Max)
  ) %>%
  fmt_number(
    columns = where(is.numeric),
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
      rows = seq(1, nrow(table_outliers), 2)
    )
  ) %>%
  tab_options(
    table.border.top.color = "white",
    table.border.bottom.color = "white",
    column_labels.font.weight = "bold",
    heading.align = "center"
  )

