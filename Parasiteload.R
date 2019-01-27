#####simulate some data for logistic regression
#######case study= parasite load above 50000IU in dogs depends on the number of ticks
########temperature and humidity levels (%)
parasite<- data.para<-sample(c(0,1), replace=TRUE, size=100)###parasite load >5000IU
##number of ticks 
tick<-  sample(seq(0,15,1),replace=T,size=100)
######temperature in degree centigrade
temp.c<-  sample(seq(25,38,0.5),replace=T,size=100)
######humidity in percentage
humid<- sample(seq(65,95,1),replace=T,size=100)
###create data
tick.data<- cbind(parasite,tick,temp.c,humid)
head(tick.data)
summary(tick.data)
#################
#####################
########################logistic regression
#we will use glm function in R to understand the influence of one (or all) of the 
######predictor varaibles in R
