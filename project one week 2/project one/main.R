library(downloader) 
url <- "https://raw.githubusercontent.com/genomicsclass/dagdata/master/inst/extdata/femaleMiceWeights.csv"
filename <- "femaleMiceWeights.csv"
download(url, destfile=filename)

dat <-read.csv("femaleMiceWeights.csv")
dat[12, 2]
dat$Bodyweight[11]
length(dat$Bodyweight)
data
mean(dat[13:24,]$Bodyweight)
set.seed(1)
sample(dat[13:24,]$Bodyweight, 1)
