rm(list =ls())

library(tm) 
library(magrittr)
library(slam)
library(proxy)
#library(RTextTools)
library(e1071)
library(dplyr)
library(caret)
# Library for parallel processing
#library(doMC)
#registerDoMC(cores=detectCores())  # Use all available cores


setwd('C:/Users/pivo/Desktop/UT MSBA/Summer 2019/Predictive Models/STA380')
readerPlain = function(fname){
  readPlain(elem=list(content=readLines(fname)), 
            id=fname, language='en') }

authors_train = Sys.glob('C:/Users/pivo/Desktop/UT MSBA/Summer 2019/Predictive Models/STA380/data/ReutersC50/C50train/*')
file_list_train = NULL
labels_train = NULL
for(author in authors_train) {
  files_to_add = Sys.glob(paste0(author, '/*.txt'))
  file_list_train = append(file_list_train, files_to_add)
  author_name = substring(author, first=92)
  labels_train = append(labels_train, rep(author_name, length(files_to_add)))
}


authors_test = Sys.glob('C:/Users/pivo/Desktop/UT MSBA/Summer 2019/Predictive Models/STA380/data/ReutersC50/C50test/*')
file_list_test = NULL
labels_test = NULL

for(author in authors_test) {
  files_to_add_test = Sys.glob(paste0(author, '/*.txt'))
  file_list_test = append(file_list_test, files_to_add_test)
  author_name_test = substring(author, first=91)
  labels_test = append(labels_test, rep(author_name_test, length(files_to_add_test)))
}
labels_test


file_list = Sys.glob('data/ReutersC50/C50train/*')
simon = lapply(file_list, readerPlain) 

# The file names are ugly...
file_list

# Clean up the file names
# This uses the piping operator from magrittr
# See https://cran.r-project.org/web/packages/magrittr/vignettes/magrittr.html
mynames = file_list %>%
  { strsplit(., '/', fixed=TRUE) } %>%
  { lapply(., tail, n=2) } %>%
  { lapply(., paste0, collapse = '') } %>%
  unlist

# Rename the articles
mynames
names(simon) = mynames

## once you have documents in a vector, you 
## create a text mining 'corpus' with: 
documents_raw = Corpus(VectorSource(simon))

## Some pre-processing/tokenization steps.
## tm_map just maps some function to every document in the corpus
my_documents = documents_raw
my_documents = tm_map(my_documents, content_transformer(tolower)) # make everything lowercase
my_documents = tm_map(my_documents, content_transformer(removeNumbers)) # remove numbers
my_documents = tm_map(my_documents, content_transformer(removePunctuation)) # remove punctuation
my_documents = tm_map(my_documents, content_transformer(stripWhitespace)) ## remove excess white-space

## Remove stopwords.  Always be careful with this: one person's trash is another one's treasure.
stopwords("en")
stopwords("SMART")
?stopwords
my_documents = tm_map(my_documents, content_transformer(removeWords), stopwords("en"))


## create a doc-term-matrix
DTM_simon = DocumentTermMatrix(my_documents)
#View(inspect(DTM_simon))
dim(DTM_simon)



## TEST ###
file_list_test = Sys.glob('data/ReutersC50/C50test/*')
simon_test = lapply(file_list_test, readerPlain) 
mynames = file_list_test %>%
  { strsplit(., '/', fixed=TRUE) } %>%
  { lapply(., tail, n=2) } %>%
  { lapply(., paste0, collapse = '') } %>%
  unlist

names(simon_test) = mynames
documents_raw_test = Corpus(VectorSource(simon_test))
my_documents_test = documents_raw_test
my_documents_test = tm_map(my_documents_test, content_transformer(tolower)) # make everything lowercase
my_documents_test = tm_map(my_documents_test, content_transformer(removeNumbers)) # remove numbers
my_documents_test = tm_map(my_documents_test, content_transformer(removePunctuation)) # remove punctuation
my_documents_test = tm_map(my_documents_test, content_transformer(stripWhitespace)) ## remove excess white-space
my_documents_test = tm_map(my_documents_test, content_transformer(removeWords), stopwords("en"))

DTM_simon_test = DocumentTermMatrix(my_documents_test)
###


#### NAIVE BAYES

convert_count <- function(x) {
  y <- ifelse(x > 0, 1,0)
  y <- factor(y, levels=c(0,1))
  y
}
# Apply the convert_count function to get final training and testing DTMs
trainNB <- apply(DTM_simon, 2, convert_count)
testNB <- apply(DTM_simon_test, 2, convert_count)


#trainNB_scale = scale(trainNB, center = TRUE, scale = TRUE)
View(labels_train)

classifier <- naiveBayes(trainNB, labels_train, laplace = 1) ##<----  how to get Author?
pred <- predict(classifier, newdata=testNB) ## Error here <----
table("Predictions"= factor(pred),  "Actual" = factor(authors_train) )

