fUrl<-"https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip"
download.file(fUrl,destfile = "./Data.zip")
unzip("Data.zip")
 X_train<-read.table("UCI HAR Dataset/train/X_train.txt")
 y_train<-read.table("UCI HAR Dataset/train/y_train.txt")
 subject_train<-read.table("UCI HAR Dataset/train/subject_train.txt")
 X_test<-read.table("UCI HAR Dataset/test/X_test.txt")
 y_test<-read.table("UCI HAR Dataset/test/y_test.txt")
 subject_test<-read.table("UCI HAR Dataset/test/subject_test.txt")
Xdata<-rbind(X_test,X_train)
Ydata<-rbind(y_test,y_train)
subjectdata<-rbind(subject_test,subject_train)
features<-read.table("UCI HAR Dataset/features.txt")
activity<-read.table("UCI HAR Dataset/activity_labels.txt")
nombres<-grep("mean|std",features$V2)
Xdata<-Xdata[,names]
data<-cbind(subjectdata,Ydata,Xdata)
names(data)<-c("subject","activity",features[nombres,2])
data$activity<-factor(data$activity,levels = activity$V1,labels = activity$V2)
library(reshape2)
data$subject<-as.factor(data$subject)
mdata<-melt(data,id=c("subject","activity"))
tdata<-dcast(mdata,subject+activity~variable,mean)
write.table(tdata,"./tidy_dataset.txt",row.names = FALSE,quote=FALSE)

