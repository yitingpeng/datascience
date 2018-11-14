#1.R_CRAWLER
#2.WORDS_CLEANING
#3.TFIDF
#4.GGPLOT&WORD_CLOUD
#5.SHINY

library(rvest)
#crawl title
title<-read_html("http://sports.ltn.com.tw/baseball")
title<-html_nodes(title, ".boxTitle .listA .list_title")
title<-html_text(title)
##title<-iconv(title,"UTF-8") change the code
title

#crawl url
url<-read_html("http://sports.ltn.com.tw/baseball")
url<-html_nodes(url, ".boxTitle .listA a ")
#!selector 選的區塊並不一樣!
url<-html_attr(url,"href")
url

#code brief version
title1<-read_html("http://sports.ltn.com.tw/baseball") %>%
  html_nodes(".boxTitle .listA .list_title") %>%
  html_text()%>%
  iconv("UTF-8")
title1

#prb1:error in open.connection(x,"rb")  先下載下來
read_html("http://www.mobile01.com/topiclist.php?f=61") %>% 
  html_nodes("td.subject") %>% 
  html_text() %>% 
  iconv("UTF-8")

download.file("http://www.mobile01.com/topiclist.php?f=61","try.html")

#crawl 多頁
for(i in 1:20){
  loc<-paste("http://www.mobile01.com/topiclist.php?f=61&p=",i,sep="")
  des<-paste("try",i,".html",sep="")
  download.file(loc,des)
  Sys.sleep(runif(1,2,5))
}

st<-NULL

for(i in 1:10){
  pathfile<-paste("http://www.mobile01.com/topiclist.php?f=61&p=",i,sep="")
  mtitle<-read_html(pathfile)%>%
    html_nodes(".topic_gen")%>%
    html_text()%>% iconv("UTF-8")
  st-c(st,mtitle)
  Sys.sleep(runif(1,2,5))
}

st<-data.frame(st)
