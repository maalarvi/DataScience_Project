# ================================================================
# Script: HIST_T2DM.R
# Purpose: Generate histograms for the T2DM (type 2 diabetes) dataset
# Description:
#   - Loads the dataset containing the T2DM object.
#   - Produces histograms for age, BMI, fasting glucose, and HbA1c.
#   - Uses fixed breakpoints to match predefined bin structures.
#   - Applies consistent formatting, custom labels, and minimal theme.
# ================================================================

# Load dataset (must contain T2DM object)
load(file ="dataset.Rdata")

# ------------------------------------------------
# Histogram for age in T2DM group
# ------------------------------------------------
ggplot(T2DM, aes(x = age)) +
  geom_histogram(
    breaks = c(10,20,30,40,50,60,70,80,90),  # fixed bin edges
    fill = "steelblue4", color = "white"     # blue fill, white borders
  ) +
  scale_x_continuous(
    breaks = c(10,20,30,40,50,60,70,80,90)   # enforce axis tick marks
  ) +
  labs(
    title = "Age (T2DM group)",
    x = "Age (years)",
    y = "Frequency"
  ) +
  theme_minimal(base_size = 14)

# ------------------------------------------------
# Histogram for BMI in T2DM group
# ------------------------------------------------
ggplot(T2DM, aes(x = bmi)) +
  geom_histogram(
    breaks = c(15,18,21,24,27,30,33,36),     # fixed bin edges
    fill = "steelblue4", color = "white"
  ) +
  scale_x_continuous(
    breaks = c(15,18,21,24,27,30,33,36),
    labels = c("15","18","21","24","27","30","33",">36")  # overflow label
  ) +
  labs(
    title = "BMI (T2DM group)",
    x = "BMI (kg/m²)",
    y = "Density"
  ) +
  theme_minimal(base_size = 14)

# ------------------------------------------------
# Histogram for fasting glucose in T2DM group
# ------------------------------------------------
ggplot(T2DM, aes(x = glucose_fasting)) +
  geom_histogram(
    breaks = c(80,90,100,110,120,130,140,150),  # fixed bin edges
    fill = "steelblue4", color = "white"
  ) +
  scale_x_continuous(
    breaks = c(80,90,100,110,120,130,140,150),
    labels = c("<80","90","100","110","120","130","140",">150")  # underflow/overflow
  ) +
  labs(
    title = "Fasting glucose (T2DM group)",
    x = "Fasting glucose (mg/dL)",
    y = "Density"
  ) +
  theme_minimal(base_size = 14)

# ------------------------------------------------
# Histogram for HbA1c in T2DM group
# ------------------------------------------------
ggplot(T2DM, aes(x = hba1c)) +
  geom_histogram(
    breaks = c(5.0,5.5,6.0,6.5,7.0,7.5,8.0,8.5),  # fixed bin edges
    fill = "steelblue4", color = "white"
  ) +
  scale_x_continuous(
    breaks = c(5.0,5.5,6.0,6.5,7.0,7.5,8.0,8.5),
    labels = c("<5","5.5","6.0","6.5","7.0","7.5","8.0",">8.5")  # underflow/overflow
  ) +
  labs(
    title = "HbA1c (T2DM group)",
    x = "HbA1c (%)",
    y = "Density"
  ) +
  theme_minimal(base_size = 14)

