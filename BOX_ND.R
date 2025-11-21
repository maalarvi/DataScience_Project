# ================================================================
# Script: BOX_ND.R  (iterative version)
# Purpose: Generate boxplots for the ND (non-diabetic) dataset
# Description:
#   - Loads the dataset containing the ND object.
#   - Iterates through selected ND variables to create boxplots.
#   - Applies custom colors, titles, and axis labels.
#   - Ensures consistent formatting across all boxplots.
# ================================================================

library(ggplot2)

# Load dataset (must contain ND object)
load(file ="dataset.Rdata")

# Variables to plot
vars <- c("age", "bmi", "glucose_fasting", "hba1c")     # ND variables
titles <- c("Age", "BMI", "Fasting glucose", "HbA1c")   # Plot titles
units <- c("Age (years)", "BMI (kg/m²)", 
           "Fasting glucose (mg/dL)", "HbA1c (%)")      # Axis labels

i = 1  # index for titles/labels

# Loop through variables and generate one boxplot per variable
for (v in vars) {
  
  ggplot(ND, aes(x = "", y = .data[[v]])) +
    geom_boxplot(
      fill = "firebrick",         # box fill color
      color = "black",            # box outline
      box.color = "white",        # internal box border color
      median.color = "white"      # median line color
    ) +
    labs(
      title = paste("", titles[i], "(ND group)"),  # dynamic title
      x = "",
      y = units[i]                                 # dynamic axis label
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
