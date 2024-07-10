
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


#control structures
#if/else
x <- 4
if(x > 3) {
  y <- 10
} else { y <- 0}
y

#for loops

for (i in 1:10) {
  print(i)
}

x <- matrix (1:6, 2, 3)
x

for (row in seq_len(nrow(x))) {
  for(col in seq_len(ncol(x))) {
    print(x[row, col])
  }
}



#Loop functions
#lapply, sapply...
#lapply: loop over a list and evaluate a function on each element
#sapply will try to simplify the result of lapply if possible

x <- 1:4
lapply(x, runif)

# apply function

x <- matrix(rnorm(200), 20, 10)
x
apply(x, 2, mean) #keep first dimension (columns) and eradicate (rows)

#rowSums = apply(x,1,mean)

apply(x, 1, quantile, probs = c(0.25, 0.75))


#mapply, multivariant apply which applies a function in parallel over a set of arguments

mapply(rep, 1:4, 4:1)


#tapply, apply a function over subsets of a vector

x <- c(rnorm(10), runif(10), rnorm(10,1))
x
f <- gl(3,10)
f

tapply(x, f, mean)

tapply(x, f, range)

#split function. Takes a vector or an obejct and a factor variable and splits the vector

split(x,f)
lapply(split(x,f),mean)

data
head(data)

s <- split(data,data$Month)
s

lapply(s, function(z) colMeans(z[,  c("Ozone", "Solar.R", "Wind")]))

sapply(s, function(x) colMeans(x[,  c("Ozone", "Solar.R", "Wind")], na.rm = TRUE))


log(-1)

#debugging

#traceback, debug, browser, trace, recover

mean(x)

traceback()

lm(y ~ x)
traceback()

debug(lm)


library(datasets)
data(iris)
data
iris
?iris

mean(iris[["Sepal.Length"]])


virginica <- tapply(iris$Sepal.Length, iris$Species, mean)
virginica[["virginica"]]


iris

colMeans(iris)

apply(iris[, 1:4], 2, mean)

library(datasets)
data(mtcars)
?mtcars

mtcars

sapply(split(mtcars$mpg, mtcars$cyl), mean)
tapply(mtcars$mpg, mtcars$cyl, mean)
with(mtcars, tapply(mpg, cyl, mean))

tapply(mtcars$cyl, mtcars$mpg, mean)

mean(mtcars$mpg, mtcars$cyl)


mtcars

sapply(split(mtcars$hp), mean)


cyl4 <- subset(mtcars, cyl ==4)
cyl4
mean(cyl4$hp)
cyl8 <- subset(mtcars, cyl ==8)
cyl8

mean_hp_cyl4 <- mean(subset(mtcars, cyl == 4), mtcars$hp)

average_4 <- tapply(mtcars$hp, mtcars$cyl, mean)
average_8 <- tapply(mtcars$hp, mtcars$cyl, mean)
average_8[["8"]]
difference = average_8[["8"]] - average_4[['4']]
difference

tapply(mtcars$hp, mtcars$cyl, mean)

debug(ls)
ls()


#str function -> displays the structure of an R object

str(lm)

x <- rnorm(10, 2, 4)
x

summary(x)

str(x)

library(datasets)
head(airquality)
str(airquality)

s <- split(airquality, airquality$Month)
s
str(s)


#simulations

#rnorm, dnorm, pnorm, rpois

random <- rnorm(200, 19, 1)
random
mean(random)

set.seed(1)
rnorm(5)
#always set a seed when running a simulation

#simulating a linear model

set.seed(20)
x <- rnorm(100)
x
e <- rnorm(100, 0, 2)
e

