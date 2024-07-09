#air pollution assigment

library(dplyr)

getwd()
First <- read.csv("C:\\Users\\Patrick Niekamp\\Desktop\\Data Science\\datasciencecoursera\\specdata/001.csv")
First
pollutant <- "sulfate"
mean <- mean(First[[pollutant]], na.rm = TRUE)

directory <- "C:/Users/Patrick Niekamp/Desktop/Data Science Series/datasciencecoursera/specdata"
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
  directory <- "C:\\Users\\Patrick Niekamp\\Desktop\\Data Science\\datasciencecoursera\\specdata"
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

pollutantmean("specdata", "nitrate", 23)


complete <- function (directory, id = 1:332) {
  directory <- "C:\\Users\\Patrick Niekamp\\Desktop\\Data Science\\datasciencecoursera\\specdata"
  file_list <- list.files(directory, full.names = TRUE)
  file_sublist <- file_list[id]
  for (file in file_sublist) {
    data <- read.csv(file)
    data_list[[file]] <- data
  }
  combined_data <- do.call(rbind, data_list)
  combined_data
  
  
}



count <- 
  First %>%
  group_by(ID) %>%
  summarise(count = !is.na(First$sulfate) & !is.na(First$nitrate))
count
