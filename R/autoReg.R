autoReg<-function(vector, lag=1){
  
  lp1<-lag+1
  
  s1<-vector[lp1:length(vector)]
    
  s2<-vector[1:(length(vector)-lag)]
    
  ar<-cor(s1,s2, use = "complete.obs")
    
  return(ar)
    
}