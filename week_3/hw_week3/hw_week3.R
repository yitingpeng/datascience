#install and libary ggplot
install.packages('ggplot2')
library(ggplot2)

#read data and setting
newtaipei<-read.csv(file="newtaipeicity.csv", header= T, sep= ",")
newtaipei
View(newtaipei)
heading<- c("year", "ratio.of.under_junior_school_level", "ratio of under high school level","ratio of above unversity level" )
names(newtaipei)<-heading
str(newtaipei)
as.character(newtaipei[,1])
summary(newtaipei)

#plot a photogram
ggplot(d2, aes(x="year", y="ratio of under junior school level" ))
##Add dots into the photogram.
ggplot(newtaipei, aes(x="year", y="ratio of under junior school level" ))+
   geom_histogram()

ggplot(newtaipei, aes(x="year", y="ratio of under junior school level"))+
  geom_bar(stat="identity", width=.5, fill="blue4") + 
  labs(title="Ordered Bar Chart", 
  subtitle="Make Vs Avg. Mileage", 
  caption="source: 內政部統計資料庫")

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