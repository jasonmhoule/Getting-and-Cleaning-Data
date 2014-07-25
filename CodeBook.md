CodeBook
=================

The features given in the tidy dataset produced by run_analysis.R are mean
values of multiple experimental measurements. The experiments were carried out
by the group from DITEN cited in README.md. The subjects are a group of 30
volunteers within an age bracket of 19-48 years. Each person performed six
activities (WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING,
LAYING) wearing a smartphone (Samsung Galaxy S II) on the waist. Using its
embedded accelerometer and gyroscope, the DITEN team captured 3-axial linear
acceleration and 3-axial angular velocity at a constant rate of 50Hz.

From the accelerometer and gyroscope come 3-axial raw signals tAcc-XYZ and
tGyro-XYZ. These time domain signals (prefix 't' to denote time) were captured
at a constant rate of 50 Hz. Then they were filtered using a median filter and
a 3rd order low pass Butterworth filter with a corner frequency of 20 Hz to
remove noise. Similarly, the acceleration signal was then separated into body
and gravity acceleration signals (tBodyAcc-XYZ and tGravityAcc-XYZ) using
another low pass Butterworth filter with a corner frequency of 0.3 Hz.

Subsequently, the body linear acceleration and angular velocity were derived in
time to obtain Jerk signals (tBodyAccJerk-XYZ and tBodyGyroJerk-XYZ). Also the
magnitude of these three-dimensional signals were calculated using the Euclidean
norm (tBodyAccMag, tGravityAccMag, tBodyAccJerkMag, tBodyGyroMag, tBodyGyroJerkMag). 

A Fast Fourier Transform (FFT) was applied to some of these signals producing
fBodyGyro-XYZ.

These signals were used to estimate variables of the feature vector for each
pattern: '-XYZ' is used to denote 3-axial signals in the X, Y and Z directions.

tBodyAcc-XYZ
tGravityAcc-XYZ
tBodyGyro-XYZ

The mean and standard deviation of these 9 values were reported for each sample
by the DITEN team in the raw dataset. The mean of each of these 18 measures was
calculated over all samples for each subject-activity pairing, and these are
reported in the dataset (along with the Subject identifier from the raw dataset
and the Activity from the above list.)