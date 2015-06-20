library("data.table”)
install.packages("dplyr”)
library("dplyr”)

sub_Train <- read.table("subject_train.txt", header = FALSE)
y_Train <- read.table("y_train.txt", header = FALSE)
X_Train <- read.table("X_train.txt", header = FALSE)

sub_Test <- read.table("subject_test.txt", header = FALSE)
y_Test <- read.table("y_test.txt", header = FALSE)
X_Test <- read.table("X_test.txt", header = FALSE)

sub <- rbind(sub_Train, sub_Test)
y <- rbind(y_Train, y_Test)
X <- rbind(X_Train, X_Test)

feat_names <- read.table("features.txt", header = FALSE)

colnames(X) <- t(feat_names[2])
colnames(y) <- “Activity”
colnames(sub) <- “Subject”

Dataset <- cbind(X, y, sub)

meanAndSTD <- grep("mean|STD", names(Dataset), ignore.case=TRUE)
meanAndSTD <- c(meanAndSTD, 562, 563)
smallData <- Dataset[,meanAndSTD]

act_labels <- read.table("activity_labels.txt", header = FALSE)

smallData[, 87] <- as.character(factor(smallData[, 87], labels = c("WALKING", "WALKING_UPSTAIRS", "WALKING_DOWNSTAIRS", "SITTING", "STANDING", "LAYING")))

names(smallData) <- gsub("^t", "Time", names(smallData))
names(smallData) <- gsub(“tBody", "TimeBody", names(smallData))
names(smallData) <- gsub("^f", "Frequency", names(smallData))
names(smallData) <- gsub("BodyBody", "Body", names(smallData))

smallData$Subject <- as.factor(smallData$Subject)
smallData <- data.table(smallData)

finalData <- aggregate(. ~Subject + Activity, smallData, mean)
write.table(finalData, file = "Tidy_Data.txt", row.names = FALSE)
