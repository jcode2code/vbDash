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


ui = navbarPage("Saint Francis",
                tabPanel("Sideout",
                         plotOutput("distPlot"),
                         plotOutput("distPlot1")
                         ),
                tabPanel("Rotation Sideout", plotOutput("distPlot2"))
)

