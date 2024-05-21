# Load the necessary library
library(ggplot2)
library(stats)
library(ggpubr)
library(readr)
# Define the file path
file_path <- "assets/heart.csv"

# Read the CSV file
data <- read.csv(file = file.choose(), header = TRUE, sep = ";")

# Print the first few rows of the data
print(head(data))

i <- 8
j <- 6
k <- 3

# Remove rows `k + 1`, `j + 1`, `i + 1`, `jk + 1`, `ij + 1`, `ik + 1`, `ijk + 1` en `i + j + k + 1`
data <- data[-c(k + 1, j + 1, i + 1, j * k + 1, i * j + 1, i * k + 1, i * j * k + 1), ]

print("Rows removed")


# Plot the distribution of the 'los' variable
plot <- ggplot(data, aes(x = los)) +
  geom_histogram(color = "black", fill = "white") +
  labs(x = "Length of Stay (days)", y = "Frequency", title = "Distribution of Length of Stay")

# Print the plot
print(plot)

qqplot <- ggqqplot(data$los, ylab = "Length of Stay (days)", xlab = "Theoretical Quantiles")
print(qqplot)

# Perform the Shapiro-Wilk normality test
print(shapiro.test(data$los))

mean_los <- mean(data$los, na.rm = TRUE)
sd_los <- sd(data$los, na.rm = TRUE)
ks_result <- ks.test(data$los, "pnorm", mean_los, sd_los)
print(ks_result)

EPSILON <- 1e-6
# Scale oldvar to fit in [-1, 1]
data$los_scaled <- 2 * (data$los - min(data$los, na.rm = TRUE)) / (max(data$los, na.rm = TRUE) - min(data$los, na.rm = TRUE)) - 1

data$los_square_root <- sqrt(data$los)
data$los_cube_root <- data$los^(1 / 3)
data$los_nat_log <- ifelse(data$los != 0, log(data$los), 0)
data$los_log10 <- ifelse(data$los != 0, log10(data$los), 0)
data$los_inverse <- ifelse(data$los != 0, 1 / data$los, 0)
data$los_arcsine <- asin(data$los_scaled)
data$los_hyperbolic_arcsine <- log(data$los + sqrt(data$los^2 + 1))

# Plot the distribution of the new variables
plot_square_root <- ggplot(data, aes(x = los_square_root)) +
  geom_histogram(color = "black", fill = "white") +
  labs(
    x = "Square Root of Length of Stay",
    y = "Frequency",
    title = "Distribution of Square Root of Length of Stay"
  )

plot_cube_root <- ggplot(data, aes(x = los_cube_root)) +
  geom_histogram(color = "black", fill = "white") +
  labs(
    x = "Cube Root of Length of Stay",
    y = "Frequency",
    title = "Distribution of Cube Root of Length of Stay"
  )

plot_nat_log <- ggplot(data, aes(x = los_nat_log)) +
  geom_histogram(color = "black", fill = "white") +
  labs(
    x = "Natural Logarithm of Length of Stay",
    y = "Frequency",
    title = "Distribution of Natural Logarithm of Length of Stay"
  )

plot_log10 <- ggplot(data, aes(x = los_log10)) +
  geom_histogram(color = "black", fill = "white") +
  labs(
    x = "Base 10 Logarithm of Length of Stay",
    y = "Frequency",
    title = "Distribution of Base 10 Logarithm of Length of Stay"
  )

plot_inverse <- ggplot(data, aes(x = los_inverse)) +
  geom_histogram(color = "black", fill = "white") +
  labs(
    x = "Inverse of Length of Stay",
    y = "Frequency",
    title = "Distribution of Inverse of Length of Stay"
  )

plot_arcsine <- ggplot(data, aes(x = los_arcsine)) +
  geom_histogram(color = "black", fill = "white") +
  labs(
    x = "Arcsine of Length of Stay",
    y = "Frequency",
    title = "Distribution of Arcsine of Length of Stay"
  )

plot_hyperbolic_arcsine <- ggplot(data, aes(x = los_hyperbolic_arcsine)) +
  geom_histogram(color = "black", fill = "white") +
  labs(
    x = "Hyperbolic Arcsine of Length of Stay",
    y = "Frequency",
    title = "Distribution of Hyperbolic Arcsine of Length of Stay"
  )

# Print the plots
print(plot_square_root)
print(plot_cube_root)
print(plot_nat_log)
print(plot_log10)
print(plot_inverse)
print(plot_arcsine)
print(plot_hyperbolic_arcsine)

# Generate QQ plots for the transformed variables
qqplot_square_root <- ggqqplot(data$los_square_root,
  ylab = "Square Root of Length of Stay",
  xlab = "Theoretical Quantiles"
)
print(qqplot_square_root)

qqplot_cube_root <- ggqqplot(data$los_cube_root,
  ylab = "Cube Root of Length of Stay",
  xlab = "Theoretical Quantiles"
)
print(qqplot_cube_root)

qqplot_nat_log <- ggqqplot(data$los_nat_log,
  ylab = "Natural Logarithm of Length of Stay",
  xlab = "Theoretical Quantiles"
)
print(qqplot_nat_log)

qqplot_log10 <- ggqqplot(data$los_log10,
  ylab = "Base-10 Logarithm of Length of Stay",
  xlab = "Theoretical Quantiles"
)
print(qqplot_log10)

qqplot_inverse <- ggqqplot(data$los_inverse,
  ylab = "Inverse of Length of Stay",
  xlab = "Theoretical Quantiles"
)
print(qqplot_inverse)

qqplot_arcsine <- ggqqplot(data$los_arcsine,
  ylab = "Arcsine of Scaled Length of Stay",
  xlab = "Theoretical Quantiles"
)
print(qqplot_arcsine)

qqplot_hyperbolic_arcsine <- ggqqplot(data$los_hyperbolic_arcsine,
  ylab = "Hyperbolic Arcsine of Length of Stay",
  xlab = "Theoretical Quantiles"
)
print(qqplot_hyperbolic_arcsine)

# Perform the Shapiro-Wilk normality test

print(shapiro.test(data$los_square_root))
print(shapiro.test(data$los_cube_root))
print(shapiro.test(data$los_nat_log))
print(shapiro.test(data$los_log10))
print(shapiro.test(data$los_inverse))
print(shapiro.test(data$los_arcsine))
print(shapiro.test(data$los_hyperbolic_arcsine))
