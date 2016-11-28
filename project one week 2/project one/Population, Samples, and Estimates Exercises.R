library(downloader) 
url <- "https://raw.githubusercontent.com/genomicsclass/dagdata/master/inst/extdata/mice_pheno.csv"
filename <- basename(url)
download(url, destfile=filename)
dat <- read.csv(filename) 

##We will remove the lines that contain missing values:
dat <- na.omit( dat )
library(dplyr)

controlMales <- filter(dat, Sex=="M") %>% filter(Diet=="chow")  %>% select(Bodyweight) %>% unlist 


#Use dplyr to create a vector x with the body weight of all males on the control (chow) diet. What is this population's average?
x <-mean(controlMales)
#Now use the rafalib package and use the popsd function to compute the population standard deviation.
library(rafalib)
popsd(controlMales)
#Set the seed at 1. Take a random sample X of size 25 from x. What is the sample average?
set.seed(1)
XOb <-  mean(sample(controlMales, 25))

#Use dplyr to create a vector y with the body weight of all males on the high fat hf) diet. What is this population's average?
controlMalesHF <- filter(dat, Sex=="M") %>% filter(Diet=="hf")  %>% select(Bodyweight) %>% unlist 
y <- mean(controlMalesHF)
#Now use the rafalib package and use the popsd function to compute the population standard deviation.
popsd(controlMalesHF)
#Set the seed at 1. Take a random sample Y of size 25 from y. What is the sample average?
set.seed(1)
YOb <-  mean(sample(controlMalesHF, 25))
#What is the difference in absolute value between y¯−x¯ and Y¯−X¯?
(y - x) - (YOb - XOb)
#Repeat the above for females. Make sure to set the seed to 1 before each sample call. What is the difference in absolute value between y¯−x¯ and X¯−Y¯?
controlFemales <- filter(dat, Sex=="F" & Diet=="chow") %>% select(Bodyweight) %>% unlist
controlFemalesHF <- filter(dat, Sex=="F" & Diet=="hf") %>% select(Bodyweight) %>% unlist
x <- mean(controlFemales)
y <- mean(controlFemalesHF)
set.seed(1)
XOb <-  mean(sample(controlFemales, 25))
set.seed(1)
YOb <-  mean(sample(controlFemalesHF, 25))
abs((y - x) - (YOb - XOb))

