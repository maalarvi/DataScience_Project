# ================================================================
# Script: SPLOTS_ND.R
# Purpose: Generate scatterplots for the ND (non-diabetic) dataset
# Description:
#   - Loads the dataset containing the ND object.
#   - Creates scatterplots of HbA1c against fasting glucose, BMI, and age.
#   - Uses consistent formatting, large text for readability, and minimal theme.
#   - Helps visualize whether metabolic indicators show meaningful patterns.
# ================================================================

library(ggplot2)

# Load dataset (must contain ND object)
load(file ="dataset.Rdata")

# ------------------------------------------------
# HbA1c vs Fasting Glucose
# ------------------------------------------------
ggplot(ND, aes(x = glucose_fasting, y = hba1c)) +
  geom_point(color = "firebrick", alpha = 1) +   # red scatter points
  labs(
    title = "HbA1c vs Fasting Glucose (ND group)",
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
ggplot(ND, aes(x = bmi, y = hba1c)) +
  geom_point(color = "firebrick", alpha = 1) +
  labs(
    title = "HbA1c vs BMI (ND group)",
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
ggplot(ND, aes(x = age, y = hba1c)) +
  geom_point(color = "firebrick", alpha = 1) +
  labs(
    title = "HbA1c vs Age (ND group)",
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
