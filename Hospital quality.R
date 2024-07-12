

getwd()

hospital_data <- read.csv("hospital-data.csv")
head(hospital_data)

outcome <- read.csv("outcome-of-care-measures.csv")
head(outcome)

ncol(outcome)
nrow(outcome)

outcome_heart <- as.numeric(outcome[,11])
hist(outcome_heart)

best <- function (state, outcome) {
  
}