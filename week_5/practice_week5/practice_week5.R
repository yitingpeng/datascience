library(NLP)
library(tm)
library(stats)
library(proxy)
library(dplyr)
library(readtext)
library(jiebaRD)
library(jiebaR)
library(slam)
library(Matrix)
library(tidytext)

rawData = readtext("*.txt")
docs = Corpus(VectorSource(rawData$text))
# data clean
toSpace <- content_transformer(function(x, pattern) {
  return (gsub(pattern, " ", x))
})
docs <- tm_map(docs, removePunctuation)
docs <- tm_map(docs, removeNumbers)
docs <- tm_map(docs, stripWhitespace)
docs <- tm_map(docs, toSpace, "[a-zA-Z]")

# words cut
keywords = read.csv("keywords.csv")
mixseg = worker()
keys = as.matrix(keywords)
new_user_word(mixseg, keys)

jieba_tokenizer = function(d){
  unlist(segment(d[[1]], mixseg))
}
seg = lapply(docs, jieba_tokenizer)
freqFrame = as.data.frame(table(unlist(seg)))

d.corpus <- Corpus(VectorSource(seg))
tdm <- TermDocumentMatrix(d.corpus)
print( tf <- as.matrix(tdm) )
DF <- tidy(tf)

# tf-idf computation
N = tdm$ncol
tf <- apply(tdm, 2, sum)
idfCal <- function(word_doc)
{ 
  log2( N / nnzero(word_doc) ) 
}
idf <- apply(tdm, 1, idfCal)

doc.tfidf <- as.matrix(tdm)
for(x in 1:nrow(tdm))
{
  for(y in 1:ncol(tdm))
  {
    doc.tfidf[x,y] <- (doc.tfidf[x,y] / tf[y]) * idf[x]
  }
}

findZeroId = as.matrix(apply(doc.tfidf, 1, sum))
tfidfnn = doc.tfidf[-which(findZeroId == 0),]

write.csv(tfidfnn, "show.csv")

#r crawler
#library packages
library(rvest)
library(XML)
library(xml2)
library(bitops)
library(RCurl)
library(httr)
library("jiebaRD")
library("jiebaR")
library(tm)
library(tmcn)
library(wordcloud2)

library(XML)
library(RCurl)

#抓取笨版文章
data <- list()

for( i in 1:93){
  tmp <- paste(i)
  url <- paste('https://www.koreastardaily.com/tc/drama/', tmp, sep='')
  html <- htmlParse(getURL(url))
  url.list <- xpathSApply(html, "//div[@class='yui-u list-desc']/a[@href]", xmlAttrs)
  data <- rbind(data, paste('https://www.koreastardaily.com', url.list, sep=''))
}

for( i in 1:93){
  url.list <- xpathSApply(html, "//div[@class='yui-u list-desc']/a[@href]", xmlAttrs)
}

data <- unlist(data)

#利用文章的url連結去抓所有文章的html網頁，並用xpathSApply去解析出文章內如去解析出文章內容並儲存
getdoc <- function(line){
  start <- regexpr('www', line)[1]
  end <- regexpr('html', line)[1]
  
  if(start != -1 & end != -1){
    url <- substr(line, start, end+3)
    html <- htmlParse(getURL(url), encoding='UTF-8')
    doc <- xpathSApply(html, "//div[@id='main-content']", xmlValue)
    name <- strsplit(url, '/')[[1]][4]
    write(doc, gsub('html', 'txt', name))
  }      
}

#開始下載文章
sapply(data,getdoc)

#開始文字處理
library(tm)
library(tmcn)
library(Rwordseg)

#匯入剛才抓完的笨版文章，doc 是儲存下載ptt文章的資料夾, 這些文章變成我們分析的語料庫。
d.corpus <- Corpus(DirSource("doc"), list(language = NA))
#數據清理
d.corpus <- tm_map(d.corpus, removePunctuation)
d.corpus <- tm_map(d.corpus, removeNumbers)
#清除大小寫英文與數字
d.corpus <- tm_map(d.corpus, function(word) {
  gsub("[A-Za-z0-9]", "", word)
})
#

