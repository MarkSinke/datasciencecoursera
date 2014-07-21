source('corr.R')
source('complete.R')
cr <- corr("specdata", 150)
print(head(cr))
print(summary(cr))
print('---')

cr <- corr("specdata", 400)
print(head(cr))
print(summary(cr))
print('---')

cr <- corr("specdata", 5000)
print(summary(cr))
print(length(cr))

print('---')

cr <- corr("specdata")
print(summary(cr))
print(length(cr))