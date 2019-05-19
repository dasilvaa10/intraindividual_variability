mssd<-function(vector, lag=1, rmssd = FALSE){
  
  prop_miss<-sum(is.na(vector))/length(vector)
  
  if (prop_miss!=0){
    
    warning(prop_miss, "% of your data is missing, lag will not truly be as specified")
    
  }
  
  vector<-na.omit(vector)
  
  lp1<-lag+1
  
  s1<-vector[lp1:length(vector)]
  
  s2<-vector[1:(length(vector)-lag)]
  
  mssd<-sum((s1-s2)^2)/(length(vector) - 1)
  
  if (rmssd == TRUE) {
    
    mssd<-sqrt(mssd)
    
  }
  
  return(mssd)
  
}