install.packages("httr")
install.packages("rvest")
install.packages("xml2")

library(httr)
library(xml2)
library(rvest)


url <-"https:/ecshweb.pchome.com.tw/search/v3.3/all/results?q=Microsoft%20surface&page=1&sort=rnk/dc"
res <- GET(url)
res
res_json <- content(res)
res_json
do.call(rbind,res_json$prods)
View(data.frame(do.call(rbind,res_json$prods)))

url <-"https:/ecshweb.pchome.com.tw/search/v3.3/all/results?q=Microsoft%20surface&page=2&sort=rnk/dc"
res <- GET(url)
res
res_json <- content(res)
res_json
do.call(rbind,res_json$prods)
df<-data.frame(do.call(rbind,res_json$prods))
df
View(data.frame(do.call(rbind,res_json$prods)))