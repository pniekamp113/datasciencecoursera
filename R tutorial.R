
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
