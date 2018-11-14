library(bitops)
library(httr)
library(RCurl)
library(XML)
library(NLP)
library(tm)
library(tmcn)
library(jiebaRD)
library(jiebaR)

#using rcrawler to grab urls
web <- "https://www.ptt.cc/bbs/LeeJongSuk/index"
data<-list()
for(i in 1:58){
  url  <- paste0( web, i, ".html" )
  html <- htmlParse( GET(url) )
  url.list <- xpathSApply( html, "//div[@class='title']/a[@href]", xmlAttrs )
  data <- rbind( data, as.matrix(paste('https://www.ptt.cc', url.list, sep='')) )
}
data <- unlist(data)
head(data)

#grab content
library(dplyr)
getdoc <- function(url)
{
  html <- htmlParse( getURL(url) )
  doc  <- xpathSApply( html, "//div[@id='main-content']", xmlValue )
  write(doc, file='name.txt', append = T)
  
}

sapply(data, getdoc)

#data cleaning
d.corpus <- Corpus(DirSource(name,encoding = "UTF-8"))
d.corpus <- tm_map(d.corpus, removePunctuation)
d.corpus <- tm_map(d.corpus, removeNumbers)
d.corpus <- tm_map(d.corpus, function(word) {
  gsub("[A-Za-z0-9]", "", word)
})

#斷詞
mixseg = worker()
jieba_tokenizer = function(d)
{
  unlist( segment(d[[1]], mixseg) )
}
seg = lapply(d.corpus, jieba_tokenizer)

count_token = function(d)
{
  as.data.frame(table(d))
}
tokens = lapply(seg, count_token)

n = length(seg)
TDM = tokens[[1]]
colNames <- names(seg)
colNames <- gsub(".txt", "", colNames)
for( id in c(2:n) )
{
  TDM = merge(TDM, tokens[[id]], by="d", all = TRUE)
  names(TDM) = c('d', colNames[1:id])
}
TDM[is.na(TDM)] <- 0
library(knitr)
kable(head(TDM))
kable(tail(TDM))

#轉成tf-idf
tf <- apply(as.matrix(TDM[,2:(n+1)]), 2, sum)

library(Matrix)
idfCal <- function(word_doc)
{ 
  log2( n / nnzero(word_doc) ) 
}
idf <- apply(as.matrix(TDM[,2:(n+1)]), 1, idfCal)

doc.tfidf <- TDM
# for(x in 1:nrow(TDM))
# {
#   for(y in 2:ncol(TDM))
#   {
#     doc.tfidf[x,y] <- (doc.tfidf[x,y] / tf[y]) * idf[x]
#   }
# }

tempY = matrix(rep(c(as.matrix(tf)), each = length(idf)), nrow = length(idf))
tempX = matrix(rep(c(as.matrix(idf)), each = length(tf)), ncol = length(tf), byrow = TRUE)
doc.tfidf[,2:(n+1)] <- (doc.tfidf[,2:(n+1)] / tempY) * tempX

stopLine = rowSums(doc.tfidf[,2:(n+1)])
delID = which(stopLine == 0)

kable(head(doc.tfidf[delID,1]))
kable(tail(doc.tfidf[delID,1]))
TDM = TDM[-delID,]
doc.tfidf = doc.tfidf[-delID,]

#重要關鍵字
TopWords = data.frame()
for( id in c(1:n) )
{
  dayMax = order(doc.tfidf[,id+1], decreasing = TRUE)
  showResult = t(as.data.frame(doc.tfidf[dayMax[1:5],1]))
  TopWords = rbind(TopWords, showResult)
}
rownames(TopWords) = colnames(doc.tfidf)[2:(n+1)]
TopWords = droplevels(TopWords)
kable(TopWords)

#視覺化
TDM$d = as.character(TDM$d)
AllTop = as.data.frame( table(as.matrix(TopWords)) )
AllTop = AllTop[order(AllTop$Freq, decreasing = TRUE),]

kable(head(AllTop))
TopNo = 5
tempGraph = data.frame()
for( t in c(1:TopNo) )
{
  word = matrix( rep(c(as.matrix(AllTop$Var1[t])), each = n), nrow = n )
  temp = cbind( colnames(doc.tfidf)[2:(n+1)], t(TDM[which(TDM$d == AllTop$Var1[t]), 2:(n+1)]), word )
  colnames(temp) = c("hour", "freq", "words")
  tempGraph = rbind(tempGraph, temp)
  names(tempGraph) = c("hour", "freq", "words")
}

library(ggplot2)
library(varhandle)
tempGraph$freq = unfactor(tempGraph$freq)
ggplot(tempGraph, aes(hour, freq)) + 
  geom_point(aes(color = words, shape = words), size = 5) +
  geom_line(aes(group = words, linetype = words))

kable(tail(AllTop))
#發文時間與發文量
ilenames = as.array(paste0("./DATA/",colnames(doc.tfidf)[2:(n+1)],".txt"))
sizeResult = apply(filenames, 1, file.size) / 1024
showSize = data.frame(colnames(doc.tfidf)[2:(n+1)], sizeResult)
names(showSize) = c("hour", "size_KB")

ggplot(showSize, aes(x = hour, y = size_KB)) + geom_bar(stat="identity")
