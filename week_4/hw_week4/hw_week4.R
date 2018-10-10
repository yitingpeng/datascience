#openapi/r crawler
install.packages("rJava")
install.packages("Rwordseg", repos="http://R-Forge.R-project.org")
install.packages("tm")
install.packages("tmcn", repos="http://R-Forge.R-project.org", type="source")
install.packages("wordcloud")
install.packages("XML")
install.packages("RCurl")
install.packages("bitops")
install.packages("jsonlite")
#library packages
library(rvest)
library(XML)
library(xml2)
library(bitops)
library(RCurl)
library(httr)


#get HTML/ only one page
jong.html <-paste("https://www.ptt.cc/bbs/LeeJongSuk/index58.html")
jong.title <- html_nodes(read_html(jong.html),".title a" )
jong.title
jong.hrefs <- html_attr(jong.title, 'href')
jong.titletext<-html_text(jong.title)
jong.titletext
for(i in jong.titletext){
  print(i)}

# form a empty vector
jong.article.data <- c()

for(i in 1:length(jong.hrefs)){
  # paste0() ==> without any white space
  article.url <- paste0('https://www.ptt.cc', jong.hrefs[i])
  article <- html_nodes(read_html(article.url), "#main-content")
  article.content <- html_text(article)
  #  to convert a character vector between encodings: the ?€˜i?€? stands for ?€˜internationalization?€?.
  article.utf8 <- iconv(article.content, 'utf8')
  # vector start counting from 1!!
  jong.article.data <- c(jong.article.data, article.utf8)
  # Suspend execution of R expressions for a specified time interval.
  # Sys.sleep(sample(3:5, 1))
}
jong.article.data[1]
View(jong.article.data)
str(article.utf8)
str(jong.article.data)

#Â_µü
install.packages("jiebaR")
install.packages("jiebaRD")
library("jiebaRD")
library("jiebaR")

Sys.setlocale(category = "LC_ALL", locale = "cht")
cc = worker()
cc[jong.article.data]
jong<-table(cc[jong.article.data])
jong
jong<-data.frame(jong)
jong<-jong[order(jong$Freq,decreasing = T),]
head(jong)
#get html/all pages
install.packages("wordcloud2")
library(wordcloud2)
wordcloud2(jong)
