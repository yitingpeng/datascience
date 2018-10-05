#install packages
install.packages("rJava")
install.packages("Rwordseg", repos="http://R-Forge.R-project.org")
install.packages("tm")
install.packages("tmcn", repos="http://R-Forge.R-project.org", type="source")
install.packages("wordcloud")
install.packages("XML")
install.packages("RCurl")
install.packages("bitops")

#??“å?–ptt??‡ç??
library(XML)
library(RCurl)
library(httr)

for(i in 1:58){
  tmp <-paste(i,'.html', sep= " ")
  web <-paste("www.ptt.cc/bbs/LeeJongSuk/index",tmp,sep=" ")
  html<-content(GET(web, asText=T))
  htmlparse<- htmlParse(html)
  web.list <-xpathSApply(html, "//div[@class='title']/a[@href]", xmlAttrs)
  data <- rbind(data, paste("www.ptt.cc", web.list, sep= " "))
  }
data<- unlist(data)

getdoc <-function(line)