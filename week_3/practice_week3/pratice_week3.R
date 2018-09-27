##week3_course practice

##install and libary ggplot
install.packages('ggplot2')
library(ggplot2)

##using data and change the form of the data

d1<-women
d1
##note¡Gušusing captial words on the first letter of "v"iew
View(d1)
summary(d1)

##plot a photogram
ggplot(d1, aes(x=height, y=weight))
##Add dots into the photogram.
ggplot(d1, aes(x=height, y=weight))+
  geom_point()
##Change the pattern of dots.
ggplot(d1, aes(x=height, y=weight)) +
  geom_point(color = "red", shape = 8)
##Add details of labels
ggplot(d1, aes(x=height, y=weight)) +
  geom_point(color = "red", shape = 8)+
  labs(subtitle="The relationship between height and weight",
       y="Weight(lb)",
       x="Height(ft)",
       title="Scatterplot",
       caption="Source: women")


##try and error: does not work because of lack of y
##ggplot(d1, aes(x=height))
##ggplot(d1, aes(x=height))+geom_point()
##ggplot(d1, aes(x=height)) + geom_point(color = "red", shape = 8)


#convert unit into cm and kg
d2<-d1
d2<-data.frame(d2$height*2.54,d2$weight*0.45)
View(d1)
View(d2)
names(d2)<-c("height", "weight")

##plot a photogram
ggplot(d2, aes(x=height, y=weight))
##Add dots into the photogram.
ggplot(d2, aes(x=height, y=weight))+
  geom_point()
##Change the pattern of dots.
ggplot(d2, aes(x=height, y=weight)) +
  geom_point(color = "blue", shape = 9)
##Add details of labels
ggplot(d2, aes(x=height, y=weight)) +
  geom_point(color = "blue", shape = 9)+
  labs(subtitle="The relationship between height and weight",
       y="Weight(kg)",
       x="Height(cm)",
       title="Scatterplot",
       caption="Source: women")


