##week3_course practice

##install and libary ggplot
install.packages('ggplot2')
library(ggplot2)

##using data and change the form of the data

d1<-women
d1
View(d1)
summary(d1)

##plot a photogram

ggplot(d1, aes(x=height, y=weight))

ggplot(d1, aes(x=height, y=weight))+
  geom_point()

ggplot(d1, aes(x=height, y=weight)) +
  geom_point(color = "red", shape = 8)


##try and error：it does not work because of lack of y
##ggplot(d1, aes(x=height))
##ggplot(d1, aes(x=height))+geom_point()
##ggplot(d1, aes(x=height)) + geom_point(color = "red", shape = 8)

