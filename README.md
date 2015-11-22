x_test = read.table("X_test.txt")
x_train = read.table("X_train.txt")
x_test_train<-rbind(x_test,x_train) # rowbinds the x_test and x_train df's # 561 columns wide

y_test = read.table("y_test.txt")
y_train = read.table("y_train.txt")
y_test_train<-rbind(y_test,y_train) # rowbids the y_test and y_train df's# 1 column wide

subject_test = read.table("subject_test.txt")
subject_train = read.table("subject_train.txt")
subject_test_train<-rbind(subject_test,subject_train) # rowbinds subject_test and subject_train # 1 column wide

total<-cbind(x_test_train,y_test_train,subject_test_train) # column binds all above data frames to achieve a unified df #total has 563 columns

#2---------------------------
features = read.table("features.txt") #reads the contents into a df

x<-as.character(features$V2) #stores values of column v2 into a vector
colnames(total)[1:561]<-x #vector 'x' assigns column names to df 'total'
colnames(total)[562]<-"Activity" #assignment of column name
colnames(total)[563]<-"Subject" #assignment of column name

mean_stdev<-total[,grep("mean\\(\\)|std\\(\\)", colnames(total))] #grabs columns that have mean() or std() in their respective names

#3---------------------------
activity_names<-read.table("activity_labels.txt")

colnames(activity_names)<-c("Activity","Name") #Renaming the name of column of df activity_name as "Activity" so it matches the same column in df = total.
Total1<-merge(total,activity_names, by=c("Activity"))#Creating a new DF total1, with the merged col. Total 1 has 564 cols.

#4----------------

#install.packages("plyr") #this function was not used eventually in this problem
#library(plyr)
#test<-rename(activity_names,c())

names(Total1)<-sub("^t","time_",names(Total1)) #replaces t in the beginning with time_
names(Total1)<-sub("^f","frequency_",names(Total1)) #replcaes f with frequency_

#5 ------------------------------

install.packages("dplyr")
library(dplyr)
tidyset<-group_by(Total,Activity,Subject) #creates a new df with grouping by activity and subject
View(summarise_each(tidyset,funs(mean))) #calculates mean of each column in the tidyset df
write.table(tidyset)
