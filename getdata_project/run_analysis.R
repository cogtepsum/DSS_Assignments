library(plyr)
source('./create_subset.R')

# read train and test data in two datasets created by create_subset() function
trainset <- create_subset('./X_train.txt', './y_train.txt', './subject_train.txt')
testset <- create_subset('./X_test.txt', './y_test.txt', './subject_test.txt')

# create full dataset
fulldata <- rbind(trainset, testset)    # merge train and test data
fulldata <- arrange(fulldata, Subject)  # sort data just fo convenience

# label activities
activities <- read.table('./activity_labels.txt')  # read activity labels
activities <- activities[, 2]                           # take only second column that contains strings
fulldata$Activity <- cut(fulldata$Activity, length(activities), labels = activities)    # assign string values to activities in dataset

# creating dataset of means
fulldata <- ddply(fulldata, .(Subject, Activity), numcolwise(mean))

# writing data to a file
write.table(fulldata, file = './tidy_data_set.txt', row.names = FALSE)