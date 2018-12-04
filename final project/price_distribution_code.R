Sys.setlocale(category = "LC_ALL", locale ="ENGLISH")
#read the data from steamspy
steamdata<-c()
for(year in 2012:2017){
  temp<-paste0(year,' - Year Stats - SteamSpy - All the data and stats about Steam games.csv')
  steamdata<-rbind(steamdata,read.csv(temp))
  }
steamdata$Price<-gsub("Free","0",steamdata$Price)
steamdata$Price<-gsub("^[[:punct:]]","",steamdata$Price)
steamdata$Price<-as.numeric(steamdata$Price)
summary(steamdata$Price)

