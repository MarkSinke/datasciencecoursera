rankall <- function(outcome, num = "best") {
    colNo <- switch(outcome, "heart attack" = 11, "heart failure" = 17, "pneumonia" = 23)
    if (!is.numeric(colNo)) {
        stop("invalid outcome")
    }
    
    fullData <- read.csv("outcome-of-care-measures.csv", colClasses = "character")
    fullData <- subset(fullData, fullData[, colNo] != "Not Available")

    # normalize colNo column to numbers
    fullData[, colNo] <- suppressWarnings(as.numeric(fullData[, colNo]))
    ordered <- fullData[order(fullData[, 7], fullData[, colNo], fullData[, 2]), ]
    
    # 7 = state column
    statesData <- split(ordered, ordered[, 7])
    
    ranks <- lapply(statesData, function(stateData) {
        index <- if (num == "best") 1 else if (num == "worst") nrow(stateData) else as.integer(num)
        c(hospital = as.character(stateData[index,2]), state =  as.character(stateData[1, 7]))
    })
    
    as.data.frame(do.call(rbind, ranks))
}
