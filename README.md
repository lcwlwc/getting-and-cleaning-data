# getting-and-cleaning-data
The repo is for the course project under Getting and Cleaning data module

Raw data: https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip 

Packages installed in r: dplyr

Background
The raw data is a set of measurements on a group of 30 volunteers within an age bracket of 19-48 years. Each person performed six activities (WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING, LAYING) wearing a smartphone (Samsung Galaxy S II) on the waist. Using its embedded accelerometer and gyroscope, we captured 3-axial linear acceleration and 3-axial angular velocity at a constant rate of 50Hz. The experiments have been video-recorded to label the data manually. 
The obtained dataset has been randomly partitioned into two sets, where 70% of the volunteers was selected for generating the training data and 30% the test data. 

Column headers
subjectID: Each volunteer individual ID number (between 1 -30 inclusive)

Activity: Six different activities from which the measurements were taken:
1.	Walking  (Activity label 1 is walking)

2.	Walkingupstairs

3.	Walkingdownstairs

4.	Sitting

5.  Standing

6.	Laying

total_acc_x (Y or Z): The acceleration signal from the smartphone accelerometer X axis in standard gravity units ‘g’.

body_acc_X (Y or Z):  The body acceleration signal obtained by subtracting the gravity from the total acceleration.

body_gyro_X (Y or Z): The angular velocity vector measured by the gyroscope for each sample. The units are radians/second.

Mean(xxx): The average values of all xxx measurements.
