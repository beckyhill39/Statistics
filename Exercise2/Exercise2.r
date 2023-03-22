#Init
install.packages("psych")
install.packages("dplyr")
install.packages("jtools")
library(psych)
library
library(jtools)
read.csv("ESS_UK_ES2.csv")
ESS2<- read.csv("ESS_UK_ES2.csv")
#Making a Linear Model of regression
x2m1<-lm(data=ESS2, internet~age)
summ(x2m1)
library(jtools)
#Calculating standardised regression coefficients 
summ(x2m1, scale=TRUE,transform.response=TRUE)
plot(ESS2$age, ESS2$internet,abline(x2m1))
#Multi-variable Regression 
x2m2<-lm(data=ESS2,internet~age+happy)
summ(x2m2)
summ(x2m2,digits=3)
#Exercise1
x2m3<-lm(data=ESS2,happy~age+relig+equality+internet)
summ(x2m3)
summ(x2m3, scale=TRUE,transform.response=TRUE)
summ(x2m3,digits=3)
#Hierarchical Regression
essh<-select(ESS2,age,internet,happy)
essh<-na.omit(essh)
x2m1h<-lm(data=essh,internet~age)
x2m2h<-lm(data=essh,internet~age+happy)
summ(x2m1h)
anova(x2m1h,x2m2h)
#Exercise3
E3<-select(ESS2,happy,equality,relig,unsafe,internet)
E3<-na.omit(E3)
Block1<-lm(data=E3,happy~equality+relig)
Block2<-lm(data=E3,happy~equality+relig+unsafe+internet)
anova(Block1,Block2)
summ(Block1)
summ(Block2)
summ(Block1,scale=TRUE,transform.response=TRUE)
summ(Block2,scale=TRUE,transform.response=TRUE)
anova(Block1,Block2)
#ExamQuestions
EQ<-select(ESS2,relig,happy,unsafe,trustpols)
EQ<-na.omit(EQ)
EQ1<-lm(data=EQ,trustpols~relig)
EQ2<-lm(data=EQ,trustpols~relig+happy+unsafe)
summ(EQ1)
summ(EQ2)
anova(EQ1,EQ2)