#prend en argument un array en 3D, la derniere dim etant le nombre de joueurs concernes
courbesJ<-function(tab)
{

    
    nbJ<-dim(tab)[3]
    noms<-dimnames(tab)[[3]]
    
    #initialisation des matrix
    PTS<-matrix(1:82,nrow=82,ncol=nbJ+1,dimnames = list(NULL,c('G',noms)))
    AST<-matrix(1:82,nrow=82,ncol=nbJ+1,dimnames = list(NULL,c('G',noms)))
    TRB<-matrix(1:82,nrow=82,ncol=nbJ+1,dimnames = list(NULL,c('G',noms)))
    VCT<-matrix(1:82,nrow=82,ncol=nbJ+1,dimnames = list(NULL,c('G',noms)))
    
    for(k in 1:nbJ) {
      PTS[,k+1]<-cumsum(tab[,'PTS',k])
      AST[,k+1]<-cumsum(tab[,'AST',k])
      TRB[,k+1]<-cumsum(tab[,'TRB',k])
      VCT[,k+1]<-cumsum(tab[,'VCT',k])
    }

    PTS<-melt(as.data.frame(PTS),id.vars='G',value.name='value')
    AST<-melt(as.data.frame(AST),id.vars='G',value.name='value')
    TRB<-melt(as.data.frame(TRB),id.vars='G',value.name='value')
    VCT<-melt(as.data.frame(VCT),id.vars='G',value.name='value')

    p1<-ggplot(PTS,aes(x=G,y=value,color=variable))  +
          geom_line(size=1) + ylab("PTS") + xlab('') + 
          geom_dl(aes(label=variable),method=list(dl.trans(x = x + 0.4),'last.points')) +
          scale_colour_discrete(guide = 'none') +
          expand_limits(x=85)
    
    p2<-ggplot(AST,aes(x=G,y=value,color=variable)) +
          geom_line(size=1) + ylab("AST") + xlab('') +
          geom_dl(aes(label=variable),method=list(dl.trans(x = x + 0.4),'last.points')) +
          scale_colour_discrete(guide = 'none') +
          expand_limits(x=85)
    
    p3<-ggplot(TRB,aes(x=G,y=value,color=variable)) +
          geom_line(size=1) + ylab("TRB") + xlab('') +
          geom_dl(aes(label=variable),method=list(dl.trans(x = x + 0.4),'last.points')) +
          scale_colour_discrete(guide = 'none') +
          expand_limits(x=85)
    
    
    p4<-ggplot(VCT,aes(x=G,y=value,color=variable)) +
          geom_line(size=1) + ylab("VCT") + xlab('') +
          geom_dl(aes(label=variable),method=list(dl.trans(x = x + 0.4),'last.points')) +
          scale_colour_discrete(guide = 'none') +
          expand_limits(x=85)
    

    g1<-ggplotGrob(p1)
    g2<-ggplotGrob(p2)
    g3<-ggplotGrob(p3)
    g4<-ggplotGrob(p4)

    grid.arrange(g1,g2,g3,g4,ncol=2,nrow=2)

  
}