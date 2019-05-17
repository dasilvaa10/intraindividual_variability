autoReg<-function(vector, lag=1){
  
  prop_miss<-sum(is.na(vector))/length(vector)
  
  if (prop_miss!=0){
    
    warning(prop_miss, "% of your data is missing, lag will not truly be as specified")
    
  }
  
  lp1<-lag+1
  
  s1<-vector[lp1:length(vector)]
    
  s2<-vector[1:(length(vector)-lag)]
    
  ar<-cor(s1,s2, use = "complete.obs")
    
  return(ar)
    
}