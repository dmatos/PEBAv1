library(shiny)
library(affy)
library(datasets)
library(ggplot2)
library(heatmaply)

library(plotly)


ui <- fluidPage(
  fluidPage(theme ="bootstrap.css",
            
            
            
            titlePanel(tags$img(src="logo.png")
            ),
            
            hr(),
            
                                sidebarLayout(
                                  sidebarPanel(
                                  fileInput('file1', 'Choose Expression File',
                                            accept=c('text/csv', 
                                                     'text/comma-separated-values,text/plain', 
                                                     '.csv')),
                                  tags$hr()
                                  
                                  
                                  
   
                                ),
                                
                                
                                
                                mainPanel(
                                  
                                  
                                  h1("Heatmap: "),
                                  
                                  fluidRow(plotlyOutput("heatmap"))
                                  
                                )
                       )
                       
                       
                                   
                       
                       )
  )
  
