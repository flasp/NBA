library(ggplot2)
library(reshape2)
library(gtable)
library(gridExtra)



RW<-treatment(read.csv('./2016-2017/RW.csv',header=TRUE,sep=","))
JH<-treatment(read.csv('./2016-2017/JH.csv',header=TRUE,sep=","))
KL<-treatment(read.csv('./2016-2017/KL.csv',header=TRUE,sep=","))
LBJ<-treatment(read.csv('./2016-2017/LBJ.csv',header=TRUE,sep=","))
IT<-treatment(read.csv('./2016-2017/IT.csv',header=TRUE,sep=","))

stat<-array(c(RW,JH,KL,LBJ,IT),dim=c(82,5,5),dimnames=list(NULL,dimnames(RW)[[2]],c('RW','JH','KL','LBJ','IT')))


courbesJ(stat)

