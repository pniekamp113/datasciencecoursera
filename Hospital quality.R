getwd()


data <- read.csv("outcome-of-care-measures.csv", colClasses = "character")
head(outcome)

outcome_heart <- as.numeric(outcome[,11])
outcome_heart
hist(outcome_heart)
outcome["Hospital.Name"]
outcome["State"]


#, na.rm = TRUE
outcome_heart_attack <- as.numeric(outcome[["Hospital.30.Day.Death..Mortality..Rates.from.Heart.Attack"]])
outcome_heart_attack
outcome_heart_failure <- as.numeric(outcome[["Hospital.30.Day.Death..Mortality..Rates.from.Heart.Failure"]])
outcome_heart_failure
outcome_pneumonia <- as.numeric(outcome[["Hospital.30.Day.Death..Mortality..Rates.from.Pneumonia"]])
outcome_pneumonia

colnames(outcome)

list <- list() #create an empty list



best_heart <- tapply(outcome$TX, outcome$Hospital.30.Day.Death..Mortality..Rates.from.Heart.Attack, min)      # split outcome file by states
#add to list hospital with lowest mortality rate
?tapply
?split


state_data <- split(data, data$State)
head(state_data)
name_state_heart <- data[, c("Hospital.Name", "State", "Hospital.30.Day.Death..Mortality..Rates.from.Heart.Attack")]
name_state_heart_TX <- subset(name_state_heart, State == "TX")
name_state_heart_TX

min_TX <- name_state_heart_TX[which.min(name_state_heart_TX$Hospital.30.Day.Death..Mortality..Rates.from.Heart.Attack), ]



if (!state %in% data$State) {
  print("Please enter a correct state")
} 

data <- read.csv("outcome-of-care-measures.csv", colClasses = "character")




best <- function(state, outcome) {
  data <- read.csv("outcome-of-care-measures.csv", colClasses = "character") #read data file
  
  #if state or outcome input are invalid, user will be notified
  if (!state %in% data$State) {
    print("invalid state")
  }
  
  valid_outcomes <- c("heart attack","heart failure", "pneumonia" )
  
  if (!outcome %in% valid_outcomes) {
    print("invalid outcome")
  }
  
  #ensures that input is correctly assigned to column
  if (outcome == "heart attack") { outcome <- "Hospital.30.Day.Death..Mortality..Rates.from.Heart.Attack"}
  if (outcome == "heart failure") { outcome <- "Hospital.30.Day.Death..Mortality..Rates.from.Heart.Failure"}
  if (outcome == "pneumonia") { outcome <- "Hospital.30.Day.Death..Mortality..Rates.from.Pneumonia"}
  
  state_data <- split(data, data$State) #split the file by states
  name_state_outcome <- data[, c("Hospital.Name", "State", outcome)]
  name_state_outcome_state <- subset(name_state_outcome, State == state)
  name_state_outcome_state <- name_state_outcome_state[!is.na(name_state_outcome_state[[outcome]]),] #remove NAs
  min_state <- name_state_outcome_state[which.min(name_state_outcome_state[[outcome]]), ]
  print(min_state$Hospital.Name)

  
}

best("TX", "heart attack")
best("TX", "heart failure")
best("MD", "heart attack")
best("MD", "pneumonia")
best("BB", "heart attack")
best("NY", "hert attack")


#Ranking hospitals by outcome in a state


rankhospital <- function(state, outcome, num = "best") {
  data <- read.csv("outcome-of-care-measures.csv", colClasses = "character") #read data file
  
  #if state or outcome input are invalid, user will be notified
  if (!state %in% data$State) {
    print("invalid state")
  }
  
  valid_outcomes <- c("heart attack","heart failure", "pneumonia" )
  
  if (!outcome %in% valid_outcomes) {
    print("invalid outcome")
  }
  
  #ensures that input is correctly assigned to column
  if (outcome == "heart attack") { outcome <- "Hospital.30.Day.Death..Mortality..Rates.from.Heart.Attack"}
  if (outcome == "heart failure") { outcome <- "Hospital.30.Day.Death..Mortality..Rates.from.Heart.Failure"}
  if (outcome == "pneumonia") { outcome <- "Hospital.30.Day.Death..Mortality..Rates.from.Pneumonia"}
  
  state_data <- split(data, data$State) #split the file by states
  name_state_outcome <- data[, c("Hospital.Name", "State", outcome)] #select columns of interest
  name_state_outcome_state <- subset(name_state_outcome, State == state) #subset for specific state
  
  name_state_outcome_state <- name_state_outcome_state[!is.na(name_state_outcome_state[[outcome]]),] #remove NAs
  
  if (num > nrow(name_state_outcome_state)) {print("NA") } #print NA if num is too high
  
  sorted <- name_state_outcome_state[order(name_state_outcome_state[[outcome]]),]
  
  
  
  
  print(sorted[num, ])
  
}


rankhospital("TX", "heart failure", 1)

rankhospital("MD", "heart attack", "worst")



