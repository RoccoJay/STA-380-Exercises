library(tm) 
library(magrittr)
library(slam)
library(proxy)
library(RTextTools)
library(e1071)
library(dplyr)
library(caret)
# Library for parallel processing
library(doMC)
registerDoMC(cores=detectCores())  # Use all available cores


setwd('C:/Users/pivo/Desktop/UT MSBA/Summer 2019/Predictive Models/STA380')
readerPlain = function(fname){
  readPlain(elem=list(content=readLines(fname)), 
            id=fname, language='en') }

file_list = Sys.glob('data/ReutersC50/C50train/SimonCowell/*.txt')
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
View(inspect(DTM_simon))
dim(DTM_simon)



## TEST ###
file_list_test = Sys.glob('data/ReutersC50/C50test/SimonCowell/*.txt')
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
  y <- factor(y, levels=c(0,1), labels=c("No", "Yes"))
  y
}
# Apply the convert_count function to get final training and testing DTMs
trainNB <- apply(DTM_simon, 2, convert_count)
testNB <- apply(DTM_simon_test, 2, convert_count)




