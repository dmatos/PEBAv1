library(shiny)
library(affy)
library(datasets)
library(ggplot2)
library(data.table)
library(heatmaply)
library(iheatmapr)

library(plotly)


server <- function(input, output) {
  options(shiny.maxRequestSize=10000*1024^2)
  
  
  
  getRead <- reactive({
    
    inFile <- input$file1
    
    if (is.null(input$file1))
      return(NULL)
    
    df <- read.delim(inFile$datapath, header=TRUE, row.names = 1)
    
    return(df)
    
  })
  
  
  output$heatmap <- renderPlotly({
    
    df <- getRead()
    
    #rownames(df) <- df$description
    
    df$description <- NULL
    
    df$sum <- NULL
    
    heatmaply(df,Rowv = F)
  })
  
  getOrder <- reactive({
    
    df <- getRead()
    
    
    df_order <- apply(df[,-1],1,sum)

    df$sum <- df_order
    
    df <- df[order(df$sum),]
    
    
    
    return(df)
    
  })
  
  

}