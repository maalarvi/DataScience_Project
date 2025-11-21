# ================================================================
# Script: HIST_ND.R
# Purpose: Generate histograms for the ND (non-diabetic) dataset
# Description:
#   - Loads the dataset containing the ND object.
#   - Produces histograms for age, BMI, fasting glucose, and HbA1c.
#   - Uses fixed breakpoints to replicate specific bin structures.
#   - Applies customized axis labels, colors, and themes for consistency.
# ================================================================

# Load dataset (must contain ND object)
load(file ="dataset.Rdata")

# ------------------------------------------------
# Histogram for age in ND group
# ------------------------------------------------
ggplot(ND, aes(x = age)) +
  geom_histogram(
    breaks = c(10,20,30,40,50,60,70,80,90),  # fixed bin edges
    fill = "firebrick4", color = "white"     # red fill, white borders
  ) +
  scale_x_continuous(
    breaks = c(10,20,30,40,50,60,70,80,90)   # enforce tick marks
  ) +
  labs(
    title = "Age (ND group)",
    x = "Age (years)",
    y = "Frequency"
  ) +
  theme_minimal(base_size = 14)

# ------------------------------------------------
# Histogram for BMI in ND group
# ------------------------------------------------
ggplot(ND, aes(x = bmi)) +
  geom_histogram(
    breaks = c(15,18,21,24,27,30,33,36),     # fixed bin edges
    fill = "firebrick4", color = "white"
  ) +
  scale_x_continuous(
    breaks = c(15,18,21,24,27,30,33,36),
    labels = c("15","18","21","24","27","30","33",">36")  # overflow label
  ) +
  labs(
    title = "BMI (ND group)",
    x = "BMI (kg/m²)",
    y = "Density"
  ) +
  theme_minimal(base_size = 14)

# ------------------------------------------------
# Histogram for fasting glucose in ND group
# ------------------------------------------------
ggplot(ND, aes(x = glucose_fasting)) +
  geom_histogram(
    breaks = c(70,75,80,85,90,95,100),        # fixed bin edges
    fill = "firebrick4", color = "white"
  ) +
  scale_x_continuous(
    breaks = c(70,75,80,85,90,95,100),
    labels = c("<70","75","80","85","90","95","100")  # underflow shown
  ) +
  labs(
    title = "Fasting Glucose (ND group)",
    x = "Fasting glucose (mg/dL)",
    y = "Density"
  ) +
  theme_minimal(base_size = 14)

# ------------------------------------------------
# Histogram for HbA1c in ND group
# ------------------------------------------------
ggplot(ND, aes(x = hba1c)) +
  geom_histogram(
    breaks = c(4.0,4.25,4.5,4.75,5.0,5.25,5.5,5.75), # fixed bin edges
    fill = "firebrick4", color = "white"
  ) +
  scale_x_continuous(
    breaks = c(4.0,4.25,4.5,4.75,5.0,5.25,5.5,5.75)
  ) +
  labs(
    title = "HbA1c (ND group)",
    x = "HbA1c (%)",
    y = "Frequency"
  ) +
  theme_minimal(base_size = 14)
