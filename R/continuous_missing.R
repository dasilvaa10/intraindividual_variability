continuous_missing<-function(data){

  cont_miss_counts<-list()

  for (i in 1:ncol(data)){
  
    tempdf<-cbind(sequence(rle(as.character(is.na(data[,i])))$lengths),is.na(data[,i]))
  
    if (sum(tempdf[,2]) != 0){
    
      tempdf_sub<-tempdf[tempdf[,2] == 1, ]
      
      if (length(tempdf_sub) <= 2){
        
        cont_miss_counts[[i]] <- 1
        
      } else {
        
        cont_miss_counts[[i]]<-max(tempdf_sub[,1])
      }
    
      names(cont_miss_counts)[i] <-names(data[,i])
    
    } else {
    
      cont_miss_counts[[i]]<-0
    
      names(cont_miss_counts)[i] <-names(data[,i])
    
    }
  
  }  

  out<-do.call("cbind", cont_miss_counts)
  
  return(out)

}