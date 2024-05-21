# Ga na of er een verband is tussen het type hartinfarct en
# de ontslagstatus uit het ziekenhuis
# na opname. Voer een gepaste test uit

# Lees de data in
library(readr)
library(ggpubr)
# Define the file path
file_path <- "assets/heart.csv"

# Read the CSV file
data <- read.csv(file = file.choose(), header = TRUE, sep = ";")

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
print(shapiro.test(data$mitype))
print(shapiro.test(data$dstat))

# Pearson correlation, Kendall tau correlation, Spearman correlation
print(chisq.test(data$mitype, data$dstat))

print(cor.test(data$mitype, data$dstat, method = c("kendall")))

print(cor.test(data$mitype, data$dstat, method = c("spearman")))
