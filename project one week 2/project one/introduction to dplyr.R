dat <- read.csv("msleep_ggplot2.csv")
class(dat)
View(dat)
library(dplyr)
primates <- filter(dat, order == "Primates") %>% summarise(mean(sleep_total))
primates

