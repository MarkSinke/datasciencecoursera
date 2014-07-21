readCompleteObservations <- function (directory, id) {
  data <- read.csv(sprintf("%s/%03d.csv", directory, id))
  subset(data, !is.na(nitrate) & !is.na(sulfate))
}

complete <- function(directory, id = 1:332) {
  ## 'directory' is a character vector of length 1 indicating
  ## the location of the CSV files
  
  ## 'id' is an integer vector indicating the monitor ID numbers
  ## to be used
  
  ## Return a data frame of the form:
  ## id nobs
  ## 1  117
  ## 2  1041
  ## ...
  ## where 'id' is the monitor ID number and 'nobs' is the
  ## number of complete cases
  result <- data.frame(id=numeric(length(id)), nobs=numeric(length(id)), stringsAsFactors=FALSE)
  index <- 1
  for (currentId in id) {
    obs <- readCompleteObservations(directory, currentId) 
    result[index, ] = c(currentId, nrow(obs))
    index <- index + 1
  }
  result
}

