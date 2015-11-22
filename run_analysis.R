getwd()
setwd("/Users/Manasvi/Downloads/UCI HAR Dataset")
getwd()
x_test = read.table("X_test.txt")
x_train = read.table("X_train.txt")
x_test_train<-rbind(x_test,x_train) #561 columns wide

y_test = read.table("y_test.txt")
y_train = read.table("y_train.txt")
y_test_train<-rbind(y_test,y_train) # 1 column wide

subject_test = read.table("subject_test.txt")
subject_train = read.table("subject_train.txt")
subject_test_train<-rbind(subject_test,subject_train) #1 column wide

total<-cbind(x_test_train,y_test_train,subject_test_train) #total has 563 columns

#2---------------------------
features = read.table("features.txt")

x<-as.character(features$V2)
colnames(total)[1:561]<-x
colnames(total)[562]<-"Activity"
colnames(total)[563]<-"Subject"

mean_stdev<-total[,grep("mean\\(\\)|std\\(\\)", colnames(total))]

#3---------------------------
activity_names<-read.table("activity_labels.txt")

colnames(activity_names)<-c("Activity","Name") #Renaming the name of column of df activity_name as "Activity" so it maches the same column in df = total.
Total1<-merge(total,activity_names, by=c("Activity"))#Creating a new DF total1, with the merged col. Total 1 has 564 cols.

#4

#install.packages("plyr") #this function was not used eventually in this problem
#library(plyr)
#test<-rename(activity_names,c())

names(Total1)<-sub("^t","time_",names(Total1)) #replaces t in the beginning with time_
names(Total1)<-sub("^f","frequency_",names(Total1)) #replcaes f with frequency_

#5 ------------------------------

install.packages("dplyr")
library(dplyr)
tidyset<-group_by(Total,Activity,Subject)
View(summarise_each(tidyset,funs(mean)))
write.table(tidyset,"MyAssignment.txt",row.name = FALSE)
