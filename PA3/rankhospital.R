rankhospital <- function(state, outcome, num="best") {
        ## read outcome data
        outdata <- read.csv("outcome-of-care-measures.csv", colClasses = "character")
        outdata[, 11] <- as.numeric(outdata[, 11])
        outdata[, 17] <- as.numeric(outdata[, 17])
        outdata[, 23] <- as.numeric(outdata[, 23])
        
        if(!state %in% outdata$State){
                stop("invalid state")
        }
        outdata <- outdata[which(outdata$State==state), ]
        
        if(!outcome %in% c("heart attack", "heart failure", "pneumonia")){
                stop("invalid outcome")
        }
        if(is.numeric(num) && num > nrow(outdata)){
                return(NA)
        }
        
        if(outcome=="heart attack"){
                outdata <- outdata[, c(2, 11)]
                outdata <- outdata[complete.cases(outdata), ]
                outdata <- outdata[order(outdata$Hospital.30.Day.Death..Mortality..Rates.from.Heart.Attack, outdata$Hospital.Name), ]
                if(num=="best"){
                        head(outdata$Hospital.Name, 1)
                } else if(num=="worst"){
                        tail(outdata$Hospital.Name, 1)
                } else {
                        outdata$Hospital.Name[num]
                }
        } else if(outcome=="heart failure"){
                outdata <- outdata[, c(2, 17)]
                outdata <- outdata[complete.cases(outdata), ]
                outdata <- outdata[order(outdata$Hospital.30.Day.Death..Mortality..Rates.from.Heart.Failure, outdata$Hospital.Name), ]
                if(num=="best"){
                        head(outdata$Hospital.Name, 1)
                } else if(num=="worst"){
                        tail(outdata$Hospital.Name, 1)
                } else {
                        outdata$Hospital.Name[num]
                }
        } else if(outcome=="pneumonia"){
                outdata <- outdata[, c(2, 23)]
                outdata <- outdata[complete.cases(outdata), ]
                outdata <- outdata[order(outdata$Hospital.30.Day.Death..Mortality..Rates.from.Pneumonia, outdata$Hospital.Name), ]
                if(num=="best"){
                        head(outdata$Hospital.Name, 1)
                } else if(num=="worst"){
                        tail(outdata$Hospital.Name, 1)
                } else {
                        outdata$Hospital.Name[num]
                }
        }
}