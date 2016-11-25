library(downloader) 
url <- "https://raw.githubusercontent.com/genomicsclass/dagdata/master/inst/extdata/femaleControlsPopulation.csv"
filename <- basename(url)
download(url, destfile=filename)
x <- unlist( read.csv(filename) )

#Ex 1
set.seed(1)
n <- 1000
avgs <- vector("numeric",n)
for(i in 1:n){
  avgPopulations <- sample(x,5)
  avgs[i] <- mean(avgPopulations)
}
hist(avgs)
avgX <- mean(x)
mean(abs(avgs - avgX) > 1)

#2 
set.seed(1)
n <- 10000
avgs <- vector("numeric",n)
for(i in 1:n){
  avgPopulations <- sample(x,5)
  avgs[i] <- mean(avgPopulations)
}
hist(avgs)
avgX <- mean(x)
mean(abs(avgs - avgX) > 1)

#3
set.seed(1)
n <- 1000
avgs <- vector("numeric",n)
for(i in 1:n){
  avgPopulations <- sample(x, 50)
  avgs[i] <- mean(avgPopulations)
}
hist(avgs)
avgX <- mean(x)
mean(abs(avgs - avgX) > 1)
