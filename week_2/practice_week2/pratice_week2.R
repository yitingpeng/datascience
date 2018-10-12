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
doc <-read_html("https://news.pts.org.tw/subcategory/50")#?N?����s?b?ܼƤ?
doc %>% html_node()#???o???|?U???Ҧ??`?I
html_nodes(doc, ".txt-title2 span")
doc
html_node(".text-title2 span")

#TEST
installed.packages("rvest")
library(rvest)
page.source<-read_html("https://en.wikipedia.org/wiki/R_(programming_language)")

version.block<- html_nodes(page.source, "th:nth-child(2) , .wikitable th+ td , .wikitable th:nth-child(1)")
head(version.block)

content<- html_text(version.block)
head(content)
content

version.block2<-html_node(page.source, xpath='//table[@class="wikitable"]//tr//th')

html_name(version.block)

el.attrs<-html_attrs(version.block)