#prend en argument un dataframe issu de basketreference via read.csv()

treatment<-function(data)
{
  #Recuperation des valeurs brutes
  stat<-subset(data,select=c('PTS','AST','TRB'))
  
  #Creation du vecteur victoire
  pos_vct<-grep("W",data$X.1)
  vct<-rep(0,82)
  vct[pos_vct]<-1
  
  #creation de la matrice finale pour 82 matchs
  statJ<-matrix(nrow=82,ncol=5)
  
  #indice du match en 1
  statJ[,1]<-1:82
  #PTS, AST et TRB ensuite
  statJ[,2:4]<-as.integer(as.matrix(stat))
  #victoires pour finir
  statJ[,5]<-vct
  
  #on remplace les valeurs NA (DNP, DND, INJ) par des 0
  statJ[is.na(statJ)]<-0
  
  statJ
  
}