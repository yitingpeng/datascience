install.packages("httr")
install.packages("rvest")
install.packages("xml2")
install.packages("tidyverse")
library(httr)
library(xml2)
library(rvest)
library(tidyverse)

##r-crawler in pchome
url <-"https://ecshweb.pchome.com.tw/search/v3.3/all/results?q=note9&page=1&sort=rnk/dc"
res <- GET(url)
res
res_json <- content(res)
res_json
do.call(rbind,res_json$prods)
View(data.frame(do.call(rbind,res_json$prods)))

#r-crawler in news web

#library packages(rvest)
#read address
read_html("https://news.pts.org.tw/subcategory/50")
doc <-read_html("https://news.pts.org.tw/subcategory/50")#將網頁存在變數中
doc %>% html_node()#取得路徑下的所有節點
html_nodes(doc, ".txt-title2 span")
doc
html_node(".text-title2 span")

#TEST
installed.packages("rvest")
library(rvest)
page.source<-read_html("https://en.wikipedia.org/wiki/R_(programming_language)")
##使用html_nodes函數，配合css選擇器將指定的資料取出
version.block<- html_nodes(page.source, "th:nth-child(2) , .wikitable th+ td , .wikitable th:nth-child(1)")
head(version.block)
##可使用htm_text將html程式碼中的文字資料取出來
content<- html_text(version.block)
head(content)
content
##html_nodes 支援xpath的指定方式
###找出所有連結的網址(意味不明)
version.block2<-html_node(page.source, xpath='//table[@class="wikitable"]//tr//th')
#html_name可以列出所有html元素標籤
html_name(version.block)
#html_attrs可以列出每個html元素的所有屬性
el.attrs<-html_attrs(version.block)