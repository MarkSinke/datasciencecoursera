best <- function(state, outcome) {
    colNo <- switch(outcome, "heart attack" = 11, "heart failure" = 17, "pneumonia" = 23)
    if (!is.numeric(colNo)) {
        stop("invalid outcome")
    }
    
    fullData <- read.csv("outcome-of-care-measures.csv", colClasses = "character")
    fullData[, colNo] <- suppressWarnings(as.numeric(fullData[, colNo]))

    # 7 = state column
    stateData <- subset(fullData, fullData[, 7] == state)
    
    if (nrow(stateData) == 0) {
        stop("invalid state")
    }
    
    # 2 = Hospital.Name
    ordered <- stateData[order(stateData[, colNo], stateData[, 2]), ]
    
    as.character(ordered[1,2])
    ## Read outcome data
    ## Check that state and outcome are valid
    ## Return hospital name in that state with lowest 30-day death
    ## rate
}
