#install and libary ggplot
install.packages('ggplot2')
library(ggplot2)

#read data and setting
newtaipei<-read.csv(file="newtaipeicity.csv", header= T, sep= ",")
View(newtaipei)
heading<- c("year", "ratio1", "ratio2","ratio3" )
names(newtaipei)<-heading
str(newtaipei)
as.character(newtaipei$year)
newtaipei
summary(newtaipei)

#plot a barchart


ggplot(newtaipei, aes(x=year, y=ratio1))+
  geom_bar(stat="identity", width=.5, fill="tomato1") + 
  labs(title="Ratio of under-junior-high-school level in New Taipei City", 
       x="Year",
       y="Ratio of Under-Junior-High-School Level(%)",
       subtitle="Year Vs Ratio", 
       caption="source: 內政部統計資料處")

ggplot(newtaipei, aes(x=year, y=ratio2))+
  geom_bar(stat="identity", width=.5, fill="tomato2") + 
  labs(title="Ratio of high-school level in New Taipei City", 
       x="Year",
       y="Ratio of High-School Level(%)",
       subtitle="Year Vs Ratio", 
       caption="source: 內政部統計資料處")

ggplot(newtaipei, aes(x=year, y=ratio3))+
  geom_bar(stat="identity", width=.5, fill="tomato3") + 
  labs(title="Ratio of above-unversity level in New Taipei City", 
       x="YEAR",
       y="RATIO OF ABOBE-UNVERSITY LEVEL(%)",
       subtitle="Year Vs Ratio", 
       caption="source: 內政部統計處")

#another method
theme_set(theme_classic())
ggplot(newtaipei, aes(x=year, y=ratio1))+
  geom_bar(stat="identity", aes(fill=ratio1), width = 0.5, position="stack") + 
  labs(title="Ratio of under-junior-high-school level in New Taipei City", 
       x="Year",
       y="Ratio of Under-Junior-High-School Level(%)",
       subtitle="Year Vs Ratio", 
       caption="source: 內政部統計資料處")

ggplot(newtaipei, aes(x=year, y=ratio2))+
  geom_bar(stat="identity", aes(fill=ratio2), width = 0.5, position="stack") + 
  labs(title="Ratio of high-school level in New Taipei City", 
       x="Year",
       y="Ratio of High-School Level(%)",
       subtitle="Year Vs Ratio", 
       caption="source: 內政部統計資料處")

ggplot(newtaipei, aes(x=year, y=ratio3))+
  geom_bar(stat="identity", aes(fill=ratio3), width = 0.5, position="stack") + 
  labs(title="Ratio of above-unversity level in New Taipei City", 
       x="Year",
       y="Ratio of Above-Unverstity Level(%)",
       subtitle="Year Vs Ratio", 
       caption="source: 內政部統計資料處")

# Histogram on a Categorical variable
g <- ggplot(mpg, aes(manufacturer))
g + geom_bar(aes(fill=class), width = 0.5) + 
  theme(axis.text.x = element_text(angle=65, vjust=0.6)) + 
  labs(title="Histogram on Categorical Variable", 
       subtitle="Manufacturer across Vehicle Classes") 


