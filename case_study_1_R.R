rm(list=ls())

setwd("C:/Users/kames/OneDrive/Documents/GitHub/Stout")

require(Sleuth3)
require(mosaic)
require(knitr)


readFile = read.csv("r-input-file.csv")
summary(readFile)
Model0 <- lm(interest_rate ~ 1, data = readFile)
Model1 <- lm(interest_rate ~ ., data =  readFile)
FullModel <- lm(interest_rate ~ .^2, data = readFile)

BestModel <- step(Model1, scope = list(lower = Model0, upper = FullModel), direction = "both")

summary(BestModel)

plot(BestModel)

#Best Model With Interaction terms using variables from features set and having lowest AIC value

# lm(formula = interest_rate ~ verified_income + debt_to_income + 
#      inquiries_last_12m + accounts_opened_24m + num_active_debit_accounts + 
#      total_debit_limit + num_mort_accounts + account_never_delinq_percent + 
#      loan_amount + term + issue_month + loan_status + initial_listing_status + 
#      disbursement_method + paid_interest + loan_amount:paid_interest + 
#      total_debit_limit:loan_amount + term:paid_interest + loan_amount:term + 
#      loan_amount:issue_month + loan_amount:initial_listing_status + 
#      loan_amount:loan_status + loan_status:paid_interest + total_debit_limit:num_mort_accounts + 
#      total_debit_limit:term + total_debit_limit:loan_status + 
#      loan_amount:disbursement_method + debt_to_income:loan_amount + 
#      inquiries_last_12m:loan_amount + accounts_opened_24m:term + 
#      debt_to_income:num_active_debit_accounts + term:disbursement_method + 
#      accounts_opened_24m:num_active_debit_accounts + verified_income:paid_interest + 
#      num_mort_accounts:loan_amount + total_debit_limit:paid_interest + 
#      account_never_delinq_percent:paid_interest + verified_income:loan_status + 
#      debt_to_income:issue_month + total_debit_limit:issue_month + 
#      issue_month:paid_interest + num_mort_accounts:term + accounts_opened_24m:loan_status + 
#      debt_to_income:paid_interest + debt_to_income:total_debit_limit + 
#      issue_month:loan_status + num_active_debit_accounts:initial_listing_status + 
#      num_active_debit_accounts:disbursement_method + num_mort_accounts:issue_month + 
#      debt_to_income:initial_listing_status + verified_income:term + 
#      verified_income:initial_listing_status + loan_status:disbursement_method + 
#      num_active_debit_accounts:loan_status + verified_income:num_mort_accounts + 
#      debt_to_income:account_never_delinq_percent + num_active_debit_accounts:issue_month + 
#      account_never_delinq_percent:issue_month + loan_status:initial_listing_status + 
#      account_never_delinq_percent:initial_listing_status + inquiries_last_12m:issue_month + 
#      inquiries_last_12m:num_mort_accounts + initial_listing_status:disbursement_method + 
#      num_active_debit_accounts:account_never_delinq_percent + 
#      num_active_debit_accounts:loan_amount + issue_month:disbursement_method + 
#      debt_to_income:disbursement_method + verified_income:num_active_debit_accounts + 
#      verified_income:accounts_opened_24m, data = readFile)
