run_analysis <- function() {
    ## Assuming data is unzipped so that 'UCI HAR Dataset' folder is in wd
    if(!file.exists("./UCI HAR Dataset")) {
        stop("'UCI HAR Dataset' folder not in working directory.")
    }
        
    ## Read the 'features' labels for the measurements (meets requirement #4)
    features.table <- read.table("./UCI HAR Dataset/features.txt")
    features <- features.table[,2]
    
    ## Read in the training and test sets
    x_train <- read.table("./UCI HAR Dataset/train/X_train.txt",
                          col.names=features)
    y_train <- read.table("./UCI HAR Dataset/train/Y_train.txt",
                          col.names="Activity")
    sub_train <- read.table("./UCI HAR Dataset/train/subject_train.txt",
                            col.names="Subject")
    x_test <- read.table("./UCI HAR Dataset/test/X_test.txt",
                         col.names=features)
    y_test <- read.table("./UCI HAR Dataset/test/Y_test.txt",
                         col.names="Activity")
    sub_test <- read.table("./UCI HAR Dataset/test/subject_test.txt",
                           col.names="Subject")
        
    ## Build the test and train sets separately
    df_test <- data.frame(sub_test,y_test,x_test)
    df_train <- data.frame(sub_train,y_train,x_train)
    
    ## 'Merge' the sets by combining into one (meets requirement #1)
    full_set <- rbind(df_train,df_test)
    
    ## Select only the columns for means and stds (meets requirement #2)
    ## Create a vector with column indicies for mean, std measures
    ## NOTE: From features_info.txt, 'measurements' is understood to be :
    ##  tBodyAcc-XYZ
    ##  tGravityAcc-XYZ
    ##  tBodyGyro-XYZ
    ## The remaining data points are calculated/derived, not measured.
    
    indices <- c(1:6,41:46,121:126)+2
    extract <- full_set[,c(1,2,indices)]
    
    ## Substitute names for the activities instead of numbers (meets req #3)
    activity_labels <- read.table("./UCI HAR Dataset/activity_labels.txt",
                                  header=FALSE)[,2]
    extract$Activity <- activity_labels[extract$Activity]
        
    ## Create a second, tidy data set with the average of each variable
    ## for each activity-subject combination (meets requirement #5)
    library("reshape2")
    melted <- melt(extract,id.vars=c("Subject","Activity"))
    casted <- dcast(melted, Subject + Activity ~ variable,mean)
}