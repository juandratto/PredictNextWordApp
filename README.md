# PredictNextWordApp
title: "Coursera's Data Science Capstone Final Project: Predicting the Next Word"
author: "Juan Ratto"
date: "25/11/2020"
## Overview

This presentation is intended to explain the final project of the Coursera's Data Sciece Specialization.

The goal of this project is to create a product to highlight the prediction algorithm developed along the course, this product is based in a Natural Language Processing model for predicting the next word of a given phrase.

## NLP model Input Data 

- We used a corpus called [**HC Corpora**](https://d396qusza40orc.cloudfront.net/dsscapstone/dataset/Coursera-SwiftKey.zip) for training our NLP model.
- This dataset has information about News, Blog's entries and Twitter Data.
- The first step was getting the dataset, sampling about 10% of the data and clean the data before apply the NLP model.

## N-Gram Model

- We choose an N-Gram model for the prediction algorithm.
- The model is a type of probabilistic language model for predicting the next item in the form of sequeneces of words.
- We processed the clean data into sequences of 4,3,2 and 1 sequences of word, applying a probabilty to every sequence based in the number of appareance in the corpus.
- The output of this process was used for develop the final product (shinyapp application).
- This Report <https://rpubs.com/jdratto/MilestoneReport01> shows the cleansing and transformations process.

## FInal Product: Predict Next Word Application

- The Perdict Next Word application is a simple development in ShinyApp: <https://juandratto.shinyapps.io/PredictNextWord_CapstoneProject/>.
- This App require a input word or phrase and predict the next word based on the N-Gram model and the backoff interpolation.
- The details of this application on Github: <https://github.com/juandratto/PredictNextWordApp>.
