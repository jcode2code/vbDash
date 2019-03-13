#
# This is the user-interface definition of a Shiny web application. You can
# run the application by clicking 'Run App' above.
#
# Find out more about building applications with Shiny here:
# 
#    http://shiny.rstudio.com/
#

library(shiny)
library(readxl)
library(data.table)
library(dplyr)
library(ggplot2)

# Define UI for application that draws a histogram
shinyUI(fluidPage(
  
  # Application title
  titlePanel("Saint Francis Sideout Stats"),
  
  # Sidebar with a slider input for number of bins 
  sidebarLayout(
    sidebarPanel(
      helpText("Display the stats for Saint Francis on Sideout.")
    ),
    
    # Show a plot of the generated distribution
    mainPanel(
       plotOutput("distPlot")
       ,plotOutput("distPlot1")
    )
  )
))
