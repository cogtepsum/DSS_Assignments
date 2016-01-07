rankall <- function(outcome, num="best"){
        outdata <- read.csv("outcome-of-care-measures.csv", colClasses = "character")
        
        if(!outcome %in% c("heart attack", "heart failure", "pneumonia")){
                stop("invalid outcome")
        }
        if(is.numeric(num) && num > nrow(outdata)){
                return(NA)
        }
        
        size <- length(unique(outdata$State))
        newdata <- data.frame(hospital=character(), state=character())
        
        for (state in sort(unique(outdata$State))) {
                newdata <- rbind(newdata, data.frame(hospital=as.character(rankhospital(state, outcome, num)), state=state))
        }
        newdata
}