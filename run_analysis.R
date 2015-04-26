dbActivities_test <- read.table("y_test.txt", header=FALSE)
dbActivities_train <- read.table("y_train.txt",header=FALSE)
dbActivities_test$V1 <- mapvalues(dbActivities_test$V1, from = c("1", "2", "3", "4", "5", "6"), to = c("Walking", "Walking Upstairs", "Walking Downstairs","Sitting","Standing","Laying"))
dbActivities_train$V1 <- mapvalues(dbActivities_train$V1, from = c("1", "2", "3", "4", "5", "6"), to = c("Walking", "Walking Upstairs", "Walking Downstairs","Sitting","Standing","Laying"))

dbSubject_test <- read.table("subject_test.txt", header=FALSE)
dbSubject_train <- read.table("subject_train.txt",header=FALSE)


dbFeatures <- read.table("features.txt", header=FALSE)


db_test <- read.table("X_test.txt", header=FALSE)
colnames(db_test) <- dbFeatures [,2]
db_test$activity <- dbActivities_test[,1]
db_test$person <- dbSubject_test[,1]


db_train <- read.table("X_train.txt", header=FALSE)
colnames(db_train) <- dbFeatures [,2]
db_train$activity <- dbActivities_train[,1]
db_train$person <- dbSubject_train[,1]

MergedDB <- rbind(db_test, db_train)

string <- grep("mean()",dbFeatures[,2],value=T,fixed = TRUE)
string2 <- grep("std()",dbFeatures[,2],value=T, fixed = TRUE)
string3 <- "activity"
string4 <- "person"
stringN <- c(string3, string4, string, string2)

compactMergedDB <- MergedDB[stringN]

names(compactMergedDB) <- c("activity","person", 1:66)

library(dplyr)

jev <- group_by(compactMergedDB, activity, person) %>% summarise_each(funs(mean))
write.table(jev, "myTable.txt", sep="\t", row.name=FALSE)
