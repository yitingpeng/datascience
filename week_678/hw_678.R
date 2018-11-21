library(rvest)
library(XML)
library(xml2)
library(bitops)
library(RCurl)
library(httr)

#1.R_CRAWLER
#2.WORDS_CLEANING
#3.TFIDF
#4.GGPLOT&WORD_CLOUD
#5.SHINY

#get HTML
##download website
for(i in 1:106){
  loc<-paste("https://www.koreastardaily.com/tc/drama/",i,sep="")
  des<-paste("drama",i,".html",sep="")
  download.file(loc,des)
  Sys.sleep(runif(1,2,5))
}
##get tiltle, date 
url<-c()
titledate<-c()
titletext<-c()
for(page in 1:106){
  web.html <-paste("drama",page,".html",sep="")
  web.nodes <- html_nodes(read_html(web.html),"h2 a" )
  title<-html_text(web.nodes)
  titletext<-c(titletext, title)
  href<-html_attr(web.nodes, 'href')
  url<-c(url,paste("https://www.koreastardaily.com",href, sep=""))
  web.date<- html_nodes(read_html(web.html),"h3")
  date<-html_text(web.date)
  date<-substring(date,1,23)
  titledate<-c(titledate,date)
  Sys.sleep(runif(1,2,5))
}
article<-data.frame(url,titledate,titletext)

# drag the aticle content into a txt
articletext <- c()
for(i in 1:length(url)){
  articleurl <- url
  article <- html_nodes(read_html(articleurl[i]), "p")
  article.content <- html_text(article)
  article.content
  article.utf8 <- iconv(article.content, 'utf8')
  # vector start counting from 1!!
  articletext <- c(articletext, article.utf8)
  # Suspend execution of R expressions for a specified time interval.
  Sys.sleep(sample(3:5, 1))
}
articletext<-as.data.frame(articletext)
articletext2<-as.String(articletext)
articletext1<-unlist(articletext)

write.table(articletext,file="content.txt",sep="")
write.table(articletext1,file="content1.txt",sep="")
write(articletext2,file="content2.txt",sep="")

#xpathsapply


#text mining
library("jiebaRD")
library("jiebaR")
library(tm)
library("SnowballC")
library("wordcloud")
library("RColorBrewer")
library(wordcloud2)

#wordcloud formation
news<-readLines(file.path("content.txt"))
cc<-worker()
word<-readLines("words.txt",encoding = 'UTF-8')
dramalist<-readLines("drama.txt",encoding = 'UTF-8')
actorlist<-readLines("actor.txt",encoding='UTF-8')
new_user_word(cc,word)
cc[news]
dfnews<-table(cc[news])
dfnews<-data.frame(dfnews)
dfnews<-dfnews[order(dfnews$Freq,decreasing = T),]
drama<-dfnews[dfnews$Var1 %in% dramalist,]
actor<-dfnews[dfnews$Var1 %in% actorlist,]
head(drama)

wordcloud2(drama,size=1,gridSize = 0, 
           fontFamily = '微軟正黑體', fontWeight = 'bold',
           color = 'random-light', backgroundColor = "white",
           minRotation = -pi/4, maxRotation = pi/4, shuffle = TRUE,
           rotateRatio = 0.4, shape = 'circle')

wordcloud2(actor, size=1, gridSize = 0,
           fontFamily = '微軟正黑體', fontWeight = 'bold',
           color = 'random-light', backgroundColor = "white",
           minRotation = -pi/4, maxRotation = pi/4, shuffle = TRUE,
           rotateRatio = 0.4, shape = 'diamond', ellipticity = 0.65,
           widgetsize = NULL, figPath = NULL, hoverFunction = NULL)

#xpathsapply


##load the text and let it as the corpus
news<-readLines(file.path("content.txt"))
news<-as.vector(news)
head(news)
d.corpus<- VCorpus(VectorSource(news))
d.corpus
d.corpus<-tm_map(d.corpus,removePunctuation)
d.corpus<-tm_map(d.corpus,stripWhitespace)
#d.corpus<-tm_map(d.corpus,removeNumbers)
stop<-readLines("stopword.txt")
head(stop)
d.corpus<-tm_map(d.corpus,removeWords,stop)
d.corpus<-tm_map(d.corpus,removeWords,stopwordsCN())

#build a term-document matrix
dtm<- TermDocumentMatrix(d.corpus)

#plot
library(ggplot2)
theme_set(theme_bw())
#2018drama
drama<-drama[order(dfnews$Freq,decreasing = T),]
drama10<-drama[1:10,]
drama10$Var1<-factor(drama10$Var1,levels = drama10$Var1)
head(drama10)
g <-ggplot(drama10,aes(drama10$Var1,drama10$Freq))
g + geom_bar(stat="identity", width = 0.5, fill="tomato2") + 
  labs(title="2018 韓劇排行榜", 
       x="Drama Name",
       y="Freq",
       subtitle="2018 Korean Drama Rank", 
       caption="Source: Koreastardaily") +
  theme(axis.text.x = element_text(angle=65, vjust=0.6))
##There's some prob in the first rank.
#excluding the first one
drama101<-drama[2:11,]
drama101$Var1<-factor(drama101$Var1,levels = drama101$Var1)
head(drama101)
g <-ggplot(drama101,aes(drama101$Var1,drama101$Freq))
g + geom_bar(stat="identity", width = 0.5, fill="tomato2") + 
  labs(title="2018 韓劇排行榜",
       x="Drama Name",
       y="Freq",
       subtitle="2018 Korean Drama Rank", 
       caption="Source: Koreastardaily") +
  theme(axis.text.x = element_text(angle=65, vjust=0.6))

#2018actor
actor10<-actor[1:10,]
actor10$Var1<-factor(actor10$Var1,levels = actor10$Var1)

f <-ggplot(actor10,aes(actor10$Var1,actor10$Freq))
f + geom_bar(stat="identity", width = 0.5, fill="tomato2") + 
  labs(title="2018 十大演員排行榜", 
       x="Actor Name",
       y="Freq",
       subtitle="2018 Korean Actors Rank", 
       caption="Source: Koreastardaily") +
  theme(axis.text.x = element_text(angle=65, vjust=0.6))
