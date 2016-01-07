# Code Book
####Course project from Coursera Getting and Cleaning Data course

This dataset was constructed from [Human Activity Recognition Using Smartphones Dataset Version 1.0](http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones) by

Jorge L. Reyes-Ortiz, Davide Anguita, Alessandro Ghio, Luca Oneto.
Smartlab - Non Linear Complex Systems Laboratory
DITEN - Università degli Studi di Genova.
Via Opera Pia 11A, I-16145, Genoa, Italy.

activityrecognition@smartlab.ws

www.smartlab.ws

### Content of the data set
The dataset includes the following files:

- `README.md`: describes code that has formed tidy data set

- `CodeBook.md`: Shows information about the initial data, the way it was obtained and about, resulting dataset and the way it was obtained.

- `create_subset.R`: script that creates tidy dataset for test or train data only. See `README.md` for full details.

- `run_analysis.R`: script that creates the final tidy dataset. See `README.md` for full details.

- `view_output.R`: script that helps open final dataset in R. See `README.md` for full details.

- `tidy_data_set.txt`: tidy data set that meets course project requirements.

The listed scripts works with the following raw data files:

- `features.txt`: List of all features.

- `activity_labels.txt`: Links the class labels with their activity name.

- `X_train.txt`: Training set.

- `y_train.txt`: Training labels.

- `X_test.txt`: Test set.

- `y_test.txt`: Test labels.

- `subject_test.txt`: Test subjects.

- `subject_train.txt`: Train subjects.

### Information about the original data set
#### Description of the experiment
The experiments have been carried out with a group of 30 volunteers within an age bracket of 19-48 years. Each person performed six activities (WALKING, WALKING\_UPSTAIRS, WALKING\_DOWNSTAIRS, SITTING, STANDING, LAYING) wearing a smartphone (Samsung Galaxy S II) on the waist. Using its embedded accelerometer and gyroscope, we captured 3-axial linear acceleration and 3-axial angular velocity at a constant rate of 50Hz. The experiments have been video-recorded to label the data manually. The obtained dataset has been randomly partitioned into two sets, where 70% of the volunteers was selected for generating the training data and 30% the test data. 

The sensor signals (accelerometer and gyroscope) were pre-processed by applying noise filters and then sampled in fixed-width sliding windows of 2.56 sec and 50% overlap (128 readings/window). The sensor acceleration signal, which has gravitational and body motion components, was separated using a Butterworth low-pass filter into body acceleration and gravity. The gravitational force is assumed to have only low frequency components, therefore a filter with 0.3 Hz cutoff frequency was used. From each window, a vector of features was obtained by calculating variables from the time and frequency domain. Features are normalized and bounded within [-1,1]. 

For each record it is provided:

- Triaxial acceleration from the accelerometer (total acceleration) and the estimated body acceleration.
- Triaxial Angular velocity from the gyroscope. 
- A 561-feature vector with time and frequency domain variables. 
- Its activity label. 
- An identifier of the subject who carried out the experiment.

#### Feature selection
The features selected for this database come from the accelerometer and gyroscope 3-axial raw signals tAcc-XYZ and tGyro-XYZ. These time domain signals (prefix 't' to denote time) were captured at a constant rate of 50 Hz. Then they were filtered using a median filter and a 3rd order low pass Butterworth filter with a corner frequency of 20 Hz to remove noise. Similarly, the acceleration signal was then separated into body and gravity acceleration signals (tBodyAcc-XYZ and tGravityAcc-XYZ) using another low pass Butterworth filter with a corner frequency of 0.3 Hz. 

Subsequently, the body linear acceleration and angular velocity were derived in time to obtain Jerk signals (tBodyAccJerk-XYZ and tBodyGyroJerk-XYZ). Also the magnitude of these three-dimensional signals were calculated using the Euclidean norm (tBodyAccMag, tGravityAccMag, tBodyAccJerkMag, tBodyGyroMag, tBodyGyroJerkMag). 

Finally a Fast Fourier Transform (FFT) was applied to some of these signals producing fBodyAcc-XYZ, fBodyAccJerk-XYZ, fBodyGyro-XYZ, fBodyAccJerkMag, fBodyGyroMag, fBodyGyroJerkMag. (Note the 'f' to indicate frequency domain signals). 

These signals were used to estimate variables of the feature vector for each pattern:  
'-XYZ' is used to denote 3-axial signals in the X, Y and Z directions.

- tBodyAcc-XYZ
- tGravityAcc-XYZ
- tBodyAccJerk-XYZ
- tBodyGyro-XYZ
- tBodyGyroJerk-XYZ
- tBodyAccMag
- tGravityAccMag
- tBodyAccJerkMag
- tBodyGyroMag
- tBodyGyroJerkMag
- fBodyAcc-XYZ
- fBodyAccJerk-XYZ
- fBodyGyro-XYZ
- fBodyAccMag
- fBodyAccJerkMag
- fBodyGyroMag
- fBodyGyroJerkMag

The set of variables that were estimated from these signals are: 

- mean(): Mean value
- std(): Standard deviation
- mad(): Median absolute deviation 
- max(): Largest value in array
- min(): Smallest value in array
- sma(): Signal magnitude area
- energy(): Energy measure. Sum of the squares divided by the number of values. 
- iqr(): Interquartile range 
- entropy(): Signal entropy
- arCoeff(): Autorregresion coefficients with Burg order equal to 4
- correlation(): correlation coefficient between two signals
- maxInds(): index of the frequency component with largest magnitude
- meanFreq(): Weighted average of the frequency components to obtain a mean frequency
- skewness(): skewness of the frequency domain signal 
- kurtosis(): kurtosis of the frequency domain signal 
- bandsEnergy(): Energy of a frequency interval within the 64 bins of the FFT of each window.
- angle(): Angle between to vectors.

Additional vectors obtained by averaging the signals in a signal window sample. These are used on the angle() variable:

- gravityMean
- tBodyAccMean
- tBodyAccJerkMean
- tBodyGyroMean
- tBodyGyroJerkMean

The complete list of variables of each feature vector is available in 'features.txt'

### Creating the tidy data set
Tidy data set was created by scripts described in `README.md`.

First of all, `X_train` column labels were renamed according to `features.txt` file. After that, every column that doesn't contain \"\_mean\" or \"\_std\" in its name was discarded. That means that only *mean()*, *std()* and *meanFreq()* variables from the original data set remain in `X_train`. Remaining column names were then refined to meet R requirements for variable names (removed parentheses, replaced hyphens with underscores). Then `subject_train` and `y_train` tables were added to `X_train` as first and second columns, respectively. These columns were renamed with descriptive names ("Subject" and "Activity", respectively). These operations formed a new data set with 7352 rows and 81 columns and looks like this:

| Subject | Activity | tBodyAcc\_mean\_X | ... | fBodyBodyGyroJerkMag_std |
| ------- | -------- | --------------- | --- | ------------------------ |
|       1 |        5 |      0.28858451 | ... |              -0.99069746 |
| ... | ... | ... | ... | ... |
|      30 |        2 |      0.35150347 | ... |               -0.7451204 |

The same actions were performed on `X_test`, `y_test` and `subject_test` tables creating a new dataset with 2947 rows and 81 columns that looks like this:

| Subject | Activity | tBodyAcc\_mean\_X | ... | fBodyBodyGyroJerkMag_std |
| ------- | -------- | --------------- | --- | ------------------------ |
|       2 |        5 |      0.25717778 | ... |              -0.9073076 |
| ... | ... | ... | ... | ... |
|      24 |        2 |      0.15362719 | ... |               -0.6252073 |

Resulting data sets were combined row-wise and sorted by subject to create a new dataset with 10299 rows and 81 columns. Then each value of *Activity* variable was changed from number to string according to `activity_labels.txt` file.

The final step was to create a new data set by calculating the average value of each variable for each subject and each activity. The final data set has 180 rows, 81 columns and looks like this:

| Subject | Activity | tBodyAcc\_mean\_X | ... | fBodyBodyGyroJerkMag_std |
| ------- | -------- | --------------- | --- | ------------------------ |
|       1 | WALKING |      0.2773308 | ... |              -0.38160191 |
| ... | ... | ... | ... | ... |
|      30 | LAYING |      0.2810339 | ... |               -0.97548155 |

It meets tidy data principles as well as course project requirements.
