#
# This is the server logic of a Shiny web application. You can run the 
# application by clicking 'Run App' above.
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

# Define server logic required to draw a histogram
shinyServer(function(input, output) {
   
  output$distPlot <- renderPlot({
    
    df <- read_excel("~/Recieve Doc_STF01.xlsx", 
                     sheet = "Sheet1")
    df$lag <- shift(df$Rotation, 1L, type = "lead")
    #Create the sideout column
    df$sideout <- as.numeric(ifelse(
      df$lag == df$Rotation,
      "0",
      "1"))
   
    summary <- group_by(df, Opponent, Game, `Hitter Number`)
    summary1 <- group_by(df, Opponent, Game)
    
    stats <- summarize(summary, totalKills = sum(Outcome), attempts = n(), 
                       hitting = round(sum(Outcome)/ n(), digits = 3))
    sideout <- summarize(summary1, sideout = round(sum(sideout)/n()))
    
    
    sideoutsummary <- summary1 %>%
      filter(sideout >= 0) %>%
      summarize(sideout = round(sum(sideout)/n(), digits = 3))
    
    ggplot(stats, aes(Game, hitting, fill = `Hitter Number`)) +
      geom_bar(stat="identity", position = "dodge") + 
      scale_fill_brewer(palette = "Set1") +
      ggtitle("Sideout Hitting Percentage")

    
  })
  output$distPlot1 <- renderPlot({
    
    ggplot(stats, aes(Game, attempts, fill = `Hitter Number`)) +
      geom_bar(stat="identity", position = "dodge") + 
      scale_fill_brewer(palette = "Set1") +
      ggtitle("Sideout Hitting Attempts")
  
})
})
