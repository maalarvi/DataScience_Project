# ================================================================
# Script: BOX_T2DM.R  (iterative version)
# Purpose: Generate boxplots for the T2DM (type 2 diabetes) dataset
# Description:
#   - Loads the dataset containing the T2DM object.
#   - Iterates through selected T2DM variables to produce boxplots.
#   - Applies consistent formatting, custom colors, and axis labels.
#   - Produces one boxplot per variable with minimal theme styling.
# ================================================================

library(ggplot2)

# Load dataset (must contain T2DM object)
load(file ="dataset.Rdata")

# Variables to include in boxplots
vars <- c("age", "bmi", "glucose_fasting", "hba1c")     # T2DM variables
titles <- c("Age", "BMI", "Fasting glucose", "HbA1c")   # Plot titles
units <- c("Age (years)", "BMI (kg/m²)", 
           "Fasting glucose (mg/dL)", "HbA1c (%)")      # Axis labels

i = 1  # index for titles and axis labels

# Loop through the variables and generate boxplots
for (v in vars) {
  
  ggplot(T2DM, aes(x = "", y = .data[[v]])) +
    geom_boxplot(
      fill = "steelblue4",       # box fill color (blue)
      color = "black",           # outline color
      box.color = "white",       # interior box border
      median.color = "white"     # median line color
    ) +
    labs(
      title = paste("", titles[i], "(T2DM group)"),  # dynamic title
      x = "",
      y = units[i]                                   # dynamic y-axis label
    ) +
    theme_minimal() +
    theme(
      plot.title = element_text(hjust = 0.5, size = 15),
      axis.title.x = element_text(size = 14),
      axis.title.y = element_text(size = 14),
      axis.text.x  = element_text(size = 12),
      axis.text.y  = element_text(size = 12)
    ) -> p
  
  plot(p)   # display plot
  
  i = i + 1 # increment index
}
