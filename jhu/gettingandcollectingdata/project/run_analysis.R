install.packages("reshape2")

library(reshape2)

#load data into tables
subject_test <- read.table("test/subject_test.txt")
X_test <- read.table("test/X_test.txt")
y_test <- read.table("test/y_test.txt")
subject_train <- read.table("train/subject_train.txt")
X_train <- read.table("train/X_train.txt")
y_train <- read.table("train/y_train.txt")
activity_labels <- read.table("activity_labels.txt")
features <- read.table("features.txt")

#select only mean and std headers
mean_and_std <- grepl("mean\\(\\)|std\\(\\)", features[,2])

#assign column names from  features
names(X_test) <- features[,2]
names(X_train) <- features[,2]

#filter mean and std columns on test and train
test_mean_and_std <- X_test[,mean_and_std]
train_mean_and_std <- X_train[,mean_and_std]

#merge all test and train rows
subject_all <- rbind(subject_test, subject_train)
X_all <- rbind(test_mean_and_std, train_mean_and_std)
y_all <- rbind(y_test, y_train)

#combine all vectors/data.frames into one data.frame
merged <- cbind(subject_all, y_all, X_all)
names(merged)[1] <- "SubjectID"
names(merged)[2] <- "Activity"

#aggregate by subjectid and activity
agg <- aggregate(. ~ SubjectID + Activity, data=merged, FUN = mean)

#give activities better names
agg$Activity <- factor(agg$Activity, labels=activity_labels[,2])

write.table(agg, file="./tidydata.txt", sep="\t", row.names=FALSE)
