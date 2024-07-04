
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

#while loops

count <- 0
while(count <10) {
  print(count)
  count <- count + 1 
}


z <- 5

while( z >= 3 && z <=10) {
  print(z)
  coin <- rbinom(1,1,0.5)
  
  if (coin == 1) {
    z <- z + 1
    
  }else {z <- z - 1}
}

#repeats, optimization

x0 <- 1
tol <- 1e-8

repeat {
  x1 <- computeEstimate()
  if(abs(x1-x0) < tol) {
    break
  } else {
    x0 <- x1
  }
}

#for loop for investing

money <- 25000
years <- 25
growth <- 1.03

# Vectors to store years and money values
year_vector <- 1:years
money_vector <- numeric(years)

for (year in 1:years) {
  money <- money * 1.03 + 25000
  money_vector[year] <- money
  print(money)
}

money_2 <- 25000
money_vector_not_invested <- numeric(years)

for (year in 1:years) {
  money_2 <- money_2 + 25000
  money_vector_not_invested[year] <- money_2
  print(money_2)
}

y_min <- min(money_vector)
y_max <- max(money_vector,money_vector_6)


money <- 25000
money_vector_6 <- numeric(years)
growth <- 1.06

for (year in 1:years) {
  money <- money * growth + 25000
  money_vector_6[year] <- money
  print(money)
}



plot(year_vector, money_vector, type="o", col="blue", xlab="Year", ylab="Money", main="Money Growth Over 25 Years (25000 saved or invested)",  ylim=c(y_min, y_max))
lines(year_vector, money_vector_not_invested, type="o", col="red")
lines(year_vector, money_vector_6, type="o", col="green3")
legend("topleft", legend=c("3% return of investment", "Money saved in bank", "6% return of investment"), col=c("blue", "red", "green"), lty=1, pch=1)


#functions (can be put into a package or text file)

add2 <- function(x, y){
  x+y
}

add2(3,5)


above10 <- function(x) {
  use <- x > 10
  x[use]
}

above <- function(x, n){
  use <- x > n
  x[use]
}


colummean <- function(y, removeNA = TRUE){
  nc <- ncol (y)
  means <- numeric(nc)
  for (i in 1:nc) {
    means [i] <- mean(y[, i], na.rm = removeNA)
  }
  means
}


mydata <- rnorm(100, 1:100)
mydata
sd(mydata)




