#
# This is the user-interface definition of a Shiny web application. You can
# run the application by clicking 'Run App' above.
#
# Find out more about building applications with Shiny here:
#
#    http://shiny.rstudio.com/
#

library(shiny)

# Define UI for application that draws a histogram
shinyUI(fluidPage(

    # Application title
    img(src='Johns-Hopkins-Coursera-550x330.jpg', align = "left"),
    br(),
    titlePanel("Data Science Capstone: Final Project"),
    helpText("This application takes as input a phrase (multiple words) and outputs a prediction of the next word."),
    br(),
    HTML("<strong>Author: Juan Ratto</strong>"),
    br(),
    HTML("<strong>Date: 25/11/2020</strong>"),
    br(),
    # Sidebar with a slider input for number of bins
    sidebarLayout(
        sidebarPanel(
            
            textInput("InputPhrase", "Input Phrase or Word", "")
        ),

        # Show a plot of the generated distribution
        mainPanel(
            h2("Next Word:"),
            verbatimTextOutput("NextWord")
        )
    )
))
