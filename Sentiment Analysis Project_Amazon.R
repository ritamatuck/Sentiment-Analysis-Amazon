### Sentence-Level Sentiment Analysis with sentimentr

## Installing the packages and loading the data

install.packages("sentimentr")
library(sentimentr)

## Reading json file

setwd("E:/Study time/Data Science/R")

install.packages("ndjson")
library(ndjson)
df = stream_in("Beauty_5.json")
head(df)

## Doing the actual sentiment analysis

# sentiment    ---> Sentiment at the sentence level
# sentiment_by ---> Aggregated sentiment by group(s)

sentiment = sentiment_by(df$reviewText)

#This command runs the sentiment analysis. In this case, I used the sentiment_by command to get an aggregate 
#sentiment measure for the entire review. In other cases, you could use the sentiment command (without _by) 
#to get the sentiment per sentence.

sentiment

# element_id - The id number of the review
# word_count - The word count of the review
# sd - The standard deviation of the sentiment score of the sentences in the review
# ave_sentiment - The average sentiment score of the sentences in the review

## Analyzing the Sentiment Scores

summary(sentiment$ave_sentiment)

## Histogram to look at the sentiment of the reviews

install.packages("ggplot2")
library(ggplot2)
qplot(sentiment$ave_sentiment,   geom="histogram",binwidth=0.1,main="Review Sentiment Histogram")

## Integrating your sentiment scores into the original dataset

df$ave_sentiment=sentiment$ave_sentiment
df$sd_sentiment=sentiment$sd

View(df)
