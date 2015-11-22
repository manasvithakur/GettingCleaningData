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

total$Activity[total$Activity==1]<- "WALKING"
total$Activity[total$Activity==2]<- "WALKING_UPSTAIRS"
total$Activity[total$Activity==3]<- "WALKING_DOWNSTAIRS"
total$Activity[total$Activity==4]<- "SITTING"
total$Activity[total$Activity==5]<- "STANDING"
total$Activity[total$Activity==6]<- "LAYING"

#4----------------

names(total)<-sub("^t","time_",names(total)) #replaces t in the beginning with time_
names(total)<-sub("^f","frequency_",names(total)) #replcaes f with frequency_

#5 ------------------------------

install.packages("dplyr")
library(dplyr)
tidyset<-group_by(total,Activity,Subject)
View(summarise_each(tidyset,funs(mean)))
write.table(tidyset,"MyAssignment.txt",row.name = FALSE)
