# classification package
install.packages("class")

# decision tree package
install.packages("party")

# this one has an odd name but we do need it - SVM package
install.packages("e1071")

# this is the crossvalidation package - CARET
install.packages("caret")

# now reference all the libraries
library(class)
library(party)
library(e1071)
library(caret)
library(ggplot2)
library(mfx)
library(randomForest)

# type CTRL+L to clean up your console

# cleanup your environment
rm(list=ls())

# set the working directory
setwd("C:\\INFO 180")

credit_dataset_CSV = read.csv("C:/INFO 180/credit_dataset_CSV.csv", header=TRUE, stringsAsFactors=TRUE)

# initial exploratory analysis
summary(dataset)

# the ID is one per row - not useful as a predictor - remove
credit_dataset_CSV$ID = NULL

# some variables are clearly representing categories --> as.factor() to convert
dataset$EDUCATION = as.factor(dataset$EDUCATION)
dataset$SEX = as.factor(dataset$SEX)
dataset$MARRIAGE = as.factor(dataset$MARRIAGE)
dataset$PAY_0 = as.factor(dataset$PAY_0)
dataset$PAY_2 = as.factor(dataset$PAY_2)
dataset$PAY_3 = as.factor(dataset$PAY_3)
dataset$PAY_4 = as.factor(dataset$PAY_4)
dataset$PAY_5 = as.factor(dataset$PAY_5)
dataset$PAY_6 = as.factor(dataset$PAY_6)

# better - discuss the summary statistics in your report and print output.
# feel free to also make additional conversions. AGE for example?
summary(credit_dataset_CSV)

# no missing values -- good!
sum(is.na(credit_dataset_CSV))

# exploratory analysis - visualization example in Tableau feel free to do one or not 

full_logit_model <- glm(default.payment.next.month ~ LIMIT_BAL + SEX + EDUCATION + 
                          MARRIAGE + AGE + PAY_0 + PAY_2 + PAY_3 + PAY_4 + 
                          PAY_5 + PAY_6 + BILL_AMT1 + BILL_AMT2 + BILL_AMT3 + BILL_AMT4 + 
                          BILL_AMT5 + BILL_AMT6 + PAY_AMT1 + PAY_AMT2 + PAY_AMT3 + PAY_AMT4 + 
                          PAY_AMT5 + PAY_AMT6, family = binomial(link = "logit"), data = dataset)
summary(full_logit_model)

# regression analysis - outcome default
logit_model = glm(default.payment.next.month~LIMIT_BAL+AGE+PAY_0+EDUCATION, 
                  family="binomial",data=dataset)
summary(logit_model)

# repeat for probit; try different models too Y~X1+X2+X3+... 
probit_model = glm(default.payment.next.month~LIMIT_BAL+AGE+PAY_0+SEX,
                  family="binomial"(link="probit"), data=dataset)
summary(probit_model)

# interpret the marginal effects table. for example:
logitmfx(default.payment.next.month~PAY_0+ PAY_2+PAY_3+EDUCATION+LIMIT_BAL+BILL_AMT1, data = credit_dataset_CSV)

# Example of running two models for classification
credit_dataset_CSV$default.payment.next.month = as.factor(credit_dataset_CSV$default.payment.next.month)
library("caret")
train_Control = trainControl(method = "cv", number = 3) 
knn_caret = train(default.payment.next.month~PAY_0+ PAY_2+PAY_3+EDUCATION+LIMIT_BAL+BILL_AMT1, 
                  data = credit_dataset_CSV, 
                  method = "knn", trControl = train_Control,
                  tuneLength = 3)
knn_caret

linear_svm_model <- svm(default.payment.next.month ~ LIMIT_BAL+PAY_1+PAY_2+PAY_3+PAY_4+PAY_5+PAY_6+EDUCATION+AGE, )


