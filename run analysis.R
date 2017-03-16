dataFolder <- "./UCI HAR Dataset/"
trainFolder <- "./UCI HAR Dataset/train/"
testFolder <- "./UCI HAR Dataset/test/"
features <- t(read.table(paste(dataFolder,"features.txt",sep="")))
activity_labels <- read.table(paste(dataFolder,"activity_labels.txt",sep=""))
X_train_data = (read.table(paste(trainFolder,"X_train.txt",sep="")))
train_label = (read.table(paste(trainFolder,"y_train.txt",sep="")))
subject_train <- read.table(paste(trainFolder,"subject_train.txt",sep=""))

X_test_data = (read.table(paste(testFolder,"X_test.txt",sep="")))
test_label = (read.table(paste(testFolder,"y_test.txt",sep="")))
subject_test <- read.table(paste(testFolder,"subject_test.txt",sep=""))

X_data = rbind(X_train_data, X_test_data)
xlabel = rbind(train_label, test_label)
subject <- rbind(subject_train, subject_test)

rm(X_test_data)
rm(X_train_data)
rm(train_label)
rm(test_label)
rm(subject_train)
rm(subject_test)

colnames(X_data) <- features[2,]
rlabel = factor(xlabel[,],labels=activity_labels[,2])
FullData <- cbind(subject,rlabel,X_data)
rm(X_data)
rm(xlabel)
rm(subject)
colnames(FullData)[1] <- "subject"
colnames(FullData)[2] <- "label"

write.table(FullData,"./data/HARTidyData.csv",sep=",",row.names=FALSE)
