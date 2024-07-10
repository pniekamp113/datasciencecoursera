#air pollution assigment

library(dplyr)

getwd()
First <- read.csv("specdata/001.csv")
First
pollutant <- "sulfate"
mean <- mean(First[[pollutant]], na.rm = TRUE)

directory <- "/specdata"
id <- 1:10

id <- 1:10
file_list <- list.files(directory, full.names = TRUE)
file_sublist <- file_list[id]
data_list <- list()
file_sublist

for (file in file_sublist) {
  data <- read.csv(file)
  data_list[[file]] <- data
}

data_list

combined_data <- do.call(rbind, data_list)
combined_data
meansulfate <- mean(combined_data[[pollutant]], na.rm = TRUE)
meansulfate

pollutantmean <- function(directory, pollutant, id = 1:332) {
  data_list <- list()
  file_list <- list.files(directory, full.names = TRUE)
  file_sublist <- file_list[id]
  for (file in file_sublist) {
    data <- read.csv(file)
    data_list[[file]] <- data
  }
  combined_data <- do.call(rbind, data_list)
  combined_data
  mean <- mean(combined_data[[pollutant]], na.rm = TRUE)
  print(mean)
}

pollutantmean("specdata", "sulfate", 1:10)
pollutantmean("specdata", "nitrate", 70:72)
pollutantmean("specdata", "nitrate", 23)
pollutantmean("specdata", "sulfate", 34)
pollutantmean("specdata", "nitrate")

complete <- function (directory, id = 1:332) {
  file_list <- list.files(directory, full.names = TRUE)
  file_sublist <- file_list[id]
  data_list <- list()
  for (file in file_sublist) {
    data <- read.csv(file)
    data_list[[file]] <- data
  }
  combined_data <- do.call(rbind, data_list)
  
  complete_cases <- numeric(length(id))
  for (i in seq_along(id)) {
    id_data <- combined_data[combined_data$ID == id[i], ]
    complete_cases[i] <- sum(!is.na(id_data$sulfate) & !is.na(id_data$nitrate))
  }
  result <- data.frame(ID = id, nobs = complete_cases)
  result
  
}

complete("specdata", 1)
complete("specdata", c(2, 4, 8, 10, 12))
complete("specdata", 30:25)
complete("specdata", 3)
cc <- complete("specdata", c(6, 10, 20, 34, 100, 200, 310))
cc <- complete("specdata", 54)
cc
RNGversion("3.5.1")  
set.seed(42)
cc <- complete("specdata", 332:1)
use <- sample(332, 10)
print(cc[use, "nobs"])



corr_old <- function(directory, threshold = 0) {
  file_list <- list.files(directory, full.names = TRUE)
  data_list <- list()
  for (file in file_list) {
    data <- read.csv(file)
    data_list[[file]] <- data
  }
  combined_data <- do.call(rbind, data_list)
  

  threshold_data <- combined_data[!is.na(combined_data$sulfate) & !is.na(combined_data$nitrate) & combined_data$sulfate > threshold & combined_data$nitrate > threshold, ]
  correlation <- cor(threshold_data$sulfate, threshold_data$nitrate)
  result <- data.frame(correlation = correlation)
  result
  
}


cr <- corr("specdata", 150)
head(cr)

combined_data
threshold <- 1
threshold_data <- combined_data[!is.na(combined_data$sulfate) & !is.na(combined_data$nitrate) & combined_data$sulfate > threshold & combined_data$nitrate > threshold, ]
threshold_data
correlation <- cor(threshold_data$sulfate, threshold_data$nitrate)
correlation
head(cr)
summary(cr)


max_sulfate <- max(combined_data$sulfate, na.rm = TRUE)
max_sulfate


corr <- function(directory, threshold = 0) {
  file_list <- list.files(directory, full.names = TRUE)
    data_list <- list()
  for (file in file_list) {
    data <- read.csv(file)
    data_list[[file]] <- data
  }
  combined_data <- do.call(rbind, data_list)
  combined_data <- na.omit(combined_data)
  
  ## Initiate a new vector to store future values from FOR loop function:
  correlation <- vector(mode="numeric", length = 0)
  
  id = 1:332
  for (i in id) {
    id_set <- subset(combined_data, combined_data$ID == i)
    good <- complete.cases(id_set)
    complete <- id_set[good, ]
    
    if(nrow(complete) > threshold) {
      cor_vector <- cor(complete[["sulfate"]], complete[["nitrate"]])
      correlation <- append(correlation, cor_vector)
    }
    
  }
  return(correlation)
  
}

cr <- corr("specdata", 150)
head(cr)
summary(cr)
cr <- corr("specdata", 400)
head(cr)
summary(cr)
cr <- corr("specdata", 5000)
summary(cr)


cr <- corr("specdata")                
cr <- sort(cr)   
RNGversion("3.5.1")
set.seed(868)                
out <- round(cr[sample(length(cr), 5)], 4)
print(out)

cr <- corr("specdata", 129)                
cr <- sort(cr)                
n <- length(cr)    
RNGversion("3.5.1")
set.seed(197)                
out <- c(n, round(cr[sample(n, 5)], 4))
print(out)


count <- 
  First %>%
  group_by(ID) %>%
  summarise(count = !is.na(First$sulfate) & !is.na(First$nitrate))
count
cr <- corr("specdata", 2000)                
n <- length(cr)                
cr <- corr("specdata", 1000)                
cr <- sort(cr)
print(c(n, round(cr, 4)))
