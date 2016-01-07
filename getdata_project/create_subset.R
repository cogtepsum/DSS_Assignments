# this function gets locations of files for X, y, and subjects
# and combines them into one dataframe
# with descriptive varibale names

create_subset <- function(Xfile, yfile, subject_file) {
        Xset <- read.table(Xfile)       # read data
        
        features <- read.table('./features.txt')   # this file doesn't need to be specified in function input 
        features <- features[, 2]                       # take only second column that contains strings
        features <- gsub('-', '_', features)            # replace dashes with underscores
        features <- gsub('\\(\\)', '', features)        # remove empty parentheses
        colnames(Xset) <- features                      # assing obtained column names to Xset
        
        xmean <- Xset[names(Xset)[grep('_mean', names(Xset))]]  # subset of Xset with means only
        xstd <- Xset[names(Xset)[grep('_std', names(Xset))]]    # subset of Xset with stds only
        
        yset <- read.table(yfile)               # read data for Y
        subjset <- read.table(subject_file)     # read data for subjects
        
        finalset <- cbind(yset, xmean, xstd)    # merge x-datasets with y-dataset
        finalset <- cbind(subjset, finalset)    # merge obtained dataset with subjects-dataset
        
        colnames(finalset)[1] <- 'Subject'      # assign descriptive name to 1st column
        colnames(finalset)[2] <- 'Activity'     # assign descriptive name to 2nd column
        
        finalset
}