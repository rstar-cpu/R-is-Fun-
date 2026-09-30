# ------------------------------------------------------------
# Task: Load the dataset
# File > Import Dataset > From Text (base)
# Select simulated_PHQ9_GAD7_sleep_data.csv
# Ensure heading is set to "Yes"
# Import
# ------------------------------------------------------------

# ------------------------------------------------------------
# Task: Import and inspect data
# ------------------------------------------------------------

mydata <- simulated_PHQ9_GAD7_sleep_data

# ------------------------------------------------------------
# Task: Use View() and summary to inspect the dataset
# ------------------------------------------------------------

View(mydata)
summary(mydata)

# ------------------------------------------------------------
# Task: Try the is.na function to find which record IDs are
#       missing sleep values
# ------------------------------------------------------------

mydata$record_id[is.na(mydata$sleep_hours)]

# ------------------------------------------------------------
# Task: There are 3 participants with NAs on sleep
#       You learn that the values are 4.4, 9.9, and 5.5, respectively
#       Fill in those values
# ------------------------------------------------------------

# Plain English: "In mydata, find the row where record_id is "P025", 
# then set that person's sleep_hours value to 4.4."
mydata$sleep_hours[mydata$record_id == "P025"] <- 4.4

# Plain English: In mydata, find the row where record_id is "P038", 
# then set that person's sleep_hours value to 9.9.
mydata$sleep_hours[mydata$record_id == "P038"] <- 9.9

# Plain English: In mydata, find the row where record_id is "P098", 
# then set that person's sleep_hours value to 5.5.
mydata$sleep_hours[mydata$record_id == "P098"] <- 5.5


# ------------------------------------------------------------
# Task: Create a total score for the GAD-7 using rowSums()
# ------------------------------------------------------------

# Create a new variable called gad7_total 
# by adding together each participant’s scores on gad1 through gad7
mydata$gad7_total <- rowSums(
  mydata[, c("gad1", "gad2", "gad3", "gad4", "gad5", "gad6", "gad7")]
)

# ------------------------------------------------------------
# Task: Calculate Cronbach's alpha values for the
#       PHQ-9 and GAD-7 scales. Use the psych package
# ------------------------------------------------------------

library(psych)

alpha(
  mydata[ , c("gad1", "gad2", "gad3", "gad4", "gad5", 
              "gad6", "gad7")]
)

alpha(
  mydata[, c("phq1", "phq2", "phq3", "phq4", "phq5",
             "phq6", "phq7", "phq8", "phq9")]
)

# ------------------------------------------------------------
# Task: use the describe() function in psych on each scale
#       Examine the mean, median, standard deviation, and range
# ------------------------------------------------------------

describe(mydata$phq9_total)
describe(mydata$gad7_total)
describe(mydata$sleep_hours)

# ------------------------------------------------------------
# Task: Plot histograms for the GAD-7, PHQ-9, and Sleep Hours
# ------------------------------------------------------------

hist(mydata$phq9_total)
hist(mydata$gad7_total)
hist(mydata$sleep_hours)

# ------------------------------------------------------------
# Task: Compute Spearman correlations between each pair
# ------------------------------------------------------------

?cor

# Correlation between PHQ-9 and sleep
cor(
  mydata$phq9_total,
  mydata$sleep_hours,
  method = "spearman"
)

# Correlation between GAD-7 and sleep
cor(
  mydata$gad7_total,
  mydata$sleep_hours,
  method = "spearman"
)

# Correlation between PHQ-9 and GAD-7
cor(
  mydata$phq9_total,
  mydata$gad7_total,
  method = "spearman"
)

# ------------------------------------------------------------
# Task: Use plot() to visualize each paired correlation
# ------------------------------------------------------------

# PHQ-9 and GAD-7
plot(
  mydata$phq9_total,
  mydata$gad7_total,
  xlab = "PHQ-9 Total",
  ylab = "GAD-7 Total"
)

# PHQ-9 and Sleep
plot(
  mydata$phq9_total,
  mydata$sleep_hours,
  xlab = "PHQ-9 Total",
  ylab = "Average Hours of Sleep"
)

# GAD-7 and Sleep
plot(
  mydata$gad7_total,
  mydata$sleep_hours,
  xlab = "GAD-7 Total",
  ylab = "Average Hours of Sleep"
)
