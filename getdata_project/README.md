# Creating a tidy data set
####Course project from Coursera Getting and Cleaning Data course
###### Little warning: I'm not a native English speaker and I apologize for my bad grammar. I sincerely hope that you will understand most of what I'm trying to explain here. =)

### Structure of the project
 This project consists of three R scripts for analisys, output textfile with a tidy data set, CodeBook and this Readme file. Scripts assume that all of the necessary data is in the working directory.
 
### What are these scripts doing?
As you can see, there is three R-scripts in this project. The pipeline of their usage is `run_analysis.R` -> `view_output.R`. The `run_analysis.R` file implicitly runs `create_subset.R` two times.

In this project I have assumed that we may want to have an opportunity to get not one, but two tidy datasets from created scripts so we could use them for training and testing some hypothetical statistical model. That is why here is the `create_subset.R` script, that creates a dataset for only train or test data. After that `run_analisys.R` script merges these datasets and melt the result into a dataset of means. Let's take a closer look.

#### create_subset.R
This script contains a function `create_subset()` that takes tree arguments: location of X-data file, location of y-data file and location of subjects-data file. An example of the input is like that: `./X_train.txt`, `./y_train.txt`, `./subject_train.txt`. These files form complete train data. Similarly, comlete test data can be formed with `./X_test.txt`, `./y_test.txt`, `./subject_test.txt` files.

After that script reads variable names from `features.txt` and processes each of them to match R requirements for variable names.
Then, obtained labels are assigned to columns of X-dataset, and every column that doesn't contain `_mean` or `_std` in its name is discarded (this obviously includes `meanFreq()` variables). Finally, script merges x-dataset with y-dataset and subject-dataset and assign descriptive variable names to these new columns. The result looks like that:

| Subject | Activity | tBodyAcc\_mean\_X | ... | fBodyBodyGyroJerkMag_std |
| ------- | -------- | --------------- | --- | ------------------------ |
|       1 |        5 |      0.28858451 | ... |              -0.99069746 |
| ... | ... | ... | ... | ... |
|      30 |        2 |      0.35150347 | ... |               -0.7451204 |

Resulting dataset contains input values, y values and subject values for train or test set. This dataset has descriptive variable names and has one row per measurement and one column per variable. Note that values for Activity variable is still numeric, so it better fits to most of statistical methods (they are generally working with numbers rather than strings). This dataset can be already considered tidy, but it doesn't quite fit all of the course requirements yet.

#### run_analysis.R
This is the script that creates the final tidy dataset.

First of all, it calls previously described `create_subset()` function for train and test data. Then it merges obtained datasets and arrange the result by subject. After that the script reads activity labels from file `activity_lables.txt` and replaces values in the dataset according to these labels with a `cut()` function. Finally, mean of each variable for each activity and each subject are calculated with a `ddply()` function. The result is written in `tidy_data_set.txt` file with `write.table()` function. The result looks like that:

| Subject | Activity | tBodyAcc\_mean\_X | ... | fBodyBodyGyroJerkMag_std |
| ------- | -------- | --------------- | --- | ------------------------ |
|       1 | WALKING |      0.2773308 | ... |              -0.38160191 |
| ... | ... | ... | ... | ... |
|      30 | LAYING |      0.2810339 | ... |               -0.97548155 |

Resulting dataset meets tidy data principles as well as requirements of course project. It has one column per variable and one row per measurements (i.e. averages of each variable for each activity and each subject), columns have descriptive names and values of the Activity column are descriptive strings as well. The dataset has 180 rows and 81 variables.

#### view_output.R
Text file provided by above-described scripts may look like a mess if viewed in conventional text editors. I provide script for reading the file into R as it is suggested in [this](https://class.coursera.org/getdata-032/forum/thread?thread_id=26) thread of Discussion Forums.

You can also look at this file using Excel and specifying white spaces as delimiters.