rankhospital <- function(state, outcome, num = "best") {
    colNo <- switch(outcome, "heart attack" = 11, "heart failure" = 17, "pneumonia" = 23)
    if (!is.numeric(colNo)) {
        stop("invalid outcome")
    }
    
    fullData <- read.csv("outcome-of-care-measures.csv", colClasses = "character")
    fullData[, colNo] <- suppressWarnings(as.numeric(fullData[, colNo]))

    # 7 = state column
    stateData <- subset(fullData, fullData[, 7] == state & fullData[, colNo] != "Not Available")
    
    if (nrow(stateData) == 0) {
        stop("invalid state")
    }
    
    # 2 = Hospital.Name
    ordered <- stateData[order(stateData[, colNo], stateData[, 2]), ]
    
    index <- if (num == "best") 1 else if (num == "worst") nrow(ordered) else as.integer(num)
    
    as.character(ordered[index,2])
}
