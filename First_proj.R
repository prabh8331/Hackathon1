#My first r project
#Import trian and test data 
FTest<-readRDS("FTest.RDS")
STest<-readRDS("STest.RDS")
FTrain<-readRDS("FTrain.RDS")
STrain<-readRDS("STrain.RDS")

#Check NA's
sum(is.na(FTest))
colSums(is.na(FTest))
sum(is.na(FTrain))
colSums(is.na(FTrain))
sum(is.na(STest))
colSums(is.na(STest))
sum(is.na(STrain))
colSums(is.na(STrain))

#See names of variables
names(STest)
names(FTest)
names(STrain)
names(FTrain)

#Storing Id column for future use
TestID<-FTest$ID
TrainID<-FTrain$ID

#sorting STest& STrain by its ID column
STest<-STest[order(STest$ID),]
STrain<-STrain[order(STrain$Id),]

#Creating Testing and Traning data
Test1<-data.frame(STest[,-1],FTest[,-1])
Train1<-data.frame(STrain[,-1],FTrain[,-1])

#checking corsponding variables
names(Test1)
names(Train1)

#quick view on NA's 
sum(is.na(Train1))
colSums(is.na(Train1))
sum(is.na(Test1))
colSums(is.na(Test1))

#Checking structure 
str(Train1)
str(Test1)

#Converting data into correct datatype 
#Train
Train1$Satisfaction<-as.factor(Train1$Satisfaction)
Train1$Class<-as.factor(Train1$Class)
Train1$Seat_comfort<-as.factor(Train1$Seat_comfort)
Train1$Gate_location<-as.factor(Train1$Gate_location)
Train1$Inflightwifi_service<-as.factor(Train1$Inflightwifi_service)
Train1$Inflight_entertainment<-as.factor(Train1$Inflight_entertainment)
Train1$Online_support<-as.factor(Train1$Online_support)
Train1$Ease_of_Onlinebooking<-as.factor(Train1$Ease_of_Onlinebooking)
Train1$Leg_room_service<-as.factor(Train1$Leg_room_service)
Train1$Baggage_handling<-as.factor(Train1$Baggage_handling)
Train1$Checkin_service<-as.factor(Train1$Checkin_service)
Train1$Cleanliness<-as.factor(Train1$Cleanliness)
Train1$Online_boarding<-as.factor(Train1$Online_boarding)
Train1$Gender<-as.factor(Train1$Gender)
Train1$Satisfaction<-as.factor(Train1$Satisfaction)
Train1$Departure.Arrival.time_convenient<-as.factor(Train1$Departure.Arrival.time_convenient)
Train1$Food_drink<-as.factor(Train1$Food_drink)
Train1$Onboard_service<-as.factor(Train1$Onboard_service)
Train1$CustomerType<-as.factor(Train1$CustomerType)
Train1$Class<-as.factor(Train1$Class)
Train1$TypeTravel<-as.factor(Train1$TypeTravel)

#Test
Test1$TypeTravel<-as.factor(Test1$TypeTravel)
Test1$Gender<-as.factor(Test1$Gender)
Test1$Class<-as.factor(Test1$Class)
Test1$Seat_comfort<-as.factor(Test1$Seat_comfort)
Test1$Gate_location<-as.factor(Test1$Gate_location)
Test1$Inflightwifi_service<-as.factor(Test1$Inflightwifi_service)
Test1$Inflight_entertainment<-as.factor(Test1$Inflight_entertainment)
Test1$Online_support<-as.factor(Test1$Online_support)
Test1$Ease_of_Onlinebooking<-as.factor(Test1$Ease_of_Onlinebooking)
Test1$Leg_room_service<-as.factor(Test1$Leg_room_service)
Test1$Baggage_handling<-as.factor(Test1$Baggage_handling)
Test1$Checkin_service<-as.factor(Test1$Checkin_service)
Test1$Cleanliness<-as.factor(Test1$Cleanliness)
Test1$Online_boarding<-as.factor(Test1$Online_boarding)
Test1$Departure.Arrival.time_convenient<-as.factor(Test1$Departure.Arrival.time_convenient)
Test1$Food_drink<-as.factor(Test1$Food_drink)
Test1$Onboard_service<-as.factor(Test1$Onboard_service)
Test1$CustomerType<-as.factor(Test1$CustomerType)
Test1$Class<-as.factor(Test1$Class)

#quick check on str and summary
str(Train1)
str(Test1)
summary(Train1)
summary(Test1)

#Save Train and Test data 
saveRDS(Train1,"Train1.RDS")
saveRDS(Test1,"Test1.RDS")

#Tried mice but not giving good resultes 
#library(mice)
#Train1<-mice(Train1,seed = 123,m=2,maxit = 2)
#Train1<-complete(Train1,2)
#Test1<-mice(Test1,seed = 123,m=2,maxit = 2)
#Test1<-complete(Test1,2)


###Renaming lables for ease
#Testing
levels(Test1$Seat_comfort)
Test1$Seat_comfort<-factor(Test1$Seat_comfort,levels = c("extremely poor","poor","need improvement","acceptable","good","excellent"),labels=c(0,1,2,3,4,5))
levels(Test1$Gate_location)
Test1$Gate_location<-factor(Test1$Gate_location,levels = c("very inconvinient","Inconvinient","need improvement","manageable","Convinient","very convinient"),labels=c(0,1,2,3,4,5))
levels(Test1$Inflightwifi_service)
Test1$Inflightwifi_service<-factor(Test1$Inflightwifi_service,levels = c("extremely poor","poor","need improvement","acceptable","good","excellent"),labels=c(0,1,2,3,4,5))
levels(Test1$Inflight_entertainment)
Test1$Inflight_entertainment<-factor(Test1$Inflight_entertainment,levels = c("extremely poor","poor","need improvement","acceptable","good","excellent"),labels=c(0,1,2,3,4,5))
levels(Test1$Online_support)
Test1$Online_support<-factor(Test1$Online_support,levels = c("extremely poor","poor","need improvement","acceptable","good","excellent"),labels=c(0,1,2,3,4,5))
levels(Test1$Ease_of_Onlinebooking)
Test1$Ease_of_Onlinebooking<-factor(Test1$Ease_of_Onlinebooking,levels = c("extremely poor","poor","need improvement","acceptable","good","excellent"),labels=c(0,1,2,3,4,5))
levels(Test1$Leg_room_service)
Test1$Leg_room_service<-factor(Test1$Leg_room_service,levels = c("extremely poor","poor","need improvement","acceptable","good","excellent"),labels=c(0,1,2,3,4,5))
levels(Test1$Baggage_handling)
Test1$Baggage_handling<-factor(Test1$Baggage_handling,levels = c("extremely poor","poor","need improvement","acceptable","good","excellent"),labels=c(0,1,2,3,4,5))
levels(Test1$Checkin_service)
Test1$Checkin_service<-factor(Test1$Checkin_service,levels = c("extremely poor","poor","need improvement","acceptable","good","excellent"),labels=c(0,1,2,3,4,5))
levels(Test1$Cleanliness)
Test1$Cleanliness<-factor(Test1$Cleanliness,levels = c("extremely poor","poor","need improvement","acceptable","good","excellent"),labels=c(0,1,2,3,4,5))
levels(Test1$Online_boarding)
Test1$Online_boarding<-factor(Test1$Online_boarding,levels = c("extremely poor","poor","need improvement","acceptable","good","excellent"),labels=c(0,1,2,3,4,5))
levels(Test1$Departure.Arrival.time_convenient)
Test1$Departure.Arrival.time_convenient<-factor(Test1$Departure.Arrival.time_convenient,levels = c("extremely poor","poor","need improvement","acceptable","good","excellent"),labels=c(0,1,2,3,4,5))
levels(Test1$Food_drink)
Test1$Food_drink<-factor(Test1$Food_drink,levels = c("extremely poor","poor","need improvement","acceptable","good","excellent"),labels=c(0,1,2,3,4,5))
levels(Test1$Onboard_service)
Test1$Onboard_service<-factor(Test1$Onboard_service,levels = c("extremely poor","poor","need improvement","acceptable","good","excellent"),labels=c(0,1,2,3,4,5))
levels(Test1$Gender)
Test1$Gender<-factor(Test1$Gender,levels = c("Female","Male"),labels=c(0,1))
levels(Test1$CustomerType)
Test1$CustomerType<-factor(Test1$CustomerType,levels = c("disloyal Customer", "Loyal Customer"),labels=c(0,1))
levels(Test1$TypeTravel)
Test1$TypeTravel<-factor(Test1$TypeTravel,levels = c("Business travel", "Personal Travel"),labels=c(0,1))
levels(Test1$Class)
Test1$Class<-factor(Test1$Class,levels = c("Business","Eco","Eco Plus"),labels=c(0,1,3))

#Training 
levels(Train1$Seat_comfort)
Train1$Seat_comfort<-factor(Train1$Seat_comfort,levels = c("extremely poor","poor","need improvement","acceptable","good","excellent"),labels=c(0,1,2,3,4,5))
levels(Train1$Gate_location)
Train1$Gate_location<-factor(Train1$Gate_location,levels = c("very inconvinient","Inconvinient","need improvement","manageable","Convinient","very convinient"),labels=c(0,1,2,3,4,5))
levels(Train1$Inflightwifi_service)
Train1$Inflightwifi_service<-factor(Train1$Inflightwifi_service,levels = c("extremely poor","poor","need improvement","acceptable","good","excellent"),labels=c(0,1,2,3,4,5))
levels(Train1$Inflight_entertainment)
Train1$Inflight_entertainment<-factor(Train1$Inflight_entertainment,levels = c("extremely poor","poor","need improvement","acceptable","good","excellent"),labels=c(0,1,2,3,4,5))
levels(Train1$Online_support)
Train1$Online_support<-factor(Train1$Online_support,levels = c("extremely poor","poor","need improvement","acceptable","good","excellent"),labels=c(0,1,2,3,4,5))
levels(Train1$Ease_of_Onlinebooking)
Train1$Ease_of_Onlinebooking<-factor(Train1$Ease_of_Onlinebooking,levels = c("extremely poor","poor","need improvement","acceptable","good","excellent"),labels=c(0,1,2,3,4,5))
levels(Train1$Leg_room_service)
Train1$Leg_room_service<-factor(Train1$Leg_room_service,levels = c("extremely poor","poor","need improvement","acceptable","good","excellent"),labels=c(0,1,2,3,4,5))
levels(Train1$Baggage_handling)
Train1$Baggage_handling<-factor(Train1$Baggage_handling,levels = c("extremely poor","poor","need improvement","acceptable","good","excellent"),labels=c(0,1,2,3,4,5))
levels(Train1$Checkin_service)
Train1$Checkin_service<-factor(Train1$Checkin_service,levels = c("extremely poor","poor","need improvement","acceptable","good","excellent"),labels=c(0,1,2,3,4,5))
levels(Train1$Cleanliness)
Train1$Cleanliness<-factor(Train1$Cleanliness,levels = c("extremely poor","poor","need improvement","acceptable","good","excellent"),labels=c(0,1,2,3,4,5))
levels(Train1$Online_boarding)
Train1$Online_boarding<-factor(Train1$Online_boarding,levels = c("extremely poor","poor","need improvement","acceptable","good","excellent"),labels=c(0,1,2,3,4,5))
levels(Train1$Departure.Arrival.time_convenient)
Train1$Departure.Arrival.time_convenient<-factor(Train1$Departure.Arrival.time_convenient,levels = c("extremely poor","poor","need improvement","acceptable","good","excellent"),labels=c(0,1,2,3,4,5))
levels(Train1$Food_drink)
Train1$Food_drink<-factor(Train1$Food_drink,levels = c("extremely poor","poor","need improvement","acceptable","good","excellent"),labels=c(0,1,2,3,4,5))
levels(Train1$Onboard_service)
Train1$Onboard_service<-factor(Train1$Onboard_service,levels = c("extremely poor","poor","need improvement","acceptable","good","excellent"),labels=c(0,1,2,3,4,5))
levels(Train1$Satisfaction)
Train1$Satisfaction<-factor(Train1$Satisfaction,levels = c("neutral or dissatisfied","satisfied"),labels=c(0,1))
levels(Train1$Gender)
Train1$Gender<-factor(Train1$Gender,levels = c("Female","Male"),labels=c(0,1))
levels(Train1$CustomerType)
Train1$CustomerType<-factor(Train1$CustomerType,levels = c("disloyal Customer", "Loyal Customer"),labels=c(0,1))
levels(Train1$TypeTravel)
Train1$TypeTravel<-factor(Train1$TypeTravel,levels = c("Business travel", "Personal Travel"),labels=c(0,1))
levels(Train1$Class)
Train1$Class<-factor(Train1$Class,levels = c("Business","Eco","Eco Plus"),labels=c(0,1,3))

#Quick check
summary(Train1)
str(Train1)
summary(Test1)
str(Test1)

#saveRDS(Train1,"Train1.RDS")
#saveRDS(Test1,"Test1.RDS")


#####Dealing With NA's
#See the distribution of NA's using mice package
library(mice)
md.pattern(Test1)
md.pattern(Train1)

#looking data with NA,s
Test1[which(!complete.cases(Test1)),]

#Replacing NA's with MODE, MEAN or MEDIAN 
#Test data
Test1$Departure.Arrival.time_convenient[which(!complete.cases(Test1$Departure.Arrival.time_convenient))]<-"4"
Test1$Food_drink[which(!complete.cases(Test1$Food_drink))]<-"3"
Test1$Onboard_service[which(!complete.cases(Test1$Onboard_service))]<-"4"
Test1$Cleanliness[which(!complete.cases(Test1$Cleanliness))]<-"4"
Test1$Online_boarding[which(!complete.cases(Test1$Online_boarding))]<-"4"
Test1$CustomerType[which(!complete.cases(Test1$CustomerType))]<-"1"
Test1$TypeTravel[which(!complete.cases(Test1$TypeTravel))]<-"0"
Test1$ArrivalDelayin_Mins[which(!complete.cases(Test1$ArrivalDelayin_Mins))]<-0
summary(Test1)

#Train data
Train1$Seat_comfort[which(!complete.cases(Train1$Seat_comfort))]<-"3"
Train1$Departure.Arrival.time_convenient[which(!complete.cases(Train1$Departure.Arrival.time_convenient))]<-"4"
Train1$Food_drink[which(!complete.cases(Train1$Food_drink))]<-"3"
Train1$Gate_location[which(!complete.cases(Train1$Gate_location))]<-"3"
Train1$Inflightwifi_service[which(!complete.cases(Train1$Inflightwifi_service))]<-"4"
Train1$Inflight_entertainment[which(!complete.cases(Train1$Inflight_entertainment))]<-"4"
Train1$Online_support[which(!complete.cases(Train1$Online_support))]<-"4"
Train1$Ease_of_Onlinebooking[which(!complete.cases(Train1$Ease_of_Onlinebooking))]<-"4"
Train1$Onboard_service[which(!complete.cases(Train1$Onboard_service))]<-"4"
Train1$Leg_room_service[which(!complete.cases(Train1$Leg_room_service))]<-"4"
Train1$Baggage_handling[which(!complete.cases(Train1$Baggage_handling))]<-"4"
Train1$Checkin_service[which(!complete.cases(Train1$Checkin_service))]<-"4"
Train1$Gender[which(!complete.cases(Train1$Gender))]<-"0"
Train1$CustomerType[which(!complete.cases(Train1$CustomerType))]<-"1"
Train1$Age[which(!complete.cases(Train1$Age))]<-mean(Train1$Age,na.rm=TRUE)
Train1$TypeTravel[which(!complete.cases(Train1$TypeTravel))]<-"0"
Train1$DepartureDelayin_Mins[which(!complete.cases(Train1$DepartureDelayin_Mins))]<-0
Train1$ArrivalDelayin_Mins[which(!complete.cases(Train1$ArrivalDelayin_Mins))]<-0

boxplot(Train1$ArrivalDelayin_Mins,col = "lightblue",main="Boxplots")
points(mean(Train1$ArrivalDelayin_Mins),col="red",pch=4)
summary(Train1)

#saveRDS(Train1,"Train1.RDS")
#saveRDS(Test1,"Test1.RDS")


##Model giving best result
#install.packages("randomForestSRC")
library(randomForestSRC)
rf<-rfsrc(Satisfaction~.,data = Train1[,-c(21,22)],mtry = 11)

prediction<-predict.rfsrc(rf,Test1[,-c(20,21)])
Submission<-data.frame(ID=TestID,Satisfaction=prediction$class)
write.csv(Submission,"Submission.csv",row.names = FALSE)






