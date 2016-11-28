library(downloader)
url <- "https://raw.githubusercontent.com/genomicsclass/dagdata/master/inst/extdata/femaleControlsPopulation.csv"
filename <- basename(url)
download(url, destfile=filename)
x <- unlist( read.csv(filename) )

n <- 1000
set.seed(1)
avgM1 <- vector('numeric', n)
for (i in 1:n) {
  avgM1[i] <- mean(sample(x, 5))
}
avgM50 <- vector('numeric', n)
set.seed(1)
for (i in 1:n) {
  avgM50[i] <- mean(sample(x, 50))
}

hist(avgM1)
hist(avgM50)

avgX <- mean(x)
mean(avgM50 <=25) - mean(avgM50 <=23)

#Now ask the same question of a normal distribution with average 23.9 and standard deviation 0.43.
# respota obtida apos usar todas as chances
pnorm( (25-23.9) / 0.43)  - pnorm( (23-23.9) / 0.43) 
