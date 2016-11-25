library(gapminder)
library(dplyr)
data(gapminder)
head(gapminder)

x <- filter(gapminder, year==1952) %>% select(lifeExp) %>% unlist
hist(x)
#1
mean(x <= 40)
#2
mean(x<=60) - mean(x<=40)


plot(ecdf(x))

prop = function(q) {
  mean(x <= q)
}
prop(60)
qs = seq(from=min(x), to=max(x), length=20)
props = sapply(qs, prop)
plot(qs, props)

props = sapply(qs, function(q) mean(x <= q))
?plot
