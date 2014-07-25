source("best.R")
print(best("TX", "heart attack"))
# [1] "CYPRESS FAIRBANKS MEDICAL CENTER"
print(best("TX", "heart failure"))
# [1] "FORT DUNCAN MEDICAL CENTER"
print(best("MD", "heart attack"))
# [1] "JOHNS HOPKINS HOSPITAL, THE"
print(best("MD", "pneumonia"))
# [1] "GREATER BALTIMORE MEDICAL CENTER"
print(best("BB", "heart attack"))
# Error in best("BB", "heart attack") : invalid state
print(best("NY", "hert attack"))
# Error in best("NY", "hert attack") : invalid outcome
