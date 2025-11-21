# ================================================================
# Script: SPLOTS_T2DM.R
# Purpose: Generate scatterplots for the T2DM (type 2 diabetes) dataset
# Description:
#   - Loads the dataset containing the T2DM object.
#   - Creates scatterplots of HbA1c against fasting glucose, BMI, and age.
#   - Uses consistent styling, large text for readability, and minimal theme.
#   - Helps visualize potential relationships between metabolic indicators.
# ================================================================

library(ggplot2)

# Load dataset (must contain T2DM object)
load(file ="dataset.Rdata")

# ------------------------------------------------
# HbA1c vs Fasting Glucose
# ------------------------------------------------
ggplot(T2DM, aes(x = glucose_fasting, y = hba1c)) +
  geom_point(color = "steelblue4", alpha = 1) +    # scatter points
  labs(
    title = "HbA1c vs Fasting Glucose (T2DM group)",
    x = "Fasting glucose (mg/dL)",
    y = "HbA1c (%)"
  ) +
  theme_minimal() +
  theme(
    plot.title = element_text(hjust = 0.5, size = 30),  # centered title
    axis.title.x = element_text(size = 26),
    axis.title.y = element_text(size = 26),
    axis.text.x  = element_text(size = 22),
    axis.text.y  = element_text(size = 22)
  )

# ------------------------------------------------
# HbA1c vs BMI
# ------------------------------------------------
ggplot(T2DM, aes(x = bmi, y = hba1c)) +
  geom_point(color = "steelblue4", alpha = 1) +
  labs(
    title = "HbA1c vs BMI (T2DM group)",
    x = "BMI (kg/m²)",
    y = "HbA1c (%)"
  ) +
  theme_minimal() +
  theme(
    plot.title = element_text(hjust = 0.5, size = 30),
    axis.title.x = element_text(size = 26),
    axis.title.y = element_text(size = 26),
    axis.text.x  = element_text(size = 22),
    axis.text.y  = element_text(size = 22)
  )

# ------------------------------------------------
# HbA1c vs Age
# ------------------------------------------------
ggplot(T2DM, aes(x = age, y = hba1c)) +
  geom_point(color = "steelblue4", alpha = 1) +
  labs(
    title = "HbA1c vs Age (T2DM group)",
    x = "Age (years)",
    y = "HbA1c (%)"
  ) +
  theme_minimal() +
  theme(
    plot.title = element_text(hjust = 0.5, size = 30),
    axis.title.x = element_text(size = 26),
    axis.title.y = element_text(size = 26),
    axis.text.x  = element_text(size = 22),
    axis.text.y  = element_text(size = 22)
  )

