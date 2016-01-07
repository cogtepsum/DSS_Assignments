best <- function(state, outcome) {
        ## read outcome data
        outdata <- read.csv("outcome-of-care-measures.csv", colClasses = "character")
        outdata[, 11] <- as.numeric(outdata[, 11])
        outdata[, 17] <- as.numeric(outdata[, 17])
        outdata[, 23] <- as.numeric(outdata[, 23])
        
        if(!state %in% outdata$State){
                stop("invalid state")
        }
        if(!outcome %in% c("heart attack", "heart failure", "pneumonia")){
                stop("invalid outcome")
        }
        outdata <- outdata[which(outdata$State==state), ]
        if(outcome=="heart attack"){
                minrate <- min(outdata$Hospital.30.Day.Death..Mortality..Rates.from.Heart.Attack, na.rm = T)
                sort(outdata$Hospital.Name[which(outdata$Hospital.30.Day.Death..Mortality..Rates.from.Heart.Attack==minrate)])[1]
        } else if(outcome=="heart failure"){
                minrate <- min(outdata$Hospital.30.Day.Death..Mortality..Rates.from.Heart.Failure, na.rm = T)
                sort(outdata$Hospital.Name[which(outdata$Hospital.30.Day.Death..Mortality..Rates.from.Heart.Failure==minrate)])[1]
        } else if(outcome=="pneumonia"){
                minrate <- min(outdata$Hospital.30.Day.Death..Mortality..Rates.from.Pneumonia, na.rm = T)
                sort(outdata$Hospital.Name[which(outdata$Hospital.30.Day.Death..Mortality..Rates.from.Pneumonia==minrate)])[1]
        }
}