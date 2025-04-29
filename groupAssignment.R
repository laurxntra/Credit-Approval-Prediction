library(readxl)
library(MASS)

dataset <- read.csv("/Users/laurxntra/Desktop/INFO180/groupAssignment/credit_dataset_CSV.csv")

head(dataset)

# Rename columns to appropriate naming conventions
colnames(dataset) <- c("ID", "Limit_Bal", "Sex", "Education", "Marriage", "Age", 
                       "Pay_1", "Pay_2", "Pay_3", "Pay_4", "Pay_5", "Pay_6", 
                       "Bill_Amt1", "Bill_Amt2", "Bill_Amt3", "Bill_Amt4", 
                       "Bill_Amt5", "Bill_Amt6", "Pay_Amt1", "Pay_Amt2", 
                       "Pay_Amt3", "Pay_Amt4", "Pay_Amt5", "Pay_Amt6", 
                       "Default_Payment_Next_Month")
                       
colnames(dataset)

# Remove 1st data entry, this is because the 1st data entry was the proper naming 
# conventions for our dataset
dataset <- dataset[-1, ]

# Converting columns to appropriate data types
dataset$Limit_Bal <- as.numeric(dataset$Limit_Bal)
dataset$Sex <- as.factor(dataset$Sex)
dataset$Education <- as.factor(dataset$Education)
dataset$Marriage <- as.factor(dataset$Marriage)
dataset$Age <- as.numeric(dataset$Age)
dataset$Pay_1 <- as.numeric(dataset$Pay_1)
dataset$Pay_2 <- as.numeric(dataset$Pay_2)
dataset$Pay_3 <- as.numeric(dataset$Pay_3)
dataset$Pay_4 <- as.numeric(dataset$Pay_4)
dataset$Pay_5 <- as.numeric(dataset$Pay_5)
dataset$Pay_6 <- as.numeric(dataset$Pay_6)
dataset$Bill_Amt1 <- as.numeric(dataset$Bill_Amt1)
dataset$Bill_Amt2 <- as.numeric(dataset$Bill_Amt2)
dataset$Bill_Amt3 <- as.numeric(dataset$Bill_Amt3)
dataset$Bill_Amt4 <- as.numeric(dataset$Bill_Amt4)
dataset$Bill_Amt5 <- as.numeric(dataset$Bill_Amt5)
dataset$Bill_Amt6 <- as.numeric(dataset$Bill_Amt6)
dataset$Pay_Amt1 <- as.numeric(dataset$Pay_Amt1)
dataset$Pay_Amt2 <- as.numeric(dataset$Pay_Amt2)
dataset$Pay_Amt3 <- as.numeric(dataset$Pay_Amt3)
dataset$Pay_Amt4 <- as.numeric(dataset$Pay_Amt4)
dataset$Pay_Amt5 <- as.numeric(dataset$Pay_Amt5)
dataset$Pay_Amt6 <- as.numeric(dataset$Pay_Amt6)
dataset$Default_Payment_Next_Month <- as.factor(dataset$Default_Payment_Next_Month)

str(dataset)

# Logit regression model of entire dataset
full_logit_model <- glm( ~ Limit_Bal + Sex + Education + 
                          Marriage + Age + Pay_1 + Pay_2 + Pay_3 + Pay_4 + 
                          Pay_5 + Pay_6 + Bill_Amt1 + Bill_Amt2 + Bill_Amt3 + Bill_Amt4 + 
                          Bill_Amt5 + Bill_Amt6 + Pay_Amt1 + Pay_Amt2 + Pay_Amt3 + Pay_Amt4 + 
                          Pay_Amt5 + Pay_Amt6, family = binomial(link = "logit"), data = dataset)
summary(full_logit_model)


# Full probit regression model
full_probit_model <- glm(Default_Payment_Next_Month ~ Limit_Bal + Sex + Education + Marriage + 
                           Age + Pay_1 + Pay_2 + Pay_3 + Pay_4 + Pay_5 + Pay_6 + Bill_Amt1 + 
                           Bill_Amt2 + Bill_Amt3 + Bill_Amt4 + Bill_Amt5 + Bill_Amt6 + Pay_Amt1 + 
                           Pay_Amt2 + Pay_Amt3 + Pay_Amt4 + Pay_Amt5 + Pay_Amt6, 
                         family = binomial(link = "probit"), data = dataset)

summary(full_probit_model)

