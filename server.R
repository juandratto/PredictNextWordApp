#
# This is the server logic of a Shiny web application. You can run the
# application by clicking 'Run App' above.
#
# Find out more about building applications with Shiny here:
#
#    http://shiny.rstudio.com/
#

library(shiny)
library(tm)
library(tokenizers)

library(tidytext)
library(tidyr)
library(dplyr)

#load the N-gram datasets
corpus4gram <- readRDS(file = "4gram.rds")
corpus3gram <- readRDS(file = "3gram.rds")
corpus2gram <- readRDS(file = "2gram.rds")
corpus1gram <- readRDS(file = "1gram.rds")

tidyInput <- function(x) {
    
    x <- iconv(x, "UTF-8", "ASCII", sub = "")
    x <- tolower(x)
    x <- removeNumbers(x)
    x <- removePunctuation(x)
    x <- stripWhitespace(x)
    x <- unlist(strsplit(x, " "))
    return(x)
}

predictNextWord <- function (textInput) {
    #only for 4 grams
    if (length(textInput) >= 3) {
        vinput <- textInput[(length(textInput)-2):length(textInput)]
    } else {vinput <- textInput}
    
    if (length(vinput) == 3) {
        rs4gram <-  corpus4gram %>% 
            filter(word1 == vinput[1]) %>% 
            filter(word2 == vinput[2]) %>%
            filter(word3 == vinput[3])
        if ( nrow(rs4gram) == 0) {
            rs3gram <-  corpus3gram %>% 
                filter(word1 == vinput[2]) %>% 
                filter(word2 == vinput[3])
            
            if ( nrow(rs3gram) == 0) {
                rs2gram <- corpus2gram %>% 
                    filter(word1 == vinput[1])
                if ( nrow(rs2gram) == 0) {
                    r <- as.character(corpus1gram[1,1])
                } 
                else {r <- as.character(rs2gram[1,2])}
            }
            else { r <- as.character(rs3gram[1,3]) }
        }
        else { r <- as.character(rs4gram[1,4]) }
    }
    else {
        if( length(vinput) == 2) {
            rs3gram <-  corpus3gram %>% 
                filter(word1 == vinput[1]) %>% 
                filter(word2 == vinput[2])
            
            if ( nrow(rs3gram) == 0) {
                rs2gram <- corpus2gram %>% 
                    filter(word1 == vinput[1])
                if ( nrow(rs2gram) == 0) {
                    r <- as.character(corpus1gram[1,1])
                }
                else {r <- as.character(rs2gram[1,2])}
            }
            else { r <- as.character(rs3gram[1,3]) }
        } else {
            rs2gram <- corpus2gram %>% 
                filter(word1 == vinput[1])
            if ( nrow(rs2gram) == 0) {
                r <- as.character(corpus1gram[1,1])
            }
            else {r <- as.character(rs2gram[1,2])}
        }
    }
    
    return(r)
}

# Define server logic required to draw a histogram
shinyServer(function(input, output) {

    output$NextWord <- renderText({ 
        inputText <- tidyInput(input$InputPhrase)
        resultWord <- predictNextWord(inputText)
        resultWord
        })

})
