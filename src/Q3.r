# Ga na of er een verband is tussen het type hartinfarct en
# de ontslagstatus uit het ziekenhuis
# na opname. Voer een gepaste test uit

# Lees de data in
library(readr)
library(ggpubr)
# Define the file path
file_path <- "assets/heart.csv"

# Read the CSV file
data <- read.csv(file = file.choose(), header = TRUE, dec = ",", sep = ";")

# Print the first few rows of the data
print(head(data))

i <- 8
j <- 6
k <- 3

# Remove rows `k + 1`, `j + 1`, `i + 1`, `jk + 1`, `ij + 1`,
# `ik + 1`, `ijk + 1` en `i + j + k + 1`
data <- data[-c(k + 1, j + 1, i + 1, j * k + 1, i * j + 1, i * k + 1, i * j * k + 1), ]

print("Rows removed")

# Shapiro-Wilk normality test to check if the variables are normally distributed
print(shapiro.test(data$age))
print(shapiro.test(data$bmi))

# Pearson correlation, Kendall tau correlation, Spearman correlation
print(chisq.test(data$age, data$bmi))

print(cor.test(data$age, data$bmi, method = c("kendall")))

print(cor.test(data$age, data$bmi, method = c("spearman")))

# Generate a scatter plot of bmi and age

scatter <- ggscatter(data, x = "age", y = "bmi", 
                     add = "reg.line", conf.int = TRUE, 
                     cor.coef = TRUE, cor.method = "pearson",
                     xlab = "Age", ylab = "BMI")

print(scatter)
