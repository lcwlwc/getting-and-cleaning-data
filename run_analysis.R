
install.packages("dplyr")
library(dplyr)

features<-read.table("./week3hw/features.txt",sep=",")
activity_labels<-read.table("./week3hw/activity_labels.txt",sep=",")


### Reading the training folder
### Not sure what does this table shows
    trainingset<-read.table("./week3hw/train/X_train.txt",sep=",")

### renaming the 6 activities       
    traininglabel<-read.table("./week3hw/train/Y_train.txt",sep=",")
    traininglabel[traininglabel == "1"] <- "Walking"
    traininglabel[traininglabel == "2"] <- "WalkingUpstairs"
    traininglabel[traininglabel == "3"] <- "WalkingDownstairs"
    traininglabel[traininglabel == "4"] <- "Sitting"
    traininglabel[traininglabel == "5"] <- "Standing"
    traininglabel[traininglabel == "6"] <- "Laying"

### Shows the id number of the volunteer
    subjecttrain<-read.table("./week3hw/train/subject_train.txt",sep=",", colClasses = "numeric")

### body_acc_x,y,z
    bodyaccXtrain <- read.table("./week3hw/train/Inertial Signals/body_acc_X_train.txt",sep=",")
    bodyaccYtrain <- read.table("./week3hw/train/Inertial Signals/body_acc_Y_train.txt",sep=",")
    bodyaccZtrain <- read.table("./week3hw/train/Inertial Signals/body_acc_Z_train.txt",sep=",")

### body_gyro_x,y,z
    bodygyroXtrain <- read.table("./week3hw/train/Inertial Signals/body_gyro_X_train.txt",sep=",")
    bodygyroYtrain <- read.table("./week3hw/train/Inertial Signals/body_gyro_Y_train.txt",sep=",")
    bodygyroZtrain <- read.table("./week3hw/train/Inertial Signals/body_gyro_Z_train.txt",sep=",")

### total_acc_x,y,z
    totalaccXtrain <- read.table("./week3hw/train/Inertial Signals/total_acc_X_train.txt",sep=",")
    totalaccYtrain <- read.table("./week3hw/train/Inertial Signals/total_acc_Y_train.txt",sep=",")
    totalaccZtrain <- read.table("./week3hw/train/Inertial Signals/total_acc_Z_train.txt",sep=",")


### reading the test file
### Shows the id number of the volunteer
    subjecttest<-read.table("./week3hw/test/subject_test.txt",sep=",", colClasses = "numeric")

### Not sure what does this table shows
    testset<-read.table("./week3hw/test/X_test.txt",sep=",")

### renaming the 6 activities       
    testlabel<-read.table("./week3hw/test/Y_test.txt",sep=",")
    testlabel[testlabel == "1"] <- "Walking"
    testlabel[testlabel == "2"] <- "WalkingUpstairs"
    testlabel[testlabel == "3"] <- "WalkingDownstairs"
    testlabel[testlabel == "4"] <- "Sitting"
    testlabel[testlabel == "5"] <- "Standing"
    testlabel[testlabel == "6"] <- "Laying"

### body_acc_x,y,z
    bodyaccXtest <- read.table("./week3hw/test/Inertial Signals/body_acc_X_test.txt",sep=",")
    bodyaccYtest <- read.table("./week3hw/test/Inertial Signals/body_acc_Y_test.txt",sep=",")
    bodyaccZtest <- read.table("./week3hw/test/Inertial Signals/body_acc_Z_test.txt",sep=",")

### body_gyro_x,y,z
    bodygyroXtest <- read.table("./week3hw/test/Inertial Signals/body_gyro_X_test.txt",sep=",")
    bodygyroYtest <- read.table("./week3hw/test/Inertial Signals/body_gyro_Y_test.txt",sep=",")
    bodygyroZtest <- read.table("./week3hw/test/Inertial Signals/body_gyro_Z_test.txt",sep=",")

### total_acc_x,y,z
    totalaccXtest <- read.table("./week3hw/test/Inertial Signals/total_acc_X_test.txt",sep=",")
    totalaccYtest <- read.table("./week3hw/test/Inertial Signals/total_acc_Y_test.txt",sep=",")
    totalaccZtest <- read.table("./week3hw/test/Inertial Signals/total_acc_Z_test.txt",sep=",")


### renaming the columns for the training section
    colnames(subjecttrain) <- "subjectID"
    colnames(traininglabel) <- "Activity"
    
    colnames(bodyaccXtrain) <- "bodyaccX"
    colnames(bodyaccYtrain) <- "bodyaccY"
    colnames(bodyaccZtrain) <- "bodyaccZ"
    
    colnames(bodygyroXtrain) <- "bodygyroX"
    colnames(bodygyroYtrain) <- "bodygyroY"
    colnames(bodygyroZtrain) <- "bodygyroZ"
    
    colnames(totalaccXtrain) <- "totalaccX"
    colnames(totalaccYtrain) <- "totalaccY"
    colnames(totalaccZtrain) <- "totalaccZ"

### renaming the columns for the test section
    colnames(subjecttest) <- "subjectID"
    colnames(testlabel) <- "Activity"
    
    colnames(bodyaccXtest) <- "bodyaccX"
    colnames(bodyaccYtest) <- "bodyaccY"
    colnames(bodyaccZtest) <- "bodyaccZ"
    
    colnames(bodygyroXtest) <- "bodygyroX"
    colnames(bodygyroYtest) <- "bodygyroY"
    colnames(bodygyroZtest) <- "bodygyroZ"
    
    colnames(totalaccXtest) <- "totalaccX"
    colnames(totalaccYtest) <- "totalaccY"
    colnames(totalaccZtest) <- "totalaccZ"

### combining the training columns
    combined1 <- cbind(subjecttrain, traininglabel) 
    combined2<-data.matrix(cbind(bodyaccXtrain, bodyaccYtrain, bodyaccZtrain))
    combined3<-data.matrix(cbind(bodygyroXtrain, bodygyroYtrain, bodygyroZtrain))
    combined4<-data.matrix(cbind(totalaccXtrain, totalaccYtrain, totalaccZtrain))
    combinedtraining<-cbind(combined1, combined2, combined3, combined4)

### combining the testing columns
    combined5 <- cbind(subjecttest, testlabel) 
    combined6<-data.matrix(cbind(bodyaccXtest, bodyaccYtest, bodyaccZtest))
    combined7<-data.matrix(cbind(bodygyroXtest, bodygyroYtest, bodygyroZtest))
    combined8<-data.matrix(cbind(totalaccXtest, totalaccYtest, totalaccZtest))
    combinedtest<-cbind(combined5, combined6, combined7, combined8)

### combine both training and test
    combined <- rbind(combinedtraining, combinedtest)

### calcuating the mean for each column, treating all subjects as one group
    means = matrix(1:11, nrow=1, ncol=11)
      for (i in 3:11){
          means[1,i] = mean(combined[,i])
          }

colnames(means)<-c("meansubjectID", "meanActivity", "meanbodyaccX", 
"meanbodyaccY", "meanbodyaccZ", "meanbodygyroX", "meanbodygyroY", 
"meanbodygyroZ", "meantotalaccX", "meantotalaccY", "meantotalaccZ")

### calcuating the standard deviation for each column, treating all subjects as one group
    Standarddeviation = means = matrix(1:11, nrow=1, ncol=11)
        for (i in 3:11){
          Standarddeviation[1,i] = sd(combined[,i])
        }

colnames(Standarddeviation)<-c("sdsubjectID", "sdActivity", "sdbodyaccX", 
"sdbodyaccY", "sdbodyaccZ", "sdbodygyroX", "sdbodygyroY", 
"sdbodygyroZ", "sdtotalaccX", "sdtotalaccY", "sdtotalaccZ")

#Loading combined into a df under dplyr
  combinedv2<-tbl_df(combined)

#Grouping the df by subjectID and activity
  combinedgrouped<-group_by(combinedv2, subjectID, Activity)

#Calculating the mean for each activty
  mean_byID_byactivity<-summarize(combinedgrouped, mean(bodyaccX), mean(bodyaccY), mean(bodyaccZ),
                mean(bodygyroX), mean(bodygyroY), mean(bodygyroZ),
                mean(totalaccX), mean(totalaccY),  mean(totalaccZ))


#Renaming the columns to show the units for each measurement
  colnames(mean_byID_byactivity)<-c("subjectID", "Activity",
  "mean(bodyaccX) (g)", "mean(bodyaccY) (g)", "mean(bodyaccZ) (g)",
  "mean(bodygyroX) (rad/s)", "mean(bodygyroY) (rad/s)", "mean(bodygyroZ) (rad/s)",
  "mean(totalaccX) (g)", "mean(totalaccY) (g)", "mean(totalaccZ) (g)"
  )


  print(mean_byID_byactivity)
