
install.packages("tidyverse")
library(tidyverse)

install.packages("NHANES")
library(NHANES)

# Loading the dataset
health.data <- NHANES
View(health.data)


# Selecting specific columns
health.data <- health.data %>% select(Age, Gender, BMI, BPSysAve, TotChol)

# Filtering for individuals older than 50 and BMI greater than 18.5
health.data <- health.data %>% filter(Age > 50, BMI > 18.5)

# Mutate
health.data <- health.data %>% mutate(BMI_Category = ifelse(BMI > 25, "Overweight", "Normal"))

# Group by  and summary
gender_summary <- health.data %>% group_by(Gender) %>% summarise(avg_BMI = mean(BMI, na.rm = TRUE))

#  missing values
sum(is.na(health.data))
colSums(is.na(health.data))

# Removing rows with missing values
health.data_no_missing <- health.data %>% drop_na()

#  cardinality 
sapply(health.data, function(x) length(unique(x)))

## ggplot2 visualization

# Histogram of BMI distribution
ggplot(health.data, aes(x = BMI)) +
  geom_histogram(binwidth = 2, fill = "blue", color = "black") +
  labs(title = "BMI Distribution", x = "BMI", y = "Count")

