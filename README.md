# Credit-Approval-Prediction
## Overview
This project explores and models a credit approval dataset from the UCI Machine Learning Repository to predict whether a customer will default on their next payment

## Dataset
The dataset contains client credit information, including:
- Credit limit, demographics (e.g., age, gender, education, marital status)
- Repayment status for the past six months
- Billing amounts and payment amounts over time
- Default payment status (binary target: 0 = No default, 1 = Default)

## Project Steps
### 1. Data Preparation
   - Imported the dataset (credit_dataset_CSV.csv) into R
   - Renamed columns for clarity and consistency
   - Removed the first row, which contained repeated column headers
   - Converted relevant variables to appropriate data types
### 2. Exploratory Data Analysis
   - Summarized the dataset structure to verify data types and identify any anomalies
   - No missing values were found.
### 3. Regression Models
 Two regression models were trained to predict the probability of default:
 - Logit Model
 - Probit Model
Both models included predictors such as:
- Credit limit
- Sex
- Education
- Marriage
- Age
- Repayment history (Pay_1 to Pay_6)
- Billing amounts (Bill_Amt1 to Bill_Amt6)
- Payment amounts (Pay_Amt1 to Pay_Amt6)

## Technologies Used
- Language: R
- Libraries:
  - readxl
  - MASS 
