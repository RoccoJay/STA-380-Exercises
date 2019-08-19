rm(list =ls())

library(tm) 
library(magrittr)
library(slam)
library(proxy)
library(e1071)
library(dplyr)
library(caret)
library(naivebayes)

setwd('C:/Users/pivo/Desktop/UT MSBA/Summer 2019/Predictive Models/STA380/data/ReutersC50')

readerPlain = function(fname){
  readPlain(elem=list(content=readLines(fname)), 
            id=fname, language='en') }

authors_train = Sys.glob('C50train/*')
file_list_train = NULL
labels_train = NULL

for(author in authors_train) {
  files_to_add = Sys.glob(paste0(author, '/*.txt'))
  file_list_train = append(file_list_train, files_to_add)
  author_name = substring(author, first=9)
  labels_train = append(labels_train, rep(author_name, length(files_to_add)))
}

train = lapply(file_list_train, readerPlain) 
mynames = file_list_train %>%
  { strsplit(., '/', fixed=TRUE) } %>%
  { lapply(., tail, n=2) } %>%
  { lapply(., paste0, collapse = '') } %>%
  unlist
# Rename the articles
mynames
names(train) = mynames

#labels_train

authors_test = Sys.glob('C50test/*')
file_list_test = NULL
labels_test = NULL

for(author in authors_test) {
  files_to_add_test = Sys.glob(paste0(author, '/*.txt'))
  file_list_test = append(file_list_test, files_to_add_test)
  author_name_test = substring(author, first=8)
  labels_test = append(labels_test, rep(author_name_test, length(files_to_add_test)))
}
test = lapply(file_list_test, readerPlain) 
mynames = file_list_test %>%
  { strsplit(., '/', fixed=TRUE) } %>%
  { lapply(., tail, n=2) } %>%
  { lapply(., paste0, collapse = '') } %>%
  unlist

## once you have documents in a vector, you 
## create a text mining 'corpus' with: 
documents_raw = Corpus(VectorSource(train))
my_documents = documents_raw
my_documents = tm_map(my_documents, content_transformer(tolower)) # make everything lowercase
my_documents = tm_map(my_documents, content_transformer(removeNumbers)) # remove numbers
my_documents = tm_map(my_documents, content_transformer(removePunctuation)) # remove punctuation
my_documents = tm_map(my_documents, content_transformer(stripWhitespace)) ## remove excess white-space
my_documents = tm_map(my_documents, content_transformer(removeWords), stopwords("en"))

## TEST ###
file_list_test = Sys.glob('data/ReutersC50/C50test/*')
names(test) = mynames
documents_raw_test = Corpus(VectorSource(test))
my_documents_test = documents_raw_test
my_documents_test = tm_map(my_documents_test, content_transformer(tolower)) # make everything lowercase
my_documents_test = tm_map(my_documents_test, content_transformer(removeNumbers)) # remove numbers
my_documents_test = tm_map(my_documents_test, content_transformer(removePunctuation)) # remove punctuation
my_documents_test = tm_map(my_documents_test, content_transformer(stripWhitespace)) ## remove excess white-space
my_documents_test = tm_map(my_documents_test, content_transformer(removeWords), stopwords("en"))
###

## create a doc-term-matrix
DTM_train = DocumentTermMatrix(my_documents)
DTM_test = DocumentTermMatrix(my_documents_test)


#### NAIVE BAYES:

DTM_train <- removeSparseTerms(DTM_train, 0.91)
DTM_train_freq <- as.data.frame(as.matrix(DTM_train))
DTM_train_freq <- as.data.frame(as.matrix(DTM_train_freq))
DTM_test <- removeSparseTerms(DTM_test, 0.96)
DTM_test <- as.data.frame(as.matrix(DTM_test))
DTM_test_norm <- DTM_test[ ,(names(DTM_test) %in% names(DTM_train_freq))]

train = as.matrix(DTM_train_freq)
test =  as.matrix(DTM_test_norm)
train_Y =  as.factor(labels_train)
test_Y = as.factor(labels_test)

train_df = cbind(as.data.frame(train), as.data.frame(train_Y))

classifier <-  naive_bayes(train, train_Y, laplace = 1)
pred <- predict(classifier, test, type = 'class')
pred_tab <- table("Predictions"= pred,  "Actual" = labels_test)
NB_r <- sum(diag(pred_tab))/sum(pred_tab)


### Random Forest:

library(randomForest)
colnames(train_df) <- paste(colnames(train_df), "_c", sep = "")
test_rf <- test
colnames(test_rf) <- paste(colnames(test), "_c", sep = "")
model_rf <- randomForest(train_Y_c ~ . ,data = train_df, ntree=1000, mtry = 20) # Non cv

pred_rf <- predict(model_rf, test_rf, type = 'class')
pred_tab_rf <- table("Predictions"= pred_rf,  "Actual" = labels_test)
rf_r <- sum(diag(pred_tab_rf))/sum(pred_tab_rf)
rf_r

