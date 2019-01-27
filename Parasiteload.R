#####libraries needed
library(MuMIn)
library(ggplot2) ##plot
library(broom) ## for model table clean up
library(dplyr) ##for data manipulation
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
tick.data<- as.data.frame(tick.data)
#################
#####################
########################logistic regression
#we will use glm function in R to understand the influence of one (or all) of the 
######predictor varaibles 
########seeing the correlation of predictore varaibles, they should be independent
cor(humid,temp.c)
cor(humid,tick)
cor(temp.c,tick)
m1<- glm(parasite~1, data=tick.data, family=binomial)
m2<- glm(parasite~tick,data=tick.data, family=binomial)
m3<-  glm(parasite~temp.c,data=tick.data, family=binomial)
m4<-  glm(parasite~humid,data=tick.data, family=binomial)
m5<-  glm(parasite~temp.c+humid,data=tick.data, family=binomial)
m6<-  glm(parasite~temp.c+humid+tick,data=tick.data, family=binomial)
m7<-  glm(parasite~temp.c+humid*tick,data=tick.data, family=binomial)
m8<- glm(parasite~humid*tick,data=tick.data, family=binomial)
m9<- glm(parasite~temp.c*tick,data=tick.data, family=binomial)
m10<- glm(parasite~humid+temp.c*tick,data=tick.data, family=binomial)
############
###################Create a summary of the model results
out.put<- model.sel(m1,m2,m3,m4,m5,m6,m7,m8,m9,m10)
####select top models with delta AIC<2
out.sub<-subset(out.put, 1:8)
sel.table<-as.data.frame(out.sub)[7:11] 
#rounding things  
sel.table<- round(sel.table,1) 
##  put the model names in a column 
sel.table$Model<-rownames(sel.table) 
# replace Model name with formulas 
for(i in 1:nrow(sel.table)) sel.table$Model[i]<- as.character(formula(paste(sel.table$Model[i])))[3] 
# check the table
sel.table 
#reordering of columns 
sel.table<-sel.table[,c(6,1,3, 4,5,2)] 
###############
###################
#######finding estimates of top five models
##topfive models single param
tm1.1<-as.data.frame(tidy(m4))
tm1.2<-as.data.frame(confint(m4, level=0.95))
tm.1<-as.data.frame(c(tm1.1,tm1.2))
tm2.1<-as.data.frame(tidy(m1))
tm2.2<-as.data.frame(confint(m1, level=0.95))
tm.2<-as.data.frame(c(tm2.1,tm2.2))
tm3.1<-as.data.frame(tidy(m5))
tm3.2<-as.data.frame(confint(m5, level=0.95))
tm.3<-as.data.frame(c(tm3.1,tm3.2))
tm4.1<-as.data.frame(tidy(m3))
tm4.2<-as.data.frame(confint(m3, level=0.95))
tm.4<-as.data.frame(c(tm4.1,tm4.2))
top.5.models<-bind_rows(tm.1,tm.2,tm.3,tm.4)
top.5.models
