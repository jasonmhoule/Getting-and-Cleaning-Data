==================================================================
Human Activity Recognition Using Smartphones
Tidy Dataset for Coursera's "Getting and Cleaning Data" Course
==================================================================
Jason Houle
==================================================================
Credit for source data:
Jorge L. Reyes-Ortiz, Davide Anguita, Alessandro Ghio, Luca Oneto.
Smartlab - Non Linear Complex Systems Laboratory
DITEN - Università degli Studi di Genova.
Via Opera Pia 11A, I-16145, Genoa, Italy.
activityrecognition@smartlab.ws
www.smartlab.ws
==================================================================

Source and Credit:
This repository includes an R script, run_analysis.R, submitted in response to
the Course Project for Coursera's "Getting and Cleaning Data" course of July,
2014. A codebook ("CodeBook.md") is also included.

All data are established with reference to the source data:

https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip

The source data were obtained at the following site:

http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones

Credit for the source data belongs to Reyes-Ortiz, et al., at DITEN (see above)

==================================================================

Readme
The script 'run_analysis.R' can be run as long as the source data is in the
working directory. The script is well-commented and may be directly followed;
however, the steps taken are described here at a high level. Details on the
interpretation of variables may be found in the readme and codebook packaged
with the source data.

0. The script requires that directory 'UCI HAR Datasets' has been unzipped and
   is located in the working directory.
1. The script takes no arguments. 
2. The script reads the 'test' and 'train' data in.
3. The script builds two data frames, one for each data set, then combines
   these into one full set.
4. The script extracts only those values that represent means and standard
   deviations of the measurements* taken by the accelerometer and gyroscope.
5. Activity labels are loaded and substituted for activity numbers.
6. Using the 'melt' and 'dcast' functions in the reshape2 package, the script
   determines the average of each measurement value for each subject-activity
   pairing, and returns this in a tidy data set.
   
The resulting data set is 180 observations, one for each activity-subject
pairing (there are 6 activities and 30 subjects).

*Note: many other mean/std data points are provided in the source data, but
these are calculated/derived, not measured.

OUTPUT: For each record it is provided:
======================================

- The means of the following over all sample records for each activity-subject
  pairing:
  - Mean triaxial acceleration from the accelerometer (total acceleration) in
    each the X, Y, and Z directions.
  - Standard deviation triaxial acceleration from the accelerometer (total
    acceleration) in each the X, Y, and Z directions.
  - Mean estimated body acceleration in each the X, Y, and Z directions.
  - Standard deviation estimated body acceleration in each the X, Y, and Z
    directions.
  - Mean triaxial angular velocity from the gyroscope in each the X, Y, and Z
    directions.
  - Standard deviation triaxial angular velocity from the gyroscope in each the
    X, Y, and Z directions.
- Its activity label. 
- An identifier of the subject who carried out the experiment.