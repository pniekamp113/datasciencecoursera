
#R basics tutorial

getwd()

myfunction <- function() {
  x <- rnorm(100)
  mean(x)
}

myfunction()

dir()

1 / 0

#c created vectors

x <- c(0.5, 0.6)
x
y <- 9:29
y

xy <- vector ("numeric", length = 12) #default value is 0
xy

x <- list(1,"a", TRUE, 1 + 4i)
x

y <- list(1,2,3,4,5)
y


m <- matrix (nrow = 2, ncol = 3)
m
dim(m)

m <- matrix (1:6, nrow = 2, ncol = 3)
m

m <- 1:10
m
dim(m) <- c(2,5)
m

x <- 1:3
y <- 10:12
cbind(x,y)


x <- factor(c("yes", "no", "yes"))
table(x)

#levels are sorted by alphabetical order

x <- c(1,2,NA,10,3)
is.na(x)

is.nan(x)

x <- data.frame(foo = 1:4, bar = c(T, T, F, F))
x

con <- url("http://jhsph.edu", "r")
x <- readLines(con)
x
head(x)


x <- c("a", "b", "c", "d", "e")
x[2]
x[1:2]
x[x > "a"]

u <- x > "a"
u


x <- 4
class(x)

x <- c(4, "a", TRUE)
class(x)


x <- c(1,3, 5) 
y <- c(3, 2, 10)
rbind(x,y)


x <- list(2, "a", "b", TRUE)
x[[2]]
y <- x$a
y

x <- 1:4
y <- 2:3
z <- x+y
z
class(z)


x <- c(3, 5, 1, 10, 12, 6)
x[x <= 5] <- 0
x

getwd()

data <- read.csv("hw1_data.csv")
data

head(data, n =2)

nrow(data)

tail(data, n=2)

data[, 2]

ozone <- data[,1]
ozone
NAs <- is.na(ozone)

sum(NAs)

mean(ozone)

mean_value <- mean(data[["Ozone"]], na.rm = TRUE)
mean_value

subset_Ozone <- data[data[["Ozone"]] > 31,]
subset_Ozone
subset_temp_ozone <- subset_Ozone[subset_Ozone[["Temp"]] > 90, ]
subset_temp_ozone

mean(subset_temp_ozone[["Solar.R"]], na.rm = TRUE)

data

month6 <- data[data[["Month"]] == 6, ]
month6
mean(month6[["Temp"]], na.rm = TRUE)


May <- data[data[["Month"]] == 5, ]
May

max(May[["Ozone"]], na.rm = TRUE)


x <- list(2, "a", "b", TRUE)
x[[1]]

head(data, n = 2)

nrow(data)

tail(data, n = 2)

data[47, ]
