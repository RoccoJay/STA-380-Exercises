# AUTHOR ATTRIBUTION

## Introduction

Data was received in a format where a train folder contained folders for
50 authors and each author folder contained 50 documents for each
author. It also contained a test folder with a similar structure with
the same 50 authors and 50 other documents written by each author.

## Method

First we read the author folder names and looped through the contents to
get the document information and content. This was done for both train
and test sets. With this data we made a corpus document, which is a text
mining document. We then mapped five content transformers to make
everything lowercase and remove numbers, punctuation, excess whitespace
and stop words. Next, we created a document term matrix that is a data
frame like structure that comprises rows for each document and columns
for all terms that appear across documents. Once this was created,
sparse terms were removed on the training and test document term
matrices using 91% and 96% thresholds respectively (these thresholds are
somewhat arbitrary and different values could be used). Finally, we
removed terms that occur in the test data but not in the train data.

## Models

First we ran Naive-Bayes to predict authors. The data was changed to
matrices to run the Naive-Bayes library and had predictive accuracy of
approximately 0.3276%. This uses the naivebayes library in R.

    ## randomForest 4.6-14

    ## Type rfNews() to see new features/changes/bug fixes.

    ## 
    ## Attaching package: 'randomForest'

    ## The following object is masked from 'package:ggplot2':
    ## 
    ##     margin

    ## The following object is masked from 'package:dplyr':
    ## 
    ##     combine

Secondly we ran a Random Forest model with 1,250 trees and an m of 20.
To run this in R, we had to change some terms in the train and test data
sets so they did not conflict with special terms in R. The Random Forest
model had predictive accuracy of approximately 0.5652%. This uses the
randomForest library in R.
