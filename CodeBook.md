## CodeBook, A summarised tidy dataset from a Smartphones Dataset.

# Study Design

This section describes the the Smartphones Dataset and how it had been collected. It is followed by the Code Book section which
describes the transformations applied to the Smartphones Dataset and the resulting tidy data set variables. 

The data source is a Human Activity Recognition database built from the recordings of 30 subjects performing activities of daily
living (ADL) while carrying a waist-mounted smartphone with embedded inertial sensors. A full description is available at the site
where the data was obtained:

http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones

The data source link is:  https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip

The data used had been collected from the accelerometers from the Samsung Galaxy S smartphone. Experiments had been carried out with
a group of 30 volunteers within an age bracket of 19-48 years. Each person performed six activities (WALKING, WALKING_UPSTAIRS,
WALKING_DOWNSTAIRS, SITTING, STANDING, LAYING) wearing a smartphone (Samsung Galaxy S II) on the waist. Using its embedded
accelerometer and gyroscope, 3-axial linear acceleration and 3-axial angular velocity at a constant rate of 50Hz were captured. The
experiments had been video-recorded to label the data manually. The obtained dataset had been randomly partitioned into two sets,
where 70% of the volunteers was selected for generating the training data and 30% the test data. 

The sensor signals (accelerometer and gyroscope) were pre-processed by applying noise filters and then sampled in fixed-width sliding
windows of 2.56 sec and 50% overlap (128 readings/window). The sensor acceleration signal, which has gravitational and body motion
components, was separated using a Butterworth low-pass filter into body acceleration and gravity. The gravitational force is assumed
to have only low frequency components, therefore a filter with 0.3 Hz cutoff frequency was used. From each window, a vector of
features was obtained by calculating variables from the time and frequency domain. 

##### For each record it was provided:

* Triaxial acceleration from the accelerometer (total acceleration) and the estimated body acceleration.
* Triaxial Angular velocity from the gyroscope. 
* A 561-feature vector with time and frequency domain variables. 
* Its activity label. 
* An identifier of the subject who carried out the experiment.

##### The dataset included the following files:

* 'README.txt'
* 'features_info.txt': Shows information about the variables used on the feature vector.
* 'features.txt': List of all features.
* 'activity_labels.txt': Links the class labels with their activity name.
* 'train/X_train.txt': Training set.
* 'train/y_train.txt': Training labels.
* 'test/X_test.txt': Test set.
* 'test/y_test.txt': Test labels.

##### The following files were available for the train and test data. Their descriptions are equivalent. 

* 'train/subject_train.txt': Each row identifies the subject who performed the activity for each window sample.
	Its range is from 1 to 30. 

* 'train/Inertial Signals/total_acc_x_train.txt': The acceleration signal from the smartphone accelerometer X axis
	in standard gravity units 'g'.

*  Every row shows a 128 element vector. The same description applies for the 'total_acc_x_train.txt' and 'total_acc_z_train.txt'
	files for the Y and Z axis. 

* 'train/Inertial Signals/body_acc_x_train.txt': The body acceleration signal obtained by subtracting the gravity from the
	total acceleration. 

* 'train/Inertial Signals/body_gyro_x_train.txt': The angular velocity vector measured by the gyroscope for each window sample.
	The units are radians/second. 

Notes: 
- Features were normalized and bounded within [-1,1] ... therefore there are no units 
- Each feature vector was a row on the text file.

### Feature Selection for the Smartphones Dataset

The features selected for this database came from the accelerometer and gyroscope 3-axial raw signals tAcc-XYZ and tGyro-XYZ.
These time domain signals (prefix 't' to denote time) were captured at a constant rate of 50 Hz. Then they were filtered using
a median filter and a 3rd order low pass Butterworth filter with a corner frequency of 20 Hz to remove noise.
Similarly, the acceleration signal was then separated into body and gravity acceleration signals (tBodyAcc-XYZ and tGravityAcc-XYZ)
using another low pass Butterworth filter with a corner frequency of 0.3 Hz. 

Subsequently, the body linear acceleration and angular velocity were derived in time to obtain Jerk signals (tBodyAccJerk-XYZ and
tBodyGyroJerk-XYZ). Also the magnitude of these three-dimensional signals were calculated using the Euclidean norm (tBodyAccMag,
tGravityAccMag, tBodyAccJerkMag, tBodyGyroMag, tBodyGyroJerkMag). 
Finally a Fast Fourier Transform (FFT) was applied to some of these signals producing fBodyAcc-XYZ, fBodyAccJerk-XYZ, fBodyGyro-XYZ,
fBodyAccJerkMag, fBodyGyroMag, fBodyGyroJerkMag. (Note the 'f' to indicate frequency domain signals). 

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

# Code Book

This section describes the transformations and summaries applied to the Smartphones data set above.
Then it describes each variable in the tidy data set produced as a result of those transformations and summaries.
README.md describes how the run_analysis.R script that performs these tasks works.

## Transformations

The R script called run_analysis.R does the following:

1. Appropriately labels the data set with descriptive variable names.
All the columns of the tables from X_train.txt and X_test.txt were named using the feature table from features.txt for variable names.
This automatically produced legal, unique, descriptive names (see Variables, below).

2. Extracts only the measurements on the mean and standard deviation for each measurement.
This was done on the tables from X_train.txt and X_test.txt after step 1 above, by column indexing.

3. Uses descriptive activity names to name the activities in the data set
Number codes of the y_test.txt and y_train.txt tables were converted into activity labels using the activity_labels.txt table.

4. Merges the training and the test sets to create one data set.
The appropriate subject number from subject_train.txt and subject_test.txt tables and the y activity labels formed from the step 3 above,
were joined as columns at the front of the X train and X test tables formed in step 2 above, to form Subject and Activity variable columns.
Then the resulting test data frame was was joined to the bottom of the resulting train data frame and rows were ordered by Subject then Activity.

5. From this, creates a second, independent tidy data set with the average of each variable for each activity and each subject.
The data frame from step 4 was converted to a summary table where the column variables represent the means of their values grouped by the
Subject and Activity columns.

(see README.md for specific details)

## Variables

There are 88 variables (columns) and 180 rows in the table produced by the run_analysis.R script.
The variables are presented here in order starting at column 1.

Apart from Activity and Subject, the variable names were inherited from the Smartphones Dataset features table (features.txt) and
were automatically converted to legal, unique, descriptive variable names by the naming process.

There are no units for the quantitative variables below as all the feature values of the data that was summarised, the Smartphones Dataset,
had been normalized and bounded within [-1,1]. 

|col| VARIABLE | DESCRIPTION |
|---|----------|-------------|
|1|Subject |id number of the volunteer |
| | | 1 .. 30|
| | | |
|2|Activity|descriptive activity names to name the activities in the data set:|
| | | WALKING|			
| | | WALKING_UPSTAIRS|			
| | | WALKING_DOWNSTAIRS|			
| | | SITTING|			
| | | STANDING|			
| | | LAYING|			
| | | |
|3|tBodyAcc.mean...X| |
|4|tBodyAcc.mean...Y|the means of tBodyAcc-mean() X,Y and Z respectively, grouped by Subject and Activity|
|5|tBodyAcc.mean...Z| |
|| | |
|6|tBodyAcc.std...X| |
|7|tBodyAcc.std...Y|the means of tBodyAcc-std() X,Y and Z respectively, grouped by Subject and Activity|
|8|tBodyAcc.std...Z| |
| | | |					
|9|tGravityAcc.mean...X| |
|10|tGravityAcc.mean...Y|the means of tGravityAcc-mean() X,Y and Z respectively, grouped by Subject and Activity|
|11|tGravityAcc.mean...Z| |
| | | |					
|12|tGravityAcc.std...X| |
|13|tGravityAcc.std...Y|the means of tGravityAcc-std() X,Y and Z respectively, grouped by Subject and Activity|
|14|tGravityAcc.std...Z| |
| | | |					
|15|tBodyAccJerk.mean...X| |
|16|tBodyAccJerk.mean...Y|the means of tBodyAccJerk-mean() X,Y and Z respectively, grouped by Subject and Activity|
|17|tBodyAccJerk.mean...Z| |
| | | |					
|18|tBodyAccJerk.std...X| |
|19|tBodyAccJerk.std...Y|the means of tBodyAccJerk-std() X,Y and Z respectively, grouped by Subject and Activity|
|20|tBodyAccJerk.std...Z| |
| | | |					
|21|tBodyGyro.mean...X| |
|22|tBodyGyro.mean...Y|the means of tBodyGyro-mean() X,Y and Z respectively, grouped by Subject and Activity|
|23|tBodyGyro.mean...Z| |
| | | |					
|24|tBodyGyro.std...X| |
|25|tBodyGyro.std...Y|the means of tBodyGyro-std()) X,Y and Z respectively, grouped by Subject and Activity|
|26|tBodyGyro.std...Z| |
| | | |
|27|tBodyGyroJerk.mean...X| |
|28|tBodyGyroJerk.mean...Y|the means of tBodyGyroJerk-mean() X,Y and Z respectively, grouped by Subject and Activity|
|29|tBodyGyroJerk.mean...Z| |
| | | |					
|30|tBodyGyroJerk.std...X| |
|31|tBodyGyroJerk.std...Y|the means of tBodyGyroJerk-std() X,Y and Z respectively, grouped by Subject and Activity|
|32|tBodyGyroJerk.std...Z| |
| | | |					
|33|tBodyAccMag.mean..|the means of tBodyAccMag-mean() grouped by Subject and Activity|
|34|tBodyAccMag.std..|the means of tBodyAccMag-std() grouped by Subject and Activity|
|35|tGravityAccMag.mean..|the means of tGravityAccMag-mean() grouped by Subject and Activity|
|36|tGravityAccMag.std..|the means of tGravityAccMag-std() grouped by Subject and Activity|
|37|tBodyAccJerkMag.mean..|the means of tBodyAccJerkMag-mean() grouped by Subject and Activity|
|38|tBodyAccJerkMag.std..|the means of tBodyAccJerkMag-std() grouped by Subject and Activity|
|39|tBodyGyroMag.mean..|the means of tBodyGyroMag-mean() grouped by Subject and Activity|
|40|tBodyGyroMag.std..|the means of tBodyGyroMag-std() grouped by Subject and Activity|
|41|tBodyGyroJerkMag.mean..|the means of tBodyGyroJerkMag-mean() grouped by Subject and Activity|
|42|tBodyGyroJerkMag.std..|the means of tBodyGyroJerkMag-std() grouped by Subject and Activity|
| | | |					
|43|fBodyAcc.mean...X| |
|44|fBodyAcc.mean...Y|the means of fBodyAcc-mean() X,Y and Z respectively, grouped by Subject and Activity|
|45|fBodyAcc.mean...Z| |
| | | |					
|46|fBodyAcc.std...X| |
|47|fBodyAcc.std...Y|the means of fBodyAcc-std() X,Y and Z respectively, grouped by Subject and Activity|
|48|fBodyAcc.std...Z| |
| | | |					
|49|fBodyAcc.meanFreq...X| |
|50|fBodyAcc.meanFreq...Y|the means of fBodyAcc-meanFreq() X,Y and Z respectively, grouped by Subject and Activity|
|51|fBodyAcc.meanFreq...Z| |
| | | |					
|52|fBodyAccJerk.mean...X| |
|53|fBodyAccJerk.mean...Y|the means of fBodyAccJerk-mean() X,Y and Z respectively, grouped by Subject and Activity|
|54|fBodyAccJerk.mean...Z| |
| | | |					
|55|fBodyAccJerk.std...X| |
|56|fBodyAccJerk.std...Y|the means of fBodyAccJerk-std() X,Y and Z respectively, grouped by Subject and Activity|
|57|fBodyAccJerk.std...Z| |
| | | |					
|58|fBodyAccJerk.meanFreq...X| |
|59|fBodyAccJerk.meanFreq...Y|the means of fBodyAccJerk-meanFreq() X,Y and Z respectively, grouped by Subject and Activity|
|60|fBodyAccJerk.meanFreq...Z| |
| | | |					
|61|fBodyGyro.mean...X| |
|62|fBodyGyro.mean...Y|the means of fBodyGyro-mean() X,Y and Z respectively, grouped by Subject and Activity|
|63|fBodyGyro.mean...Z| |
| | | |					
|64|fBodyGyro.std...X| |
|65|fBodyGyro.std...Y|the means of fBodyGyro-std() X,Y and Z respectively, grouped by Subject and Activity|
|66|fBodyGyro.std...Z| |
| | | |					
|67|fBodyGyro.meanFreq...X| |
|68|fBodyGyro.meanFreq...Y|the means of fBodyGyro-meanFreq() X,Y and Z respectively, grouped by Subject and Activity|
|69|fBodyGyro.meanFreq...Z| |
| | | |					
|70|fBodyAccMag.mean..|the means of fBodyAccMag-mean() grouped by Subject and Activity|
|71|fBodyAccMag.std..|the means of fBodyAccMag-std() grouped by Subject and Activity|
|72|fBodyAccMag.meanFreq..|the means of fBodyAccMag-meanFreq() grouped by Subject and Activity|
|73|fBodyBodyAccJerkMag.mean..|the means of fBodyBodyAccJerkMag-mean() grouped by Subject and Activity|
|74|fBodyBodyAccJerkMag.std..|the means of fBodyBodyAccJerkMag-std() grouped by Subject and Activity|
|75|fBodyBodyAccJerkMag.meanFreq..|the means of fBodyBodyAccJerkMag-meanFreq() grouped by Subject and Activity|
|76|fBodyBodyGyroMag.mean..|the means of fBodyBodyGyroMag-mean() grouped by Subject and Activity|
|77|fBodyBodyGyroMag.std..|the means of fBodyBodyGyroMag-std() grouped by Subject and Activity|
|78|fBodyBodyGyroMag.meanFreq..|the means of fBodyBodyGyroMag-meanFreq() grouped by Subject and Activity|
|79|fBodyBodyGyroJerkMag.mean..|the means of fBodyBodyGyroJerkMag-mean() grouped by Subject and Activity|
|80|fBodyBodyGyroJerkMag.std..|the means of fBodyBodyGyroJerkMag-std() grouped by Subject and Activity|
|81|fBodyBodyGyroJerkMag.meanFreq..|the means of fBodyBodyGyroJerkMag-meanFreq() grouped by Subject and Activity|
|82|angle.tBodyAccMean.gravity.|the means of angle(tBodyAccMean,gravity) grouped by Subject and Activity|
|83|angle.tBodyAccJerkMean..gravityMean.|the means of angle(tBodyAccJerkMean),gravityMean) grouped by Subject and Activity|
|84|angle.tBodyGyroMean.gravityMean.|the means of angle(tBodyGyroMean,gravityMean) grouped by Subject and Activity|
|85|angle.tBodyGyroJerkMean.gravityMean.|the means of angle(tBodyGyroJerkMean,gravityMean) grouped by Subject and Activity|
|86|angle.X.gravityMean.|the means of angle(X,gravityMean) grouped by Subject and Activity|
|87|angle.Y.gravityMean.|the means of angle(Y,gravityMean) grouped by Subject and Activity|
|88|angle.Z.gravityMean.|the means of angle(Z,gravityMean) grouped by Subject and Activity|
					
