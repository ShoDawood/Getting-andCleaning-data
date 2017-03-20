x_train <- read.csv("./train/X_train.txt",header=FALSE,sep="")
y_train <- read.csv("./train/y_train.txt",header=FALSE)
sub_train <- read.csv("./train/subject_train.txt",header=FALSE)

## read Test data
x_test <- read.csv("./test/X_test.txt",header=FALSE,sep="")
y_test <- read.csv("./test/y_test.txt",header=FALSE)
sub_test <- read.csv("./test/subject_test.txt",header=FALSE)


##Combining data from x and y
x_combind <-rbind(x_train,x_test)
y_combind <-rbind(y_train,y_test)
sub_combind <-rbind(sub_train,sub_test)

## Read features only containing mean or standard deviation 
reqxvalues <- x_combind[, grep("-(mean|std)\\(\\)", read.table("features.txt")[, 2])]

## Assign column names to X values
names(reqxvalues) <- read.table("features.txt")[grep("-(mean|std)\\(\\)", read.table("features.txt")[, 2]), 2] 

## Assign column names to Y values
y_combind[, 1] <- read.table("activity_labels.txt")[y_combind[, 1], 2]
names(y_combind) <- "Activity"

names(sub_combind) <- "Subject"


## Combine X values, Y values and Subject data
combinedall <- cbind(reqxvalues, y_combind, sub_combind)


## Calculate means for subject and Activity
tidydata<-aggregate(. ~Subject + Activity, combinedall, mean)

## Write tidy data to tidy file
write.table(tidydata, file = "tidydata.txt",row.name=FALSE)
