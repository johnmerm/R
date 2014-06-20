features <- read.table('features.txt',header=FALSE)
activities <- read.table('activity_labels.txt',header=FALSE)

f_selector <- sapply(as.character(features$V2),function(a){return(grepl('mean\\(\\)|std\\(\\)',a))})
sel_features <- subset(features,f_selector)

setwd('train')
x_train <- read.table('X_train.txt',header=FALSE)
colnames(x_train)<- features
y_train <- read.table('y_train.txt',header=FALSE)
colnames(y_train)<- c('Activity')
s_train <- read.table('subject_train.txt',header=FALSE)
colnames(s_train)<- c('Subject')


x_train_sel <- x_train[,sel_features$V2]
colnames(x_train_sel) <- sel_features$V2

dat_train <- cbind(s_train,x_train_sel,y_train)

setwd('../test')

x_test <- read.table('X_test.txt',header=FALSE)
colnames(x_test)<- features
y_test <- read.table('y_test.txt',header=FALSE)
colnames(y_test)<- c('Activity')
s_test <- read.table('subject_test.txt',header=FALSE)
colnames(s_test)<- c('Subject')


x_test_sel <- x_test[,sel_features$V2]
colnames(x_test_sel) <- sel_features$V2

dat_test <- cbind(s_test,x_test_sel,y_test)

setwd('..')

dat <- rbind(dat_train,dat_test)
dat$Activity <- activities$V2[dat$Activity]
#sa_dat will split the dat into groups of (sibject.Activiy)
sa_dat <- split(dat,list(as.factor(dat$Subject),dat$Activity))
#sm_dat will contain a dataset with cols being the variables & rows being the subject.activity combo (t for transpose)
sm_dat <- t(sapply(sa_dat,sapply,mean))
#tsm will drop out the first & last columns)
tsm <- sm_dat[,2:length(sel_features$V1)+1]

rNames <-data.frame(rownames(tsm))
colnames(rNames)<- 'Subject.Activity'

tsm <- cbind(rNames,tsm)
write.table(tsm,file='clean.txt',row.names=FALSE,col.names=TRUE)

