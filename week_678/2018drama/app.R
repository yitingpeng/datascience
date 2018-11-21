#
# This is a Shiny web application. You can run the application by clicking
# the 'Run App' button above.
#
# Find out more about building applications with Shiny here:
#
#    http://shiny.rstudio.com/
#
install.packages("jiebaR")
install.packages("wordcloud")
install.packages("showtext")
install.packages("ggplot2")
library(jiebaR)
library(wordcloud)
library(showtext)
library(ggplot2)

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

# Define UI for application that draws a histogram
ui <- navbarPage(
  
    theme = shinythemes::shinytheme("flatly"),
    
   "Korean Drama Analysis",
   # Application title
   tabPanel(
     "2018 Rank of Korean Dramas",
   sidebarLayout(
      sidebarPanel(
         sliderInput("dr", 
                     "Number of dramas:",
                     min = 1,
                     max = 50,
                     value = 10)
      ),
      
      # Show a plot of the generated distribution
      mainPanel(
         plotOutput("distPlot")
      )
   )
   ),
  tabPanel(
    "2018 Rank of Korean Actors",
    sidebarLayout(
      sidebarPanel(
        sliderInput("act",
                    "Number of actors or actresses:",
                    min = 1,
                    max = 80,
                    value = 10)
      ),
      
      # Show a plot of the generated distribution
      mainPanel(
        plotOutput("distPlot2")
      )
    )  
    ),
  tabPanel(
    "Word Cloud of 2018 Dramas",
    
    sidebarLayout(
      sidebarPanel(
        sliderInput("dr1",
                    "Number of dramas:",
                    min = 1,
                    max = 50,
                    value = 10)
      ),
      
      # Show a plot of the generated distribution
      mainPanel(
        plotOutput("wordcloud1")
      )
    )
  ),
  tabPanel(
    "Word Cloud of 2018 Actors",
    
    sidebarLayout(
      sidebarPanel(
        sliderInput("act1",
                    "Number of actors or actresses:",
                    min = 1,
                    max = 80,
                    value = 10)
      ),
      
      # Show a plot of the generated distribution
      mainPanel(
        plotOutput("wordcloud2")
      )
    )
  )
)
  


# Define server logic required to draw a histogram
server <- function(input, output) {
   
   output$distPlot <- renderPlot({
      
      num<-input$dr
      num<-as.numeric(num)+1
      x <- drama[2:num,]
      x$Var1<-factor(x$Var1,levels = x$Var1)
      g <-ggplot(x,aes(x$Var1,x$Freq))
      g + geom_bar(stat="identity", width = 0.5, fill="tomato2") + 
        labs(title="2018 韓劇排行榜", 
             x="Drama Name",
             y="Freq",
             subtitle="2018 Korean Drama Rank", 
             caption="Source: Koreastardaily") +
        theme(axis.text.x = element_text(angle=65, vjust=0.6))
   })
   output$distPlot2 <- renderPlot({
     
     num<-input$act
     num<-as.numeric(num)
     x <- actor[1:num,]
     x$Var1<-factor(x$Var1,levels = x$Var1)
     g <-ggplot(x,aes(x$Var1,x$Freq))
     g + geom_bar(stat="identity", width = 0.5, fill="tomato2") + 
       labs(title="2018 演員排行榜", 
            x="Actor Name",
            y="Freq",
            subtitle="2018 Korean Actor and Actress Rank", 
            caption="Source: Koreastardaily") +
       theme(axis.text.x = element_text(angle=65, vjust=0.6))
   })
   output$wordcloud1 <- renderPlot({
     showtext.begin()
     num<-input$dr1
     num<-as.numeric(num)+1
     x <- drama[2:num,]
     print(wordcloud(x$Var1,x$Freq,
                     random.order=FALSE, random.color=TRUE, 
                     rot.per=.1, colors=brewer.pal(8,"Dark2"),
                     ordered.colors=FALSE,use.r.layout=FALSE,
                     fixed.asp=TRUE))
     showtext.end()
   })
   output$wordcloud2 <- renderPlot({
     showtext.begin()
     num<-input$act1
     num<-as.numeric(num)
     x <- actor[1:num,]
     print(wordcloud(x$Var1,x$Freq,
                     random.order=FALSE, random.color=TRUE, 
                     rot.per=.1, colors=brewer.pal(8,"Dark2"),
                     ordered.colors=FALSE,use.r.layout=FALSE,
                     fixed.asp=TRUE))
     showtext.end()
   })
   }

# Run the application 
shinyApp(ui = ui, server = server)

