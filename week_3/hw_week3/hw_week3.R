#install and libary ggplot
install.packages('ggplot2')
library(ggplot2)

#read data and setting
newtaipei<-read.csv(file="newtaipeicity.csv", header= T, sep= ",")
newtaipei
View(newtaipei)
heading<- c("year", "ratio1", "ratio2","ratio3" )
names(newtaipei)<-heading
str(newtaipei)
as.character(newtaipei$year)
summary(newtaipei)

#plot a batchart


ggplot(newtaipei, aes(x=year, y=ratio1))+geom_bar(stat="identity", width=.5, fill="tomato1") + 
  labs(title="Ratio of under-junior-high-school level in New Taipei City", 
       x="YEAR",
       y="RATIO OF UNDER-JUNIOR-HIGH-SCHOOL LEVEL(%)",
  subtitle="Year Vs Ratio", 
  caption="source: 內政部統計資料庫")

ggplot(newtaipei, aes(x=year, y=ratio2))+geom_bar(stat="identity", width=.5, fill="tomato2") + 
  labs(title="Ratio of high-school level in New Taipei City", 
       x="YEAR",
       y="RATIO OF HIGH-SCHOOL LEVEL(%)",
       subtitle="Year Vs Ratio", 
       caption="source: 內政部統計資料庫")

ggplot(newtaipei, aes(x=year, y=ratio3))+geom_bar(stat="identity", width=.5, fill="tomato3") + 
  labs(title="Ratio of above-unversity level in New Taipei City", 
       x="YEAR",
       y="RATIO OF ABOBE-UNVERSITY LEVEL(%)",
       subtitle="Year Vs Ratio", 
       caption="source: 內政部統計資料庫")


