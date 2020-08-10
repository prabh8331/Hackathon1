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
#Train2<-mice(Train3,seed = 123,m=2,maxit = 2)
#Train2<-complete(Train2,2)
#Test2<-mice(Test3,seed = 123,m=2,maxit = 2)
#Test2<-complete(Test2,2)
